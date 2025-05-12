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
_global.dofus["\r\x14"].gapi.ui.CustomSet = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.CustomSet.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.ui.CustomSet.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.CustomSet.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initText});
};
_loc1.addListeners = function()
{
   this._cgSets.addEventListener("overItem",this);
   this._cgSets.addEventListener("outItem",this);
   this._btnCrear.addEventListener("click",this);
   this._btnNuevo.addEventListener("click",this);
   this._btnModificar.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._btnUsar.addEventListener("click",this);
   this._dgStats._visible = false;
};
_loc1.initTexts = function()
{
   this._txtNombre.text = "";
   this._txtNombre.restrict = "0-9a-zA-Z ";
   this._txtNombre.maxChars = 20;
   this._txtInformacion.text = this.api.lang.getText("ITEMS_SETS_RAPIDO");
   this._txtIntro.text = this.api.lang.getText("INTRO_SETS_RAPIDO");
   this._txtIconos.text = this.api.lang.getText("ICONOS_SETS_RAPIDO");
   this._btnCrear.label = this.api.lang.getText("SAVE");
   this._btnBorrar.label = this.api.lang.getText("DELETE");
};
_loc1.initData = function()
{
   this._cgSets._visible = true;
   this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
   this.actualizarContainers("");
   this._btnNuevo._visible = true;
   this._txtIntro._visible = true;
   this._txtInformacion._visible = true;
   this._nIcono = 1;
   this._oSet = undefined;
   var _loc2_ = 0;
   while(_loc2_ <= 17)
   {
      this["_sctr" + _loc2_]._visible = true;
      this["_m" + _loc2_]._visible = true;
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.actualizarContainers = function(sData)
{
   var _loc3_ = 0;
   while(_loc3_ <= 17)
   {
      this["_sctr" + _loc3_].contentData = undefined;
      _loc3_ = _loc3_ + 1;
   }
   if(sData == undefined || sData == "")
   {
      return undefined;
   }
   var _loc8_ = sData.split(";");
   for(var _loc9_ in _loc8_)
   {
      var _loc4_ = _loc8_[_loc9_].split(",");
      var _loc6_ = _global.parseInt(_loc4_[0]);
      var _loc7_ = _global.parseInt(_loc4_[1]);
      var _loc5_ = this.api.datacenter.Player.getObjeto(_loc6_);
      if(_loc5_ != undefined)
      {
         this["_sctr" + _loc7_].contentData = _loc5_.item;
      }
   }
};
_loc1.updateSet = function(sData)
{
   this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
};
_loc1.updateSet2 = function(sData)
{
   this.actualizarContainers(sData);
};
_loc1.deleteSetF = function()
{
   this._cgIconos._visible = false;
   this._btnCrear._visible = false;
   this._mBlanco._visible = false;
   this._txtNombre._visible = false;
   this._dgStats._visible = false;
   this._txtIconos._visible = false;
   this._btnUsar._visible = false;
   this._btnModificar._visible = false;
   this._btnBorrar._visible = false;
   this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
   this.actualizarContainers("");
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnNuevo":
         this.gapi.loadUIComponent("CustomSetEdit","CustomSetEdit",{rapidStuff:undefined});
         var _loc2_ = 0;
         while(_loc2_ <= 17)
         {
            this["_sctr" + _loc2_].contentData = this["_ctr" + _loc2_].contentData;
            _loc2_ = _loc2_ + 1;
         }
         return undefined;
      case "_btnModificar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         this.gapi.loadUIComponent("CustomSetEdit","CustomSetEdit",{rapidStuff:this._oSet});
         return undefined;
         break;
      case "_btnUsar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc6_ = 0;
         var _loc3_ = this.api.datacenter.Player;
         _loc4_.push({name:"PDV",total:_loc3_.LP + "/" + _loc3_.LPmax,icon:"Coeur"});
         _loc4_.push({name:"PA",total:_loc3_.AP,icon:"Star"});
         _loc4_.push({name:"PM",total:_loc3_.MP,icon:"IconMP"});
         _loc4_.push({name:this.api.lang.getText("INITIATIVE"),total:_loc3_.Initiative,icon:"IconInit"});
         _loc4_.push({name:this.api.lang.getText("DISCERNMENT"),total:_loc3_.Discernment,icon:"IconPP"});
         _loc4_.push({name:this.api.lang.getText("VITALITY"),total:this.api.datacenter.Player.Vitality + (_loc3_.VitalityXtra != 0 ? (_loc3_.VitalityXtra > 0 ? " (+" : " (") + String(_loc3_.VitalityXtra) + ")" : ""),icon:"IconVita"});
         _loc4_.push({name:this.api.lang.getText("WISDOM"),total:this.api.datacenter.Player.Wisdom + (_loc3_.WisdomXtra != 0 ? (_loc3_.WisdomXtra > 0 ? " (+" : " (") + String(_loc3_.WisdomXtra) + ")" : ""),icon:"IconWisdom"});
         _loc4_.push({name:this.api.lang.getText("FORCE"),total:this.api.datacenter.Player.Force + (_loc3_.ForceXtra != 0 ? (_loc3_.ForceXtra > 0 ? " (+" : " (") + String(_loc3_.ForceXtra) + ")" : ""),icon:"IconEarthBonus"});
         _loc4_.push({name:this.api.lang.getText("INTEL"),total:this.api.datacenter.Player.Intelligence + (_loc3_.IntelligenceXtra != 0 ? (_loc3_.IntelligenceXtra > 0 ? " (+" : " (") + String(_loc3_.IntelligenceXtra) + ")" : ""),icon:"IconFireBonus"});
         _loc4_.push({name:this.api.lang.getText("CHANCE"),total:this.api.datacenter.Player.Chance + (_loc3_.ChanceXtra != 0 ? (_loc3_.ChanceXtra > 0 ? " (+" : " (") + String(_loc3_.ChanceXtra) + ")" : ""),icon:"IconWaterBonus"});
         _loc4_.push({name:this.api.lang.getText("AGILITY"),total:this.api.datacenter.Player.Agility + (_loc3_.AgilityXtra != 0 ? (_loc3_.AgilityXtra > 0 ? " (+" : " (") + String(_loc3_.AgilityXtra) + ")" : ""),icon:"IconAirBonus"});
         this._dgStats.dataProvider = _loc4_;
         this.api.network.send("ZSU" + this._oSet.ID);
         return undefined;
         break;
      default:
   }
};
_loc1.elegirSet = function(oEvent)
{
   var _loc4_ = oEvent.target.contentData;
   if(_loc4_ == undefined)
   {
      return undefined;
   }
   this._oSet = _loc4_;
   this.actualizarContainers(this._oSet.data);
   this._cgIconos._visible = false;
   this._btnCrear._visible = false;
   this._mBlanco._visible = false;
   this._txtNombre._visible = false;
   this._txtIconos._visible = false;
   this._btnUsar._visible = true;
   this._dgStats._visible = true;
   this._btnModificar._visible = true;
   this._btnBorrar._visible = true;
   var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc7_ = 0;
   var _loc2_ = this.api.datacenter.Player;
   _loc3_.push({name:"PDV",total:_loc2_.LP + "/" + _loc2_.LPmax,icon:"Coeur"});
   _loc3_.push({name:"PA",total:_loc2_.AP,icon:"Star"});
   _loc3_.push({name:"PM",total:_loc2_.MP,icon:"IconMP"});
   _loc3_.push({name:this.api.lang.getText("INITIATIVE"),total:_loc2_.Initiative,icon:"IconInit"});
   _loc3_.push({name:this.api.lang.getText("DISCERNMENT"),total:_loc2_.Discernment,icon:"IconPP"});
   _loc3_.push({name:this.api.lang.getText("VITALITY"),total:this.api.datacenter.Player.Vitality + (_loc2_.VitalityXtra != 0 ? (_loc2_.VitalityXtra > 0 ? " (+" : " (") + String(_loc2_.VitalityXtra) + ")" : ""),icon:"IconVita"});
   _loc3_.push({name:this.api.lang.getText("WISDOM"),total:this.api.datacenter.Player.Wisdom + (_loc2_.WisdomXtra != 0 ? (_loc2_.WisdomXtra > 0 ? " (+" : " (") + String(_loc2_.WisdomXtra) + ")" : ""),icon:"IconWisdom"});
   _loc3_.push({name:this.api.lang.getText("FORCE"),total:this.api.datacenter.Player.Force + (_loc2_.ForceXtra != 0 ? (_loc2_.ForceXtra > 0 ? " (+" : " (") + String(_loc2_.ForceXtra) + ")" : ""),icon:"IconEarthBonus"});
   _loc3_.push({name:this.api.lang.getText("INTEL"),total:this.api.datacenter.Player.Intelligence + (_loc2_.IntelligenceXtra != 0 ? (_loc2_.IntelligenceXtra > 0 ? " (+" : " (") + String(_loc2_.IntelligenceXtra) + ")" : ""),icon:"IconFireBonus"});
   _loc3_.push({name:this.api.lang.getText("CHANCE"),total:this.api.datacenter.Player.Chance + (_loc2_.ChanceXtra != 0 ? (_loc2_.ChanceXtra > 0 ? " (+" : " (") + String(_loc2_.ChanceXtra) + ")" : ""),icon:"IconWaterBonus"});
   _loc3_.push({name:this.api.lang.getText("AGILITY"),total:this.api.datacenter.Player.Agility + (_loc2_.AgilityXtra != 0 ? (_loc2_.AgilityXtra > 0 ? " (+" : " (") + String(_loc2_.AgilityXtra) + ")" : ""),icon:"IconAirBonus"});
   this._dgStats.dataProvider = _loc3_;
};
_loc1.elegirIcono = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this._nIcono = _loc2_.index;
};
_loc1.cargarIconos = function()
{
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 1;
   while(_loc2_ <= 27)
   {
      var _loc3_ = new Object();
      _loc3_.iconFile = dofus.Constants.CUSTOM_SET_ICONS + _loc2_ + ".swf";
      _loc3_.index = _loc2_;
      _loc4_.push(_loc3_);
      _loc2_ = _loc2_ + 1;
   }
   this._cgIconos.dataProvider = _loc4_;
};
ASSetPropFlags(_loc1,null,1);
_loc1._oSet = undefined;
_loc1._nIcono = 1;
_global.dofus["\r\x14"].gapi.ui.CustomSet.CLASS_NAME = "CustomSet";
