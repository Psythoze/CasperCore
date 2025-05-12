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
_global.dofus["\r\x14"].gapi.ui.HouseTaxt = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.HouseTaxt.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.HouseTaxt.prototype;
_loc1.__set__taxt = function(sData)
{
   this._taxt = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.HouseTaxt.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnValidate.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("TAXES");
   this._txtDescription.text = this.api.lang.getText("HOUSE_TAXES");
   this._txtPrice.text = this._taxt;
   this._lblPrice.text = this.api.lang.getText("PRICE");
   this._btnValidate.label = this.api.lang.getText("ACCEPT");
   this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
};
_loc1.askBuy = function()
{
   var _loc2_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:this.api.lang.getText("TAXES"),text:this.api.lang.getText("DO_U_PAY_TAXES")});
   _loc2_.addEventListener("yes",this);
};
_loc1.yes = function(_loc2_)
{
   this.api.network.send("wI");
   this.api.ui.unloadUIComponent("HouseTaxt");
};
_loc1.click = function(oEvent)
{
   if(oEvent.target == this._btnValidate)
   {
      this.askBuy();
   }
   else
   {
      this.api.ui.unloadUIComponent("HouseTaxt");
   }
   return undefined;
};
_loc1.addProperty("taxt",function()
{
}
,_loc1.__set__taxt);
_loc1._taxt = 0;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.HouseTaxt.CLASS_NAME = "HouseTaxt";
