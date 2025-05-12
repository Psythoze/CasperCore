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
_global.dofus["\r\x14"].gapi.ui.PanelNew = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.PanelNew.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.PanelNew.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.PanelNew.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   var _loc2_ = this.api.kernel.OptionsManager;
   this._btnCancel.addEventListener("click",this);
   this._btnUp.addEventListener("click",this);
   this._btnUp.addEventListener("over",this);
   this._btnUp.addEventListener("out",this);
   this._btnTitle.addEventListener("click",this);
   this._btnTitle.addEventListener("over",this);
   this._btnTitle.addEventListener("out",this);
   this._mcTabViewer._btnOneW.selected = _loc2_.getOption("OneW");
   this._btnOneW.addEventListener("click",this);
   this._btnOneW.addEventListener("over",this);
   this._btnOneW.addEventListener("out",this);
   this._btnPass.addEventListener("click",this);
   this._btnPass.addEventListener("over",this);
   this._btnPass.addEventListener("out",this);
   this._btnMoveMule.addEventListener("click",this);
   this._btnMoveMule.addEventListener("over",this);
   this._btnMoveMule.addEventListener("out",this);
   this._btnMInvoc.addEventListener("click",this);
   this._btnMInvoc.addEventListener("over",this);
   this._btnMInvoc.addEventListener("out",this);
   this._btnDjModu.addEventListener("click",this);
   this._btnDjModu.addEventListener("over",this);
   this._btnDjModu.addEventListener("out",this);
   this._btnFarm.addEventListener("click",this);
   this._btnFarm.addEventListener("over",this);
   this._btnFarm.addEventListener("out",this);
   this._btnIPKamas.addEventListener("click",this);
   this._btnIPKamas.addEventListener("over",this);
   this._btnIPKamas.addEventListener("out",this);
   this._btnIPDrop.addEventListener("click",this);
   this._btnIPDrop.addEventListener("over",this);
   this._btnIPDrop.addEventListener("out",this);
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
      case this._btnOneW:
         this.gapi.showTooltip("Continuer votre aventure sur Incarnam, ce choix est définitif, vous ne pouvez pas retourner en arrière.",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnPass:
         this.gapi.showTooltip("Suivez le Tutoriel de Naeris, à la fin de cette action vous retournerez à Incarnam.",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnMoveMule:
         this.gapi.showTooltip("Permet d\'Activer ou désactiver les mules suiveurs. ",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnMInvoc:
         this.gapi.showTooltip("Permet d\'Activer ou désactiver le mode Contrôle d\'invocation sur votre maître et mules",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnDjModu:
         this.gapi.showTooltip("Permet d\'Activer ou désactiver le donjon modulaire. ",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnFarm:
         this.gapi.showTooltip("Permet d\'Activer ou désactiver le mode Farm ( Jet minimum au drop )",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnIPKamas:
         this.gapi.showTooltip("Permet d\'Activer ou désactiver l\'IP Kamas sur vos mules.",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnIPDrop:
         this.gapi.showTooltip("Permet d\'Activer ou désactiver l\'IP Drop sur vos mules. ",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case this._btnTitle:
         this.gapi.showTooltip(this.api.lang.getText("PRESTIGE_TITLE"),_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
   }
};
_loc1.initTexts = function()
{
   this._btnAcW.text = "Activer/Désac One window";
   var _loc2_ = this.api.datacenter.Player;
   this._bg.title = "Bienvenue sur Naeris " + _loc2_.Name;
   this._btnPass.label = "Tutoriel";
   this._btnOneW.label = "Incarnam";
   this._btnDjModu.label = "Activer/Désac";
   this._btnFarm.label = "Activer/Désac";
   this._btnMoveMule.label = "Activer/Désac";
   this._btnIPKamas.label = "Activer/Désac";
   this._btnIPDrop.label = "Activer/Désac";
   this._btnMInvoc.label = "Activer/Désac";
   this._btnPrestige1.label = "Bonus Prestige 1";
   this._btnPrestige2.label = "Bonus Prestige 2";
   this._btnPrestige3.label = "Bonus Prestige 3";
   this._btnPrestige4.label = "Bonus Prestige 4";
   this._btnPrestige5.label = "Bonus Prestige 5";
   this._btnTitle.label = this.api.lang.getText("BOUTON_TITRE");
};
_loc1.initData = function()
{
   var _loc2_ = this.api.kernel.OptionsManager;
   this._pb2._width = Math.ceil(0.167 * this.api.datacenter.Player.Level);
   this._lblinfos.text = this.api.lang.getText("PRESTIGE_INFOS");
   var _loc3_ = this.api.datacenter.Player;
   this._lbllevel.text = "Niveaux " + _loc3_.Level;
   this._lblName.text = _loc3_.Name;
   this._lblOneWindow.text = "Continuer sur Incarnam";
   this._lblPass.text = "Suivre le tutoriel";
   this._lblMoveMule.text = "Activer/Désactiver Move Mule";
   this._lblMInvoc.text = "Activer/Désactiver Control. Invoc";
   this._lblDjModu.text = "Activer/Désactiver Dj Modu";
   this._lblFarm.text = "Activer/Désactiver Mode Farm";
   this._lblIPKamas.text = "Activer/Désactiver IP Kamas";
   this._lblIPDrop.text = "Activer/Désactiver IP Drop";
   this.MPV.text = this.playerInfo.split("|")[6];
   this._btnAcW.selected = _loc2_.getOption("OneW");
   this._btnAPass.selected = _loc2_.getOption("Pass");
   this._btnAMove.selected = _loc2_.getOption("Move");
   this._btnAcInvoc.selected = _loc2_.getOption("Cinvoc");
   this._btnAModu.selected = _loc2_.getOption("Modu");
   this._btnAFarm.selected = _loc2_.getOption("Farm");
   this._btnAKamas.selected = _loc2_.getOption("Kamas");
   this._btnADrop.selected = _loc2_.getOption("Drop");
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
      this.gapi.unloadUIComponent("PanelNew");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnOneW)
   {
      this.gapi.unloadUIComponent("PanelNew");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnPass)
   {
      this.api.network.send("XDL");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnMoveMule)
   {
      this.api.network.send("XDO");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnMInvoc)
   {
      this.api.network.send("XDW");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnDjModu)
   {
      this.api.network.send("XDI");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnFarm)
   {
      this.api.network.send("XDE");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnIPKamas)
   {
      this.api.network.send("XDT");
   }
   _loc3_ = oEvent.target;
   if(oEvent.target === this._btnIPDrop)
   {
      this.api.network.send("XDR");
   }
};
_loc1.__set__player = function(sData)
{
   this.playerInfo = sData;
};
_loc1.initPrestige = function(_loc2_)
{
   this._lblprestige.text = String("Prestige " + _loc2_);
};
_loc1.__set__prestige = function(sData)
{
   var _loc2_ = sData.split("|");
   this._lblCbtW.text = String("Combats Win " + _loc2_[0]);
   this._lblPrestige.text = String("Prestige " + _loc2_[1]);
};
_loc1.addProperty("player",function()
{
}
,_loc1.__set__player);
_loc1.playerInfo = "";
_loc1.fightWin = 0;
_loc1.fightLose = 0;
_loc1.ogGastadas = 0;
ASSetPropFlags(_loc1,null,1);
_loc1.playerInfo = "";
_global.dofus["\r\x14"].gapi.ui.PanelNew.CLASS_NAME = "PanelNew";
