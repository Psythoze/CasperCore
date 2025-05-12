this.api = _global.API;
_global.dofus["\r\x14"].gapi.ui.Pasiva = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Pasiva.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Pasiva.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Pasiva.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   this._btnPasiva1._visible = false;
   this._btnPasiva2._visible = false;
   if(this._nPasiva == 1)
   {
      this._btnPasiva1._visible = true;
      this._btnPasiva2._visible = true;
   }
};
_loc1.__set__Datos = function(nValue)
{
   this._sNombrePasiva1 = String(nValue.split(";")[0]);
   this._sNombrePasiva2 = String(nValue.split(";")[1]);
   this._sBonus1 = String(nValue.split(";")[2]);
   this._sBonus2 = String(nValue.split(";")[3]);
   this._nClase = Number(nValue.split(";")[4]);
   this._nGfx = Number(nValue.split(";")[5]);
   this._nPasiva1 = Number(nValue.split(";")[6]);
   this._nPasiva2 = Number(nValue.split(";")[7]);
   this._nPasiva = Number(nValue.split(";")[8]);
};
_loc1.addListeners = function()
{
   this._btnCancel1.addEventListener("click",this);
   this._btnCancel2.addEventListener("click",this);
   this._btnPasiva1.addEventListener("click",this);
   this._btnPasiva2.addEventListener("click",this);
   this._btnCargar.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBg.title = this._sNombrePasiva1;
   this._ldrbannerClase.contentPath = "bannerClase" + this._nGfx;
   this._ldrIcClase.contentPath = "clips/artworks/breeds/back/" + this._nClase + ".swf";
   this._txtClase.text = this._sNombrePasiva1;
   this._taDesc.text = this._sBonus1;
   this._winBg2.title = this._sNombrePasiva2;
   this._ldrIcClase2.contentPath = "clips/artworks/breeds/back/" + this._nClase + ".swf";
   this._ldrbannerClase2.contentPath = "bannerClase" + this._nGfx;
   this._txtClase2.text = this._sNombrePasiva2;
   this._taDesc2.text = this._sBonus2;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnPasiva1:
         this.api.network.send("App" + this._nPasiva1);
         break;
      case this._btnPasiva2:
         this.api.network.send("App" + this._nPasiva2);
         break;
      case this._btnCargar:
         this.api.network.send("w1");
         break;
      case this._btnCancel1:
      case this._btnCancel2:
         this.api.ui.unloadUIComponent("Pasiva");
   }
};
_loc1.addProperty("datos",function()
{
}
,_loc1.__set__Datos);
_loc1._sNombrePasiva1 = "";
_loc1._sNombrePasiva2 = "";
_loc1._sBonus1 = "";
_loc1._sBonus2 = "";
_loc1._nClase = 0;
_loc1._nGfx = 0;
_loc1._nPasiva1 = 0;
_loc1._nPasiva2 = 1;
_loc1._nPasiva = 0;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Pasiva.CLASS_NAME = "Pasiva";
