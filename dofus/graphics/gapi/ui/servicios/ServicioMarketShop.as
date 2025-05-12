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
if(!dofus["\r\x14"].gapi.ui.servicios)
{
   _global.dofus["\r\x14"].gapi.ui.servicios = new Object();
}
_global.dofus["\r\x14"].gapi.ui.servicios.ServicioMarketShop = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.servicios.ServicioMarketShop.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.servicios.ServicioMarketShop.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._ldrItem.contentPath = dofus.Constants.ITEMS_PATH + oItem.Type + "/" + oItem.gfxId + ".swf";
      this._lblName.text = oItem.Name;
   }
   else if(this._lblName.text != undefined)
   {
      this._ldrItem.contentPath = "";
      this._lblName.text = "";
   }
};
_loc1.init = function()
{
   super.init(false);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
};
_loc1._nMedioPago = 0;
_loc1._nID = -1;
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
