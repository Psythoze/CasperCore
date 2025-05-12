var _loc1 = ank.gapi.controls.ContainerGrid.prototype;
_loc1.__get__spacing = function()
{
   return this._spacing;
};
_loc1.__set__spacing = function(sSpacing)
{
   this._spacing = sSpacing;
   return this._spacing;
};
_loc1.__get__startIndexCtn = function()
{
   return this._startIndexCtn;
};
_loc1.__set__startIndexCtn = function(startIndexCtn)
{
   this._startIndexCtn = startIndexCtn;
   return this._startIndexCtn;
};
_loc1.addRow = function()
{
   this._rowAddCount += 1;
   this.setScrollBarProperties();
};
_loc1.__set__scrollBarText = function(scrollBarText)
{
   this._scrollBarText = scrollBarText;
   return this._scrollBarText;
};
_loc1.__get__scrollBarText = function()
{
   return this._scrollBarText;
};
_loc1.createChildren = function()
{
   this.createEmptyMovieClip("_mcScrollContent",10);
   this.createEmptyMovieClip("_mcMask",20);
   this.drawRoundRect(this._mcMask,0,0,1,1,0,0);
   this._mcScrollContent.setMask(this._mcMask);
   if(this._bScrollBar)
   {
      this.attachMovie("ScrollBar","_sbVertical",30,{scrollBarText:this._scrollBarText});
      this._sbVertical.addEventListener("scroll",this);
   }
   ank["\x1e\n\x07"]["\t\x17"].addListener(this);
   this._aSelectedIndexes = new Array();
   if(this._spacing == undefined)
   {
      this._spacing = 0;
   }
   if(this._startIndexCtn == undefined)
   {
      this._startIndexCtn = 0;
   }
   if(this._rowAddCount == undefined)
   {
      this._rowAddCount = 0;
   }
};
_loc1 = ank.gapi.controls.ContainerGrid.prototype;
_loc1.layoutContent = function()
{
   var _loc14_ = (this.__width - (!this._bScrollBar ? 0 : this._sbVertical.width)) / this._nVisibleColumnCount;
   var _loc13_ = this.__height / this._nVisibleRowCount;
   var _loc3_ = 0;
   if(!this._bInvalidateLayout)
   {
      var _loc9_ = 0;
      while(_loc9_ < this._nVisibleRowCount)
      {
         var _loc5_ = 0;
         while(_loc5_ < this._nVisibleColumnCount)
         {
            var _loc2_ = this._mcScrollContent["c" + _loc3_];
            if(_loc2_ == undefined)
            {
               _loc2_ = this._mcScrollContent.attachMovie("Container","c" + _loc3_,_loc3_,{margin:this._nStyleMargin});
               _loc2_.addEventListener("drag",this);
               _loc2_.addEventListener("drop",this);
               _loc2_.addEventListener("over",this);
               _loc2_.addEventListener("out",this);
               _loc2_.addEventListener("click",this);
               _loc2_.addEventListener("dblClick",this);
            }
            _loc2_._x = _loc14_ * _loc5_;
            _loc2_._y = _loc13_ * _loc9_;
            _loc2_.setSize(_loc14_,_loc13_);
            _loc3_ += 1;
            _loc5_ += 1;
         }
         _loc9_ += 1;
      }
   }
   var _loc10_ = 0;
   _loc3_ = this._nScrollPosition * this._nVisibleColumnCount;
   var _loc12_ = 0;
   while(_loc12_ < this._nVisibleRowCount)
   {
      var _loc7_ = 0;
      while(_loc7_ < this._nVisibleColumnCount)
      {
         var _loc4_ = this._mcScrollContent["c" + _loc10_];
         var _loc6_ = this._eaDataProvider[_loc3_];
         var _loc11_ = _loc6_.label;
         var _loc8_ = _loc6_.forceReloadOnContainer;
         _loc4_.forceReload = _loc8_ != undefined && _loc8_;
         _loc4_.showLabel = _loc11_ != undefined;
         _loc4_.contentData = _loc6_;
         _loc4_.id = _loc3_;
         if(this.isSelectedIndex(_loc3_))
         {
            _loc4_.selected = true;
         }
         else
         {
            _loc4_.selected = false;
         }
         _loc4_.enabled = this._bEnabled;
         _loc3_ += 1;
         _loc10_ += 1;
         _loc7_ += 1;
      }
      _loc12_ += 1;
   }
   if(this._bInvalidateLayout)
   {
   }
   this._bInvalidateLayout = false;
};
_loc1.setScrollBarProperties = function()
{
   var _loc2_ = this._nRowCount - this._nVisibleRowCount;
   var _loc3_ = this._nVisibleRowCount * (_loc2_ / this._nRowCount);
   this._sbVertical.setScrollProperties(_loc3_,0,_loc2_);
   this._sbVertical.scrollPosition = this._nScrollPosition;
};
_loc1.scroll = function(oEvent)
{
   this.setVPosition(oEvent.target.scrollPosition);
   this.dispatchEvent({type:"scroll",target:oEvent.target});
};
_loc1.addProperty("spacing",_loc1.__get__spacing,_loc1.__set__spacing);
_loc1.addProperty("startIndexCtn",_loc1.__get__startIndexCtn,_loc1.__set__startIndexCtn);
_loc1.addProperty("scrollBarText",_loc1.__get__scrollBarText,_loc1.__set__scrollBarText);
