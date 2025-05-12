_global.dofus["\r\x14"].gapi.ui.BigStoreHistory = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.BigStoreHistory.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.BigStoreHistory.prototype;
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.init = function()
{
   super.init(false,"BigStoreHistory");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initListeners = function()
{
   this._btnCancel.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._lblNoResult.text = this.api.lang.getText("NO_SELL_RESULT");
   this._win.text = this.api.lang.getText("SELL_HISTORY_TITLE");
};
_loc1.initData = function()
{
   this._lblNoResult._visible = this._sData == "";
   this._dgList._visible = this._sData !== "";
   var _loc6_ = 0;
   var _loc3_ = this._sData.split("|");
   var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = 0;
   for(_loc6_ in _loc3_)
   {
      var _loc2_ = new Object();
      _loc2_.idItem = _loc3_[_loc6_].split(";")[0];
      _loc2_.price = Number(_loc3_[_loc6_].split(";")[1]);
      _loc4_ += Number(_loc3_[_loc6_].split(";")[1]);
      _loc2_.date = _loc3_[_loc6_].split(";")[2];
      _loc2_.cant = _loc3_[_loc6_].split(";")[3];
      _loc5_.push(_loc2_);
   }
   this._lblTitle.text = this.api.lang.getText("SELL_TOTAL") + " " + this.getSellTotal(_loc4_) + " kamas";
   this.api.kernel.debug(_loc5_.length);
   this._dgList.dataProvider = _loc5_;
};
_loc1.getSellTotal = function(sData)
{
   return new ank["\x1e\n\x07"]["\x0e\x1c"](sData).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.click = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "_btnCancel")
   {
      this.callClose();
   }
};
_loc1.__get__data = function()
{
   return this._sData;
};
_loc1.__set__data = function(sData)
{
   this._sData = sData;
};
_loc1.addProperty("data",_loc1.__get__data,_loc1.__set__data);
