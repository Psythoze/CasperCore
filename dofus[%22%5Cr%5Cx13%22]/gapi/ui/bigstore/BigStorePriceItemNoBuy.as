_global.dofus["\r\x14"].gapi.ui.bigstore.BigStorePriceItemNoBuy = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.bigstore.BigStorePriceItemNoBuy.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.bigstore.BigStorePriceItemNoBuy.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.__set__row = function(_loc2_)
{
   this._mcRow = _loc2_;
};
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   delete this._nSelectedSet;
   if(_loc2_)
   {
      this._oItem = _loc4_;
      var _loc6_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,1);
      var _loc4_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,2);
      var _loc5_ = this._mcList._parent._parent.isThisPriceSelected(_loc4_.id,3);
      if(_loc6_)
      {
         var _loc7_ = this._btnPriceSet1;
      }
      if(_loc4_)
      {
         _loc7_ = this._btnPriceSet2;
      }
      if(_loc5_)
      {
         _loc7_ = this._btnPriceSet3;
      }
      if(_loc6_ || (_loc4_ || _loc5_))
      {
         var _loc8_ = this._btnBuy;
      }
      if(_loc8_ != undefined)
      {
         this._mcList._parent._parent.setButtons(_loc7_,_loc8_);
      }
      this._btnPriceSet1.selected = _loc6_ && !_global.isNaN(_loc4_.priceSet1);
      this._btnPriceSet2.selected = _loc4_ && !_global.isNaN(_loc4_.priceSet2);
      this._btnPriceSet3.selected = _loc5_ && !_global.isNaN(_loc4_.priceSet3);
      if(_loc6_)
      {
         this._nSelectedSet = 1;
      }
      else if(_loc4_)
      {
         this._nSelectedSet = 2;
      }
      else if(_loc5_)
      {
         this._nSelectedSet = 3;
      }
      this._btnBuy.enabled = this._nSelectedSet != undefined;
      this._btnBuy._visible = true;
      this._btnPriceSet1._visible = true;
      this._btnPriceSet2._visible = true;
      this._btnPriceSet3._visible = true;
      this._btnPriceSet1.enabled = !_global.isNaN(_loc4_.priceSet1);
      this._btnPriceSet2.enabled = !_global.isNaN(_loc4_.priceSet2);
      this._btnPriceSet3.enabled = !_global.isNaN(_loc4_.priceSet3);
      this._btnPriceSet1.label = !!_global.isNaN(_loc4_.priceSet1) ? "-  " : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet1).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  ";
      this._btnPriceSet2.label = !!_global.isNaN(_loc4_.priceSet2) ? "-  " : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet2).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  ";
      this._btnPriceSet3.label = !!_global.isNaN(_loc4_.priceSet3) ? "-  " : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.priceSet3).addMiddleChar(this._mcList.gapi.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + "  ";
      this._ldrIcon.contentParams = _loc4_.item.params;
      this._ldrIcon.contentPath = _loc4_.item.iconFile;
   }
   else if(this._ldrIcon.contentPath != undefined)
   {
      this._btnPriceSet1._visible = false;
      this._btnPriceSet2._visible = false;
      this._btnPriceSet3._visible = false;
      this._btnBuy._visible = false;
      this._ldrIcon.contentPath = "";
   }
};
_loc1.init = function()
{
   super.init(false);
   this._btnPriceSet1._visible = false;
   this._btnPriceSet2._visible = false;
   this._btnPriceSet3._visible = false;
   this._btnBuy._visible = false;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
};
_loc1.addListeners = function()
{
   this._btnPriceSet1.addEventListener("click",this);
   this._btnPriceSet2.addEventListener("click",this);
   this._btnPriceSet3.addEventListener("click",this);
   this._btnBuy.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnBuy.label = this._mcList.gapi.api.lang.getText("BUY");
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list,_loc1.__get__list);
_loc1.addProperty("row",function()
{
}
,_loc1.__set__row,_loc1.__get__row);
ASSetPropFlags(_loc1,null,1);
