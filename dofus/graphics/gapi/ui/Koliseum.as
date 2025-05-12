this.api = _global.API;
_global.dofus["\r\x14"].gapi.ui.Koliseum = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Koliseum.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Koliseum.prototype;
_loc1.__set__Tiempo = function(nValue)
{
   this._nTiempo = Number(nValue);
};
_loc1.__set__Inscritos = function(sData)
{
   this._nInscritos = sData;
};
_loc1.__set__Detalles = function(nValue)
{
   this._nValue1 = nValue;
};
_loc1.__set__Puntos = function(sData)
{
   this._nPuntos = sData;
};
_loc1.__set__Rango = function(nValue)
{
   this._nRango = nValue;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Koliseum.CLASS_NAME);
};
_loc1.__set__Inscritoss = function(sData)
{
   this._nInscritoss = sData;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.refrescarReboot = function()
{
   this._nTiempo -= 1;
   if(this._nTiempo <= 0)
   {
      this._nTiempo = 0;
      this._txtTiempo.text = "00:00";
      _global.clearInterval(this._nIntervalo);
   }
   else
   {
      var _loc3_ = Math.floor(this._nTiempo / 60);
      var _loc4_ = this._nTiempo - _loc3_ * 60;
      var _loc5_ = _loc3_ < 10 ? "0" + _loc3_ : _loc3_ + "";
      var _loc6_ = _loc4_ < 10 ? "0" + _loc4_ : _loc4_ + "";
      this._txtTiempo.text = _loc5_ + ":" + _loc6_;
   }
};
_loc1.initData = function()
{
   this._lblInformations.text = this.api.lang.getText("K_INFORMATION");
   this._btnLeave.label = this.api.lang.getText("K_LEAVE");
   this._btnRegister.label = "S\'inscrire";
   this._btnLeave.label = "Désinscrire";
   this._nEtape = 1;
   this._lblEtapeTitre.text = "Information";
   this._svCharacterViewer.zoom = 400;
   var _loc3_ = this.api.datacenter.Player.data;
   if(_loc3_ == undefined)
   {
      return undefined;
   }
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],_loc3_.gfxFile,undefined,5);
   _loc4_.color1 = _loc3_.color1;
   _loc4_.color2 = _loc3_.color2;
   _loc4_.color3 = _loc3_.color3;
   _loc4_.accessories = _loc3_.accessories;
   _loc4_.mount = _loc3_.mount;
   this._svCharacterViewer.spriteData = _loc4_;
   this._txtInscritos.text = this._nInscritos;
   this._nIntervalo = _global.setInterval(this,"refrescarReboot",990);
   this.refrescarReboot();
};
_loc1.addListeners = function()
{
   this._btnRegister.addEventListener("click",this);
   this._btnLeave.addEventListener("click",this);
   this._btnRegisterL.addEventListener("click",this);
   this._btnLeaveL.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this.api.network._oDataProcessor.addEventListener("modelChanged",this);
};
_loc1.initTexts = function()
{
   this._txtInicio.text = this.api.lang.getText("INICIO_EN");
   this._txtInscri.text = this.api.lang.getText("INSCRITOS");
   this._txtKoliseo.text = this.api.lang.getText("REGLAS_KOLISEO");
   this._txtInscritos.text = this._nInscritos;
   this._txtInscritoss.text = this._nInscritoss;
   this.refrescarReboot();
   this._winBg.title = "Détails";
   this._winBG2.title = "Règles";
   this._winBg3.title = "Ton personnage";
   this._lblBonusDerrotas2.text = this._nValue1.split(",")[1];
   this._lblBonusVictorias2.text = this._nValue1.split(",")[0];
   this._lblTitle.text = "Elo : " + this.api.lang.getText("RANGO_" + this._nRango);
   this._ldrIcono.contentPath = "rango_" + this._nRango;
   this._taDesc.text = this.api.lang.getText("REGLAS_KOLISEO");
   this._txtPuntos2.text = this._nPuntos + "/100";
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnRegister:
         this.api.network.send("kY");
         break;
      case this._btnLeave:
         this.api.network.send("kZ");
         break;
      case this._btnRegisterL:
         this.api.network.send("ky");
         break;
      case this._btnLeaveL:
         this.api.network.send("kz");
         break;
      case this._btnCancel:
         this.api.ui.unloadUIComponent("Koliseum");
         _global.clearInterval(this._nIntervalID);
   }
};
_loc1.updateTimer = function()
{
   if(this._nEtape == 3)
   {
      this._nValue4 -= 1000;
      this._lblEtape.text = "Esperando validación ... (" + this._nValue4 / 1000 + "s)";
   }
   else
   {
      _global.clearInterval(this._nIntervalID);
   }
   if(this._nValue4 <= 0)
   {
      _global.clearInterval(this._nIntervalID);
   }
};
_loc1.modelChanged = function(oEvent)
{
   this.updateEtape();
   this.initTexts();
};
_loc1.addProperty("inscritoss",function()
{
}
,_loc1.__set__Inscritoss);
_loc1.addProperty("detalles",function()
{
}
,_loc1.__set__Detalles);
_loc1.addProperty("tiempo",function()
{
}
,_loc1.__set__Tiempo);
_loc1.addProperty("inscritos",function()
{
}
,_loc1.__set__Inscritos);
_loc1.addProperty("rango",function()
{
}
,_loc1.__set__Rango);
_loc1.addProperty("puntos",function()
{
}
,_loc1.__set__Puntos);
_loc1._nPuntos = 0;
_loc1._nRango = 1;
_loc1._nInscritos = 0;
_loc1._nTiempo = 1800;
_loc1._nInscritoss = 0;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Koliseum.CLASS_NAME = "Koliseum";
