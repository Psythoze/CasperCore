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
_global.dofus["\r\x14"].gapi.ui.Mazmorra = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Mazmorra.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Mazmorra.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Mazmorra.CLASS_NAME);
};
_loc1.__set__Retrato = function(nValue)
{
   this._nRetrato = Number(nValue.split(",")[0]);
   this._sMazmorra = nValue.split(",")[1];
   this._nObjetoID = Number(nValue.split(",")[2]);
};
_loc1.__set__Icono = function(nValue)
{
   this._nRetrato = Number(nValue);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnHc.addEventListener("click",this);
   this._btnAceptar.addEventListener("click",this);
   this._btnCancelar.addEventListener("click",this);
   this._cbNivel.addEventListener("itemSelected",this);
};
_loc1.initTexts = function()
{
   this._btnAceptar.label = "Entrar";
   this._btnCancelar.label = "Cancelar";
   this._lblMazmorra.text = this._sMazmorra;
   this._txtStatsJefe.text = "Estadisticas monstruos";
   this._txtOpciones.text = this.api.lang.getText("OPCIONES_MAZMORRA");
   this._txtHc.text = "Modo Hardcore";
   this._txtDificultad.text = "Dificultad";
};
_loc1.actualizarIcono = function(nValue)
{
   this._nRetrato = Number(nValue);
   this._ldrRetrato.contentPath = "clips/artworks/big/" + this._nRetrato + ".swf";
};
_loc1.cerrar = function()
{
   this.gapi.unloadUIComponent("Mazmorra");
};
_loc1.initData = function()
{
   var _loc3_ = 1;
   while(_loc3_ < 7)
   {
      this["right" + _loc3_]._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 0;
   while(_loc2_ < 11)
   {
      _loc6_.push({id:_loc2_,label:"Nivel " + _loc2_});
      _loc2_ = _loc2_ + 1;
   }
   this._cbNivel.dataProvider = _loc6_;
   this._cbNivel.selectedIndex = 0;
   this.api.ui.getUIComponent("Mazmorra").actualizarIcono(this._nRetrato);
};
_loc1.itemSelected = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "_cbNivel")
   {
      var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc2_.push({name:"PDV",total:this._cbNivel.selectedItem.id + "%",icon:"Coeur"});
      if(this._cbNivel.selectedItem.id >= 5 && this._cbNivel.selectedItem.id <= 9)
      {
         _loc2_.push({name:"PA",total:2,icon:"Star"});
         _loc2_.push({name:"PM",total:1,icon:"IconMP"});
         _loc2_.push({name:"Dommage",total:30,icon:"pic_IN_MULTI"});
      }
      if(this._cbNivel.selectedItem.id == 10)
      {
         _loc2_.push({name:"PA",total:4,icon:"Star"});
         _loc2_.push({name:"PM",total:2,icon:"IconMP"});
         _loc2_.push({name:"Dommage",total:60,icon:"pic_IN_MULTI"});
      }
      _loc2_.push({name:"Dommage %",total:0 + 15 * this._cbNivel.selectedItem.id + "%",icon:"pic_IN_MULTI"});
      _loc2_.push({name:"Statistiques",total:0 + 30 * this._cbNivel.selectedItem.id,icon:""});
      _loc2_.push({name:"Expérience",total:0 + 20 * this._cbNivel.selectedItem.id + "%",icon:"IconXP"});
      _loc2_.push({name:"Drop",total:0 + 20 * this._cbNivel.selectedItem.id + "%",icon:"UI_BannerInventoryIcon"});
      this._dgStats.dataProvider = _loc2_;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnCancelar:
         this.gapi.unloadUIComponent("Mazmorra");
         break;
      case this._btnAceptar:
         this.api.network.send("MA" + this._cbNivel.selectedItem.id + "," + this._nHardcore + "," + this._nObjetoID);
         break;
      case this._btnHc:
         var _loc2_ = 1;
         while(_loc2_ < 7)
         {
            if(this._btnHc.selected == false)
            {
               this._nHardcore = 0;
               this["right" + _loc2_]._visible = false;
            }
            if(this._btnHc.selected == true)
            {
               this._nHardcore = 1;
               this["right" + _loc2_]._visible = true;
            }
            _loc2_ = _loc2_ + 1;
         }
   }
};
_loc1.addProperty("retrato",function()
{
}
,_loc1.__set__Retrato);
_loc1.addProperty("icono",function()
{
}
,_loc1.__set__Icono);
ASSetPropFlags(_loc1,null,1);
_loc1._sMazmorra = "";
_loc1._nRetrato = 9280;
_loc1._nHardcore = 0;
_loc1._nObjetoID = 0;
_global.dofus["\r\x14"].gapi.ui.Mazmorra.CLASS_NAME = "Mazmorra";
