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
_global.dofus["\r\x14"].gapi.ui.Size = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Size.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Size.prototype;
_loc1.__set__Precio = function(sValue)
{
   this._precio = sValue.split(";");
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Size.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnOk.label = "Ok";
   this._btnNo.label = "Aucun";
   this._win.title = this.api.lang.getText("SIZE_TITLE");
   this._lblName.text = this.api.datacenter.Player.Name;
   this._lbdescri.text = this.api.lang.getText("SIZE_DESC");
   this._lblName.text = this.api.lang.getText("SIZE_LIST");
   this._precio.text = "Prix: " + this._precio;
   this._itName.text = "";
};
_loc1.initData = function()
{
   this._svPersonaje.zoom = 150;
   this._svPersonaje.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.spriteData = this.api.datacenter.Player.data;
   var _loc3_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svPersonaje.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc5_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc5_ + ".swf",undefined,5);
   _loc4_.accessories = _loc3_.accessories;
   this._svPersonaje.enableBlur = true;
   this._svPersonaje.refreshAccessories = !var2;
   this._svPersonaje.sourceSpriteData = _loc3_;
   this._svPersonaje.spriteData = _loc4_;
   this._svPersonaje.setColors(this._oColors);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         this.api.network.send("wV" + this._itName.text);
         this.gapi.unloadUIComponent("Size");
         this.unloadThis();
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Size");
         this.unloadThis();
   }
};
_loc1.addProperty("precio",function()
{
}
,_loc1.__set__Precio);
_loc1._precio = 0;
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Size.CLASS_NAME = "Size";
