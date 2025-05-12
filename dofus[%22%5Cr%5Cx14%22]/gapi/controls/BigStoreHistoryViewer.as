_global.dofus["\r\x14"].gapi.controls.BigStoreHistoryViewer = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.BigStoreHistoryViewer.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.BigStoreHistoryViewer.prototype;
_loc1.setList = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._mcKama._visible = true;
      this._ctrIcon._visible = true;
      var _loc3_ = new _global.palmad.dofus.datacenter.Items(0,oItem.idItem,1,-1,-1);
      this._lblTitle.text = _loc3_.name;
      this._lblPrice.text = new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.price).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"),3);
      this._lblAmount.text = "x " + oItem.cant;
      this._lblTime.text = oItem.date;
      this._ctrIcon.contentData = _loc3_;
   }
   else if(this._lblTitle.text == undefined)
   {
      this._mcKama._visible = false;
      this._lblDesc.text = "";
      this._lblPts.text = "";
      this._ctrIcon._visible = false;
      this._ctrIconState._visible = false;
      this._calcOpacity._visible = false;
      this._calcOpacityBackground._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addProperty("list",function()
{
}
,_loc1.setList);
ASSetPropFlags(_loc1,null,1);
