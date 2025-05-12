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
_global.dofus["\r\x14"].gapi.ui.GiftTemporis = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.GiftTemporis.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.GiftTemporis.prototype;
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
};
_loc1.addListeners = function()
{
   this._btnValidate.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._itCharacterName.addEventListener("change",this);
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.GiftTemporis.CLASS_NAME);
};
_loc1.click = function(var2)
{
   switch(var2.target)
   {
      case this._btnValidate:
         if(this._itCharacterName.text != "")
         {
            this.api.network.send("XDW" + this._itCharacterName.text);
         }
         break;
      case this._btnClose:
         this.api.ui.unloadUIComponent("GiftTemporis");
   }
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("GIFT_AREA");
   this._lblTypeTitle.text = this.api.lang.getText("TYPE_YOUR_CODE");
   this._btnValidate.label = this.api.lang.getText("CONFIRM_CODE");
   this._ldrDieuIop.contentPath = dofus.Constants.TEMPORIS_PATH + "iop.swf";
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.GiftTemporis.CLASS_NAME = "GiftTemporis";
