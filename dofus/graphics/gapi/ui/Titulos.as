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
_global.dofus["\r\x14"].gapi.ui.Titulos = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Titulos.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Titulos.prototype;
_loc1.__set__Titulos = function(sValue)
{
   this._aTitulos = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Titulos.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgLogros.addEventListener("itemSelected",this);
   this._csColors.addEventListener("change",this);
   this._btnClose.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this._btnNo.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._csColors.addEventListener("change",this);
   this._lstTitulos.addEventListener("itemSelected",this);
   this._btnAlmanax.addEventListener("click",this);
   this._btnServi.addEventListener("click",this);
   this._btnOrnaments.addEventListener("click",this);
   this._btnCompra.addEventListener("click",this);
   this._btnAura.addEventListener("click",this);
   this._precio._visible = false;
   this.og._visible = false;
};
_loc1.initTexts = function()
{
   this._dgLogros.columnsNames = ["",""];
   this._btnOk.label = "Ok";
   this._btnNo.label = "Aucun";
   this._lblName.text = this._sNombre;
   this._txtNombre.text = this._sNombre;
   this._txtTitulo.text = "";
   this._lblName.text = this.api.lang.getText("TITLES_LIST");
};
_loc1.initData = function()
{
   this._svPersonaje.zoom = 250;
   this._svPersonaje.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.spriteData = this.api.datacenter.Player.data;
   this._aLogros = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._aTitulos;
   var _loc6_ = true;
   var _loc5_ = 0;
   for(_loc5_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc5_];
      var _loc2_ = new Object();
      _loc2_.id = _loc3_.split(",")[0];
      _loc2_.name = this.api.lang.getTitle(_loc3_.split(",")[0]).t;
      _loc2_.color = this.api.lang.getTitle(_loc3_.split(",")[0]).c;
      _loc2_.precio = _loc3_.split(",")[1];
      _loc2_.owner = _loc2_.precio == "T";
      this._aLogros.push(_loc2_);
   }
   this._dgLogros.dataProvider = this._aLogros;
};
_loc1.change = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target) === this._csColors)
   {
      this.setColors(oEvent.value);
   }
};
_loc1.setColors = function(oColors)
{
   this._nColor = Number(oColors.color1);
   this._txtTitulo.textColor = this._nColor;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.target._name;
   var _loc0_ = null;
   if((_loc0_ = _loc2_) === "_dgLogros")
   {
      var _loc3_ = this._dgLogros.selectedItem.id;
      this._nColor = -1;
      this._txtTitulo.text = this._dgLogros.selectedItem.name;
      this._txtTitulo.selectable = false;
      this._txtTitulo.textColor = this._dgLogros.selectedItem.color;
      if(this._dgLogros.selectedItem.id == 0 || this._dgLogros.selectedItem.owner)
      {
         this._btnOk._visible = true;
         this._btnOk.label = "OK";
         this._precio._visible = false;
         this.og._visible = false;
      }
      else if(this._dgLogros.selectedItem.precio == undefined)
      {
         this._btnOk._visible = false;
         this._precio._visible = false;
         this.og._visible = false;
      }
      else
      {
         this._btnOk._visible = true;
         this._precio._visible = true;
         this.og._visible = true;
         this._precio.text = "Prix: " + this._dgLogros.selectedItem.precio;
         this._btnOk.label = this.api.lang.getText("BUY");
      }
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         this.api.network.send("ZT" + this._dgLogros.selectedItem.id + ";" + this._nColor);
         this.gapi.unloadUIComponent("Titulos");
         this.unloadThis();
         break;
      case this._btnNo:
         this.api.network.send("ZT0;0");
      case this._btnClose:
         this.gapi.unloadUIComponent("Titulos");
         this.unloadThis();
         break;
      case this._btnAura:
         this.api.network.send("we");
         this.api.ui.unloadUIComponent("Titulos");
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Titulos");
         this.unloadThis();
         break;
      case this._btnServi:
         this.api.network.send("ZoC");
         break;
      case this._btnCompra:
         if(!this.api.datacenter.Game.isFight)
         {
            this.gapi.loadUIAutoHideComponent("Panelcompras","Panelcompras",{nombre:this._sNombre});
         }
         break;
      case this._btnAlmanax:
         this.api.network.send("ZA");
         break;
      case this._btnOrnaments:
         if(!this.api.datacenter.Game.isFight)
         {
            this.api.network.send("Zn");
         }
   }
};
_loc1.addProperty("titulos",function()
{
}
,_loc1.__set__Titulos);
_loc1._sNombre = "";
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Titulos.CLASS_NAME = "Titulos";
