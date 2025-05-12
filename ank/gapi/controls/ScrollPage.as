_global.ank.gapi.controls.ScrollPage = function()
{
   super();
};
ank.gapi.controls.ScrollPage.prototype = new MovieClip();
var _loc1 = _global.ank.gapi.controls.ScrollPage.prototype;
_loc1.defineText = function(sText)
{
   this._txtPage.text = sText;
};
_loc1.getDefineText = function()
{
   return this._txtPage.text;
};
