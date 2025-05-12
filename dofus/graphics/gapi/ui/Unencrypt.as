_global.dofus["\r\x14"].gapi.ui.Unencrypt = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Unencrypt.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Unencrypt.prototype;
_loc1.init = function()
{
   super.init(false,"BonusStats");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnValidate.addEventListener("click",this);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnValidate:
         var _loc3_ = dofus.aks["\x1e\x0f"].decypherData(this._itCharacterName.text,dofus.aks["\x1e\x0f"].prepareKey(this._itCharacterName2.text),_global.parseInt(dofus.aks["\x1e\x0f"].checksum(dofus.aks["\x1e\x0f"].prepareKey(this._itCharacterName2.text)),16) * 2);
         this.api.kernel.showMessage(undefined,"<b> Resultado: </b> : " + _loc3_,"INFO_CHAT");
         break;
      case this._btnClose:
         this.gapi.unloadUIComponent("Unencrypt");
   }
};
_loc1.initTexts = function()
{
   this._btnCancel.label = this.api.lang.getText("BACK");
   this._btnValidate.label = this.api.lang.getText("VALIDATE");
   this._itCharacterName.text = "";
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Unencrypt.CLASS_NAME = "Unencrypt";
