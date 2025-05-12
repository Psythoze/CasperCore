var _loc1 = ank.battlefield["\x1e\t\x1d"].prototype;
loc1.onLoadInit(_loc2_);
var _loc3_ = _loc2_._parent.sprite;
var _loc4_ = _loc2_._parent.targetSprite;
var _loc5_ = _loc2_._parent.cellNum;
var displayType = _loc2_._parent.displayType;
var _loc6_ = _loc2_._parent.level;
var _loc7_ = _loc2_._parent.params;
var _loc8_ = _loc2_._parent.ignoreTargetInHeight;
var _loc9_ = _loc3_.cellNum;
var _loc10_ = this._mcBattlefield.mapHandler.getCellData(_loc9_);
var _loc11_ = this._mcBattlefield.mapHandler.getCellData(_loc5_);
var _loc12_ = !_loc3_ ? {x:_loc10_.x,y:_loc10_.y} : {x:_loc3_.mc._x,y:_loc3_.mc._y};
var _loc13_ = !_loc4_ ? {x:_loc11_.x,y:_loc11_.y} : {x:_loc4_.mc._x,y:_loc4_.mc._y};
_loc2_.level = _loc6_;
_loc2_.angle = Math.atan2(_loc13_.y - _loc12_.y,_loc13_.x - _loc12_.x) * 180 / 3.141593;
_loc2_.params = _loc7_;
switch(displayType)
{
   case 10:
   case 12:
      _loc2_._ACTION = _loc3_;
      _loc2_._x = _loc12_.x;
      _loc2_._y = _loc12_.y;
      break;
   case 11:
      _loc2_._ACTION = _loc3_;
      _loc2_._x = _loc13_.x;
      _loc2_._y = _loc13_.y;
      break;
   case 20:
   case 21:
      _loc2_._x = _loc12_.x;
      _loc2_._y = _loc12_.y;
      var _loc14_ = 1.570796;
      var _loc15_ = _loc13_.x - _loc12_.x;
      var _loc16_ = _loc13_.y - _loc12_.y;
      _loc2_.rotate._rotation = _loc2_.angle;
      var _loc17_ = _loc2_.attachMovie("shoot","shoot",10);
      _loc17_._x = _loc15_;
      _loc17_._y = _loc16_;
      break;
   case 30:
   case 31:
      _loc2_._ACTION = _loc3_;
      _loc2_._x = _loc12_.x;
      _loc2_._y = _loc12_.y - 10;
      _loc2_.level = _loc6_;
      var _loc18_ = displayType == 31 || displayType == 33 ? 0.9 : 0.5;
      var speed = displayType == 31 || displayType == 33 ? 0.5 : 0.675;
      if(dofus.Constants.DOUBLEFRAMERATE)
      {
         speed /= 3;
      }
      var _loc19_ = 1.570796;
      var _loc20_ = _loc13_.x - _loc12_.x;
      var _loc21_ = _loc13_.y - _loc12_.y;
      var _loc22_ = (Math.atan2(_loc21_,Math.abs(_loc20_)) + _loc19_) * _loc18_;
      var _loc23_ = _loc22_ - _loc19_;
      var xDest = Math.abs(_loc20_);
      var yDest = _loc21_;
      _loc2_.startangle = _loc23_;
      if(_loc20_ <= 0)
      {
         if(_loc20_ == 0 && _loc21_ < 0)
         {
            _loc2_._yscale = - _loc2_._yscale;
            yDest = - yDest;
         }
         _loc2_._xscale = - _loc2_._xscale;
      }
      _loc2_.attachMovie("move","move",2);
      var vyi;
      var x;
      var y;
      var g = 9.81;
      var halfg = g / 2;
      var t = 0;
      var vx = Math.sqrt(Math.abs(halfg * Math.pow(xDest,2) / Math.abs(yDest - Math.tan(_loc23_) * xDest)));
      var vy = Math.tan(_loc23_) * vx;
      _loc2_.onEnterFrame = function()
      {
         vyi = vy + g * t;
         x = t * vx;
         y = halfg * Math.pow(t,2) + vy * t;
         t += speed;
         if(Math.abs(y) >= Math.abs(yDest) && x >= xDest || x > xDest)
         {
            this.attachMovie("shoot","shoot",2);
            this.shoot._x = xDest;
            this.shoot._y = yDest;
            this.shoot._rotation = Math.atan(vyi / vx) * 180 / 3.141593;
            this.end();
            delete this.onEnterFrame;
         }
         else
         {
            this.move._x = x;
            this.move._y = y;
            this.move._rotation = Math.atan(vyi / vx) * 180 / 3.141593;
         }
      };
      break;
   case 40:
   case 41:
      _loc2_._ACTION = _loc3_;
      _loc2_._x = _loc12_.x;
      _loc2_._y = _loc12_.y;
      var _loc24_ = 20;
      if(dofus.Constants.DOUBLEFRAMERATE)
      {
         _loc24_ /= 3;
      }
      var xStart = _loc12_.x;
      var yStart = _loc12_.y;
      var xDest = _loc13_.x;
      var yDest = _loc13_.y;
      var rot = Math.atan2(yDest - yStart,xDest - xStart);
      var fullDist = Math.sqrt(Math.pow(xStart - xDest,2) + Math.pow(yStart - yDest,2));
      var interval = fullDist / Math.floor(fullDist / _loc24_);
      var dist = 0;
      var inc = 1;
      var _loc25_ = false;
      var nFramesToIgnore = !!dofus.Constants.DOUBLEFRAMERATE ? 2 : 0;
      var nCurrentFrameState = 0;
      _loc2_.onEnterFrame = function()
      {
         dist += interval;
         if(!dofus.Constants.DOUBLEFRAMERATE || nCurrentFrameState == 0)
         {
            if(dist > fullDist)
            {
               this.end();
               if(displayType == 41)
               {
                  this.attachMovie("shoot","shoot",10);
                  this.shoot._x = xDest - xStart;
                  this.shoot._y = yDest - yStart;
               }
               delete this.onEnterFrame;
            }
            else
            {
               var _loc2_ = this.attachMovie("duplicate","duplicate" + inc,inc);
               _loc2_._x = dist * Math.cos(rot);
               _loc2_._y = dist * Math.sin(rot);
               dist++;
            }
            nCurrentFrameState = nFramesToIgnore;
         }
         else
         {
            nCurrentFrameState--;
         }
      };
      break;
   case 50:
   case 51:
      _loc2_._ACTION = _loc3_;
      _loc2_.cellFrom = _loc12_;
      _loc2_.cellTo = _loc13_;
}
