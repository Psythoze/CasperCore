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
if(!dofus["\r\x14"].gapi.ui.Aventure)
{
   _global.dofus["\r\x14"].gapi.ui.Aventure = new Object();
}
_global.dofus["\r\x14"].gapi.ui.Aventure.AventureItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.Aventure.AventureItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Aventure.AventureItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._ldr.contentPath = dofus.Constants.LOGROS_GFX + oItem.ldr + ".png";
      this._lblName.text = oItem.name;
      this._lblLevel.text = oItem.level;
      this._mcSombra._visible = oItem.sombra == true;
      this._mcF._visible = true;
   }
   else if(this._lblName.text != "")
   {
      this._ldr.contentPath = "";
      this._lblName.text = "";
      this._lblLevel.text = "";
      this._mcSombra._visible = false;
      this._mcF._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcSombra._visible = false;
   this._mcF._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
