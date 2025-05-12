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
if(!dofus["\r\x14"].gapi.ui.reportes)
{
   _global.dofus["\r\x14"].gapi.ui.reportes = new Object();
}
_global.dofus["\r\x14"].gapi.ui.reportes.ReporteMiembro = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.reportes.ReporteMiembro.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.reportes.ReporteMiembro.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblNro.text = oItem.nro;
      this._lblName.text = oItem.name;
      this._lblDescription.text = oItem.description;
      this._lblFecha.text = oItem.fecha;
      this._bLeido = oItem.leido;
   }
   else if(this._lblNro.text != undefined)
   {
      this._lblNro.text = "";
      this._lblName.text = "";
      this._lblDescription.text = "";
      this._lblFecha.text = "";
      this._bLeido = false;
   }
};
_loc1.init = function()
{
   super.init(false);
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
