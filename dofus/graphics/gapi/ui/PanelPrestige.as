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
_global.dofus["\r\x14"].gapi.ui.PanelPrestige = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.PanelPrestige.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.PanelPrestige.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.PanelPrestige.CLASS_NAME);
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
   this._btnUp.addEventListener("click",this);
   this._btnUp.addEventListener("over",this);
   this._btnUp.addEventListener("out",this);
   this._btnPass.addEventListener("click",this);
   this._btnPass.addEventListener("over",this);
   this._btnPass.addEventListener("out",this);
   this._btnPrestige1.addEventListener("click",this);
   this._btnPrestige1.addEventListener("over",this);
   this._btnPrestige1.addEventListener("out",this);
   this._btnPrestige2.addEventListener("click",this);
   this._btnPrestige2.addEventListener("over",this);
   this._btnPrestige2.addEventListener("out",this);
   this._btnPrestige3.addEventListener("click",this);
   this._btnPrestige3.addEventListener("over",this);
   this._btnPrestige3.addEventListener("out",this);
   this._btnPrestige4.addEventListener("click",this);
   this._btnPrestige4.addEventListener("over",this);
   this._btnPrestige4.addEventListener("out",this);
   this._btnPrestige5.addEventListener("click",this);
   this._btnPrestige5.addEventListener("over",this);
   this._btnPrestige5.addEventListener("out",this);
   this._btnPrestige6.addEventListener("click",this);
   this._btnPrestige6.addEventListener("over",this);
   this._btnPrestige6.addEventListener("out",this);
   this._btnPrestige7.addEventListener("click",this);
   this._btnPrestige7.addEventListener("over",this);
   this._btnPrestige7.addEventListener("out",this);
   this._btnPrestige8.addEventListener("click",this);
   this._btnPrestige8.addEventListener("over",this);
   this._btnPrestige8.addEventListener("out",this);
   this._btnPrestige9.addEventListener("click",this);
   this._btnPrestige9.addEventListener("over",this);
   this._btnPrestige9.addEventListener("out",this);
   this._btnPrestige10.addEventListener("click",this);
   this._btnPrestige10.addEventListener("over",this);
   this._btnPrestige10.addEventListener("out",this);
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
   this._bg.title = "Panel Prestige";
   this._btnPass.label = "Passer prestige";
   this._btnPrestige1.label = "Bonus Prestige 1";
   this._btnPrestige2.label = "Bonus Prestige 2";
   this._btnPrestige3.label = "Bonus Prestige 3";
   this._btnPrestige4.label = "Bonus Prestige 4";
   this._btnPrestige5.label = "Bonus Prestige 5";
   this._btnPrestige6.label = "Bonus Prestige 6";
   this._btnPrestige7.label = "Bonus Prestige 7";
   this._btnPrestige8.label = "Bonus Prestige 8";
   this._btnPrestige9.label = "Bonus Prestige 9";
   this._btnPrestige10.label = "Bonus Prestige 10";
   this._btnTitle.label = this.api.lang.getText("BOUTON_TITRE");
};
_loc1.initData = function()
{
   this._btnPass.enabled = this.api.datacenter.Player.Level >= 200;
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
   this._svCharacter.zoom = 150;
   this._svCharacter.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.spriteData = this.api.datacenter.Player.data;
   var _loc3_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svCharacter.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc5_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc5_ + ".swf",undefined,5);
   _loc4_.accessories = _loc3_.accessories;
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !var2;
   this._svCharacter.sourceSpriteData = _loc3_;
   this._svCharacter.spriteData = _loc4_;
   this._svCharacter.setColors(this._oColors);
};
_loc1.click = function(oEvent)
{
   var _loc3_ = null;
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnCancel)
   {
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPass)
   {
      this.api.network.send("XDZ");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige1)
   {
      this.api.network.send("kU");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige2)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc2","PanelPrestigeDesc2");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige3)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc3","PanelPrestigeDesc3");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige4)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc4","PanelPrestigeDesc4");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige5)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc5","PanelPrestigeDesc5");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige6)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc6","PanelPrestigeDesc6");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige7)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc7","PanelPrestigeDesc7");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige8)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc8","PanelPrestigeDesc8");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige9)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc9","PanelPrestigeDesc9");
      this.gapi.unloadUIComponent("PanelPrestige");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPrestige10)
   {
      this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc10","PanelPrestigeDesc10");
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
_global.dofus["\r\x14"].gapi.ui.PanelPrestige.CLASS_NAME = "PanelPrestige";
Object.registerClass("UI_PanelPrestige",dofus["\r\x14"].gapi.ui.PanelPrestige);
