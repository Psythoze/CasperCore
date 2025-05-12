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
_global.dofus["\r\x14"].gapi.ui.AutoPilotButton = function()
{
   super();
   g;
};
dofus["\r\x14"].gapi.ui.AutoPilotButton.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.AutoPilotButton.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.AutoPilotButton.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnStop.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnStop.label = this.api.lang.getText("STOP_AUTOPILOT");
};
_loc1.click = function(oEvent)
{
   this.api.network.send("XPI");
   this.api.ui.unloadUIComponent("AutoPilotButton");
   return undefined;
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
_loc1._aAutoPilotButton = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.AutoPilotButton.CLASS_NAME = "AutoPilotButton";
