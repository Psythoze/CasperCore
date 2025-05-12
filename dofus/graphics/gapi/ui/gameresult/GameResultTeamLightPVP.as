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
if(!dofus["\r\x14"].gapi.ui.gameresult)
{
   _global.dofus["\r\x14"].gapi.ui.gameresult = new Object();
}
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultTeamLightPVP = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultTeamLightPVP.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultTeamLightPVP.prototype;
_loc1.__set__title = function(_loc2_)
{
   this._sTitle = _loc2_;
};
_loc1.__set__dataProvider = function(_loc2_)
{
   this._eaDataProvider = _loc2_;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultTeamLightPVP.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initData});
   this._lstPlayers._visible = false;
};
_loc1.initData = function()
{
   var _loc2_ = this._eaDataProvider.length;
   this._lstPlayers.dataProvider = this._eaDataProvider;
   this._lstPlayers.setSize(undefined,Math.min(_loc2_,1) * this._lstPlayers.rowHeight);
   this._lstPlayers._visible = true;
};
_loc1.itemRollOver = function(_loc2_)
{
};
_loc1.itemRollOut = function(_loc2_)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("title",function()
{
}
,_loc1.__set__title);
_loc1.addProperty("dataProvider",function()
{
}
,_loc1.__set__dataProvider);
ASSetPropFlags(_loc1,null,1);
_loc1._sTitle = "";
_loc1._eaDataProvider = "";
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultTeamLightPVP.CLASS_NAME = "GameResultTeamLightPVP";
