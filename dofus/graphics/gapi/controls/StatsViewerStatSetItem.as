_global.dofus["\r\x14"].gapi.controls.StatsViewerStatSetItem = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.StatsViewerStatSetItem.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.StatsViewerStatSetItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblName.text = oItem.name;
      this._lblTotal.text = oItem.total;
      this._ldrIcon.contentPath = oItem.icon;
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblTotal.text = "";
      this._ldrIcon.contentPath = "";
   }
};
_loc1.init = function()
{
   super.init(false);
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
