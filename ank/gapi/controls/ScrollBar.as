var _loc1 = ank.gapi.controls.ScrollBar.prototype;
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
   if(this._scrollBarText == undefined)
   {
      this._scrollBarText = false;
   }
   this._onPressScroll = false;
   this.createEmptyMovieClip("_mcHolder",10);
   var _loc6_ = this._mcHolder.attachMovie("ScrollBarTrack","track_mc",10);
   var _loc3_ = this._mcHolder.attachMovie("ScrollBarUpArrow","upArrow_mc",20);
   var _loc4_ = this._mcHolder.attachMovie("ScrollBarDownArrow","downArrow_mc",30);
   var scrollAddRow = !this._scrollBarText ? 1 : this._parent.visibleRowCount;
   var _loc7_ = this._mcHolder.attachMovie("ScrollBarThumb","thumb_mc",40);
   if(this._scrollBarText)
   {
      var _loc9_ = this._mcHolder.attachMovie("Label","page_mc",50,{enabled:true,html:false,multiline:false,styleName:"BrownLeftSmallSmallLabel",_width:20,_height:16,_rotation:90});
      _loc7_._visible = false;
   }
   _loc7_.onRollOver = function()
   {
   };
   _loc7_.onRollOut = function()
   {
   };
   _loc7_.onPress = function()
   {
      this._parent._parent._nDragOffset = - this._ymouse;
      this.dispatchInterval = _global.setInterval(this._parent._parent,"dispatchScrollEvent",ank.gapi.controls.ScrollBar.SCROLL_INTERVAL);
      this.scrollInterval = _global.setInterval(this._parent._parent,"scrollThumb",ank.gapi.controls.ScrollBar.SCROLL_INTERVAL,null,true);
   };
   _loc7_.onRelease = function()
   {
      _global.clearInterval(this.scrollInterval);
      _global.clearInterval(this.dispatchInterval);
   };
   _loc7_.onReleaseOutside = function()
   {
      this.onRelease();
      this.onRollOut();
   };
   _loc3_.onRollOver = _loc4_.onRollOver = function()
   {
      this.up_mc._visible = false;
      this.over_mc._visible = true;
      this.down_mc._visible = false;
   };
   _loc3_.onRollOut = _loc4_.onRollOut = function()
   {
      this.up_mc._visible = true;
      this.over_mc._visible = false;
      this.down_mc._visible = false;
   };
   _loc3_.onPress = function()
   {
      if(this._onPressScroll)
      {
         return undefined;
      }
      this.up_mc._visible = false;
      this.over_mc._visible = false;
      this.down_mc._visible = true;
      this.interval = _global.setInterval(this._parent._parent,"addToScrollPosition",ank.gapi.controls.ScrollBar.SCROLL_INTERVAL,- scrollAddRow);
   };
   _loc4_.onPress = function()
   {
      if(this._onPressScroll)
      {
         return undefined;
      }
      this.up_mc._visible = false;
      this.over_mc._visible = false;
      this.down_mc._visible = true;
      this.interval = _global.setInterval(this._parent._parent,"addToScrollPosition",ank.gapi.controls.ScrollBar.SCROLL_INTERVAL,scrollAddRow);
   };
   _loc3_.onRelease = _loc4_.onRelease = function()
   {
      this._onPressScroll = false;
      this.onRollOver();
      _global.clearInterval(this.interval);
   };
   _loc3_.onReleaseOutside = _loc4_.onReleaseOutside = function()
   {
      this.onRelease();
      this.onRollOut();
   };
   _loc6_.onPress = function()
   {
      var _loc3_ = this._parent._ymouse;
      var _loc2_ = this._parent._parent._nPage;
      if(_loc3_ < this._parent.thumb_mc._y)
      {
         _loc2_ = - _loc2_;
      }
      this._parent._parent.addToScrollPosition(_loc2_);
   };
};
_loc1.arrange = function()
{
   if(this._nSize == undefined)
   {
      return undefined;
   }
   if(this._bHorizontal)
   {
      this._rotation = -90;
   }
   this._mcHolder.track_mc._height = Math.max(this._nSize - this._mcHolder.upArrow_mc._height - this._mcHolder.downArrow_mc._height,0);
   this._mcHolder.track_mc._y = this._mcHolder.upArrow_mc._height;
   this._mcHolder.downArrow_mc._y = this._mcHolder.track_mc._y + this._mcHolder.track_mc._height;
   this._mcHolder.thumb_mc._y = this._mcHolder.track_mc._y;
   if(this._mcHolder.page_mc != undefined)
   {
      this._mcHolder.page_mc._x = this._mcHolder.track_mc._x + this._mcHolder.track_mc._width / 2 + 8.5;
      this._mcHolder.page_mc._y = this._mcHolder.track_mc._y + this._mcHolder.track_mc._height / 7;
      this._mcHolder.page_mc.text = this.scrollPosition + "/" + this._nMax;
   }
   this.setScrollProperties(this._nPage,this._nMin,this._nMax);
};
_loc1.dispatchScrollEvent = function()
{
   if(this._mcHolder.thumb_mc._y != this._nPrevScrollPosition)
   {
      this._nPrevScrollPosition = Math.max(this._mcHolder.upArrow_mc._height,this._mcHolder.thumb_mc._y);
      this.dispatchEvent({type:"scroll",target:this});
   }
   if(this._mcHolder.page_mc != undefined)
   {
      this._mcHolder.page_mc.text = this.scrollPosition + "/" + this._nMax;
   }
};
_loc1.resizeThumb = function()
{
   if(this._nMax != this._nMin && this._nPage != 0)
   {
      this._mcHolder.thumb_mc.height = Math.min(Math.abs(this._nPage / (this._nMax - this._nMin)),1) * this._mcHolder.track_mc._height;
      this._mcHolder.thumb_mc._y = this._mcHolder.upArrow_mc._height;
      if(this._mcHolder.thumb_mc._height > this._mcHolder.track_mc._height)
      {
         this._mcHolder.thumb_mc._visible = false;
      }
      else if(!this._scrollBarText)
      {
         this._mcHolder.thumb_mc._visible = true;
      }
   }
   else if(!this._scrollBarText)
   {
      this._mcHolder.thumb_mc._visible = false;
   }
};
_loc1.addToScrollPosition = function(nAmount)
{
   this.scrollPosition += nAmount;
};
_loc1.scrollThumb = function(nAmount, bDrag)
{
   if(bDrag)
   {
      this.moveThumb(this._mcHolder._ymouse + this._nDragOffset);
   }
   else
   {
      this.moveThumb(this._mcHolder.thumb_mc._y + nAmount);
   }
   _global.updateAfterEvent();
};
_loc1.moveThumb = function(nY)
{
   this._onPressScroll = true;
   this._mcHolder.thumb_mc._y = nY;
   if(this._mcHolder.thumb_mc._y < this._mcHolder.upArrow_mc._height)
   {
      this._mcHolder.thumb_mc._y = this._mcHolder.upArrow_mc._height;
   }
   else if(this._mcHolder.thumb_mc._y > this._mcHolder.downArrow_mc._y - this._mcHolder.thumb_mc._height)
   {
      this._mcHolder.thumb_mc._y = this._mcHolder.downArrow_mc._y - this._mcHolder.thumb_mc._height;
   }
   this.dispatchScrollEvent();
};
_loc1.addProperty("scrollBarText",_loc1.__get__scrollBarText,_loc1.__set__scrollBarText);
