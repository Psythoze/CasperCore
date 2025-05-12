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
_global.dofus["\r\x14"].gapi.ui.Ornamento = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Ornamento.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Ornamento.prototype;
_loc1.__set__Ornamentos = function(sValue)
{
   this._aTitulos = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Ornamento.CLASS_NAME);
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
   this._btnCerrar.addEventListener("click",this);
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
   this._lblName.text = this.api.lang.getText("ORNAMENTOS_LIST");
};
_loc1.initData = function()
{
   this._svPersonaje.zoom = 250;
   this._svPersonaje.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.spriteData = this.api.datacenter.Player.data;
   var _loc7_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svPersonaje.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc9_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc8_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc9_ + ".swf",undefined,5);
   _loc8_.accessories = _loc7_.accessories;
   this._svPersonaje.enableBlur = true;
   this._svPersonaje.refreshAccessories = !var2;
   this._svPersonaje.sourceSpriteData = _loc7_;
   this._svPersonaje.spriteData = _loc8_;
   this._svPersonaje.setColors(this._oColors);
   this._aLogros = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = this._aTitulos;
   var _loc10_ = true;
   var _loc6_ = 0;
   for(_loc6_ in _loc5_)
   {
      var _loc4_ = _loc5_[_loc6_];
      var _loc3_ = new Object();
      _loc3_.id = _loc4_.split(",")[0];
      _loc3_.name = _loc4_.split(",")[1];
      _loc3_.precio = _loc4_.split(",")[2];
      _loc3_.owner = _loc3_.precio == "T";
      this._aLogros.push(_loc3_);
   }
   this._dgLogros.dataProvider = this._aLogros;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc3_ = oEvent.target._name;
   var _loc0_ = null;
   if((_loc0_ = _loc3_) === "_dgLogros")
   {
      var _loc2_ = this._dgLogros.selectedItem.id;
      this._ldrOrnamento.contentPath = "clips/items/300/" + _loc2_ + ".swf";
      if(_loc2_ == 0 || this._dgLogros.selectedItem.owner)
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
         this._precio.text = this._dgLogros.selectedItem.precio;
         this._btnOk.label = this.api.lang.getText("BUY");
      }
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         this.api.network.send("wI" + this._dgLogros.selectedItem.id);
         this.gapi.unloadUIComponent("Ornamento");
         this.unloadThis();
         break;
      case this._btnNo:
         this.api.network.send("wI0");
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Ornamento");
         this.unloadThis();
   }
};
_loc1.addProperty("ornamentos",function()
{
}
,_loc1.__set__Ornamentos);
_loc1._sNombre = "";
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Ornamento.CLASS_NAME = "Ornamento";
