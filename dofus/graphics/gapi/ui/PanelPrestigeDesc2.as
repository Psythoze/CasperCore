if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].gapi)
{
   _global.dofus["\r\x14"].gapi = new Object();
}
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
_global.dofus["\r\x14"].gapi.ui.PanelPrestigeDesc2 = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.PanelPrestigeDesc2.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.PanelPrestigeDesc2.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.PanelPrestigeDesc2.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnCancel.addEventListener("click",this);
   this._btnBack.addEventListener("click",this);
   this._btnUp.addEventListener("click",this);
   this._btnUp.addEventListener("over",this);
   this._btnUp.addEventListener("out",this);
   this._btnTitle.addEventListener("click",this);
   this._btnTitle.addEventListener("over",this);
   this._btnTitle.addEventListener("out",this);
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnUp:
         this.gapi.showTooltip(this.api.lang.getText("PRESTIGE_MONTER"),_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnTitle:
         this.gapi.showTooltip(this.api.lang.getText("PRESTIGE_TITLE"),_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
   }
};
_loc1.initTexts = function()
{
   this._bg.title = "Panel Bonus Prestige 2";
   this._btnBack.label = "Retour";
   this._btnCancelT.label = "Fermer le panel";
   this._btnUp.label = "Passer prestige";
   this._lblName.label = "Bonus Prestige 1";
   this._btnPrestige1.label = "Bonus Prestige 1";
   this._btnPrestige2.label = "Bonus Prestige 2";
   this._btnTitle.label = this.api.lang.getText("BOUTON_TITRE");
};
_loc1.initData = function()
{
   this._btnUp.enabled = this.api.datacenter.Player.Level >= 200;
   this._pb2._width = Math.ceil(0.167 * this.api.datacenter.Player.Level);
   this._lblinfos.text = this.api.lang.getText("PRESTIGE_INFOS");
   var _loc2_ = this.api.datacenter.Player;
   this._lblprestige.text = "Niveaux " + _loc2_.Level;
   this.MPV.text = this.playerInfo.split("|")[6];
   this.initPlayer();
};
_loc1.initPrestige = function(_loc2_)
{
   this._lblprestige2.text = String("Prestige " + _loc2_);
};
_loc1.setSpriteAccessories = function(_loc3_)
{
   if(_loc3_.length != 0)
   {
      var _loc9_ = new Array();
      var _loc6_ = _loc3_.split(",");
      var _loc2_ = 0;
      while(_loc2_ < _loc6_.length)
      {
         if(_loc6_[_loc2_].indexOf("~") != -1)
         {
            var _loc5_ = _loc6_[_loc2_].split("~");
            var _loc4_ = _global.parseInt(_loc5_[0],16);
            var _loc7_ = _global.parseInt(_loc5_[1]);
            _loc3_ = _global.parseInt(_loc5_[2]) - 1;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
         }
         else
         {
            _loc4_ = _global.parseInt(_loc6_[_loc2_],16);
            _loc7_ = undefined;
            _loc3_ = undefined;
         }
         if(!_global.isNaN(_loc4_))
         {
            var _loc8_ = new dofus.datacenter["\x11"](_loc4_,_loc7_,_loc3_);
            _loc9_[_loc2_] = _loc8_;
         }
         _loc2_ += 1;
      }
      return _loc9_;
   }
};
_loc1.initPlayer = function()
{
   this._svCharacter.zoom = 250;
   this._svCharacter.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.spriteData = this.api.datacenter.Player.data;
};
_loc1.click = function(oEvent)
{
   var _loc3_ = null;
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnCancel)
   {
      this.gapi.unloadUIComponent("PanelPrestigeDesc2");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnBack)
   {
      this.api.network.send("kH");
      this.gapi.unloadUIComponent("PanelPrestigeDesc2");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnUp)
   {
      this.api.network.send("XDZ");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige1)
   {
      this.api.network.send("test");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige2)
   {
      this.api.network.send("test");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
};
_loc1.yes = function(oEvent)
{
   var _loc2_ = null;
   _loc2_ = oEvent.target._name;
   if(oEvent.target._name === "AskYesNoConfirm")
   {
      this.valid(true);
   }
};
_loc1.__set__player = function(sData)
{
   this.playerInfo = sData;
};
_loc1.addProperty("player",function()
{
}
,_loc1.__set__player);
ASSetPropFlags(_loc1,null,1);
_loc1.playerInfo = "";
_global.dofus["\r\x14"].gapi.ui.PanelPrestigeDesc2.CLASS_NAME = "PanelPrestigeDesc2";
Object.registerClass("UI_PanelPrestigeDesc2",dofus["\r\x14"].gapi.ui.PanelPrestigeDesc2);
