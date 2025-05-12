var _loc1 = ank.gapi.controls.MapNavigator.prototype;
_loc1.onMouseMove = function()
{
   if(this._mcMapBackground.hitTest(_root._xmouse,_root._ymouse,true))
   {
      var _loc5_ = this._ldrMap._xmouse;
      var _loc6_ = this._ldrMap._ymouse;
      if(this._nXRefPress == undefined)
      {
         var _loc3_ = this.getCoordinatesFromReal(_loc5_,_loc6_);
         if(this._oLastCoordsOver.x != _loc3_.x || this._oLastCoordsOver.y != _loc3_.y)
         {
            var _loc4_ = this.getRealFromCoordinates(_loc3_.x,_loc3_.y);
            this._ldrMap.localToGlobal(_loc4_);
            this.gapi.showTooltip(_loc3_.x + ", " + _loc3_.y,_loc4_.x,_loc4_.y - 20);
            this.dispatchEvent({type:"overMap",coordinates:_loc3_});
            this._sLastMapEvent = "overMap";
            this._oLastCoordsOver = _loc3_;
         }
      }
      else
      {
         var _loc7_ = this.getCoordinatesFromRealWithRef(_loc5_,_loc6_);
         this.setMapPosition(- _loc7_.x,- _loc7_.y);
         this.dispatchEvent({type:"moveMap"});
      }
   }
   else if(this._sLastMapEvent != "outMap")
   {
      this.dispatchEvent({type:"outMap"});
      this._sLastMapEvent = "outMap";
      this.gapi.hideTooltip();
   }
};
_loc1.onMouseUp = function()
{
   delete this._nXRefPress;
   delete this._nYRefPress;
   this.gapi.removeCursor();
   if(this._mcMapBackground.hitTest(_root._xmouse,_root._ymouse,true))
   {
      var _loc6_ = this._ldrMap._xmouse;
      var _loc7_ = this._ldrMap._ymouse;
      var _loc4_ = this.getCoordinatesFromReal(_loc6_,_loc7_);
      if(this._bTimerEnable != true)
      {
         if(!Key.isDown(16) && this._sPopupGoTo)
         {
            this._sPopupGoTo = false;
         }
         if(!Key.isDown(16) && this._sPopupGoTo != true)
         {
            this._bTimerEnable = true;
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"mapnavigator",this,this.onClickTimer,ank.gapi.Constants.DBLCLICK_DELAY);
         }
         else
         {
            var _loc5_ = _global.API.ui.createPopupMenu();
            _loc5_.addItem("Aller à cette position (" + _loc4_.x + " ," + _loc4_.y + ")",this,this.goToPosition,[_loc4_]);
            _loc5_.show(_root._xmouse,_root._ymouse,true);
            this._sPopupGoTo = true;
         }
      }
      else
      {
         this.onClickTimer();
         this.dispatchEvent({type:"doubleClick",coordinates:_loc4_});
      }
   }
};
_loc1.goToPosition = function(_loc2_)
{
   this._sPopupGoTo = false;
   var _loc4_ = this._parent.api.kernel.AreasManager.getSubAreaIDFromCoordinates(_loc2_.x,_loc2_.y,this._parent._dmMap.superarea);
   _global.API.network.Account.onMoveToPosition(_loc2_.x,_loc2_.y,_loc4_);
};
_loc1.moveMap = function(nXWay, nYWay)
{
   this.setMapPosition(this._nXCurrent + nXWay,this._nYCurrent + nYWay);
   this.dispatchEvent({type:"moveMap"});
};
_loc1.addPositionPathView = function(_loc2_)
{
   var _loc2_ = 0;
   while(true)
   {
      var _loc4_ = this._mcMap["line" + _loc2_];
      if(_loc4_ == undefined)
      {
         break;
      }
      _loc2_ = _loc2_ + 1;
      _loc1.clear();
   }
   _loc2_ = 0;
   while(_loc2_ < _loc2_.length)
   {
      _loc4_ = _loc2_[_loc2_];
      var _loc5_ = _loc2_[_loc2_ + 1];
      if(_loc5_ != undefined)
      {
         var _loc3_ = this._mcMap["line" + _loc2_];
         if(_loc3_ != undefined)
         {
            _loc3_.clear();
         }
         else
         {
            _loc3_ = this._mcMap.createEmptyMovieClip("line" + _loc2_,Number(8000 + _loc2_));
         }
         var _loc7_ = this.getRealFromCoordinates(_loc4_.x,_loc4_.y);
         var _loc6_ = this.getRealFromCoordinates(_loc5_.x,_loc5_.y);
         _loc3_.lineStyle(5 * (this.zoom / 100),9828340,100);
         _loc3_.moveTo(_loc7_.x + 20 * (this.zoom / 100),_loc7_.y + 11.5 * (this.zoom / 100));
         _loc3_.lineTo(_loc6_.x + 20 * (this.zoom / 100),_loc6_.y + 11.5 * (this.zoom / 100));
      }
      _loc2_ += 1;
   }
};
_loc1.onMouseDown = function()
{
   if(this._sInteractionMode == "move")
   {
      if(this._mcMapBackground.hitTest(_root._xmouse,_root._ymouse,true))
      {
         delete this._oLastCoordsOver;
         var _loc3_ = this.getCoordinatesFromReal(this._ldrMap._xmouse,this._ldrMap._ymouse);
         this._nXRefPress = _loc3_.x;
         this._nYRefPress = _loc3_.y;
         this.gapi.hideTooltip();
         this.gapi.setCursor({iconFile:"MapNavigatorMoveCursor"});
      }
   }
};
_loc1.click = function(_loc2_)
{
   _global.API.kernel.debug(_loc2_.target._name);
   switch(_loc2_.target._name)
   {
      case "_btnNW":
         this.moveMap(-1,-1);
         break;
      case "_btnN":
         this.moveMap(0,-1);
         break;
      case "_btnNE":
         this.moveMap(1,-1);
         break;
      case "_btnW":
         this.moveMap(-1,0);
         break;
      case "_btnE":
         this.moveMap(1,0);
         break;
      case "_btnSW":
         this.moveMap(-1,1);
         break;
      case "_btnS":
         this.moveMap(0,1);
         break;
      case "_btnSE":
         this.moveMap(1,1);
         break;
      case "_btnLocateClick":
         var _loc6_ = this._ldrMap._xmouse;
         var _loc5_ = this._ldrMap._ymouse;
         var _loc3_ = this.getCoordinatesFromReal(_loc6_,_loc5_);
         _global.API.kernel.debug(this._sInteractionMode);
         switch(this._sInteractionMode)
         {
            case "zoom+":
            case "zoom-":
               var _loc4_ = this._nZoom + (this._sInteractionMode != "zoom+" ? -5 : 5);
               if(_loc4_ == 0)
               {
                  _loc4_ = 5;
               }
               this._nZoom = _loc4_;
               this.setZoom();
               break;
            case "select":
               this.dispatchEvent({type:"select",coordinates:_loc3_});
               break;
            case "selectPathGo":
               this.dispatchEvent({type:"selectPathGo",coordinates:_loc3_});
               this.goToPosition(_loc3_);
         }
   }
   this.gapi.hideTooltip();
};
