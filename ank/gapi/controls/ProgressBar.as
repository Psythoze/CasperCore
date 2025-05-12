var _loc1 = ank.gapi.controls.ProgressBar.prototype;
_loc1.__get__showAnimOnLoad = function()
{
   return this._bShowAnimOnLoad;
};
_loc1.__set__showAnimOnLoads = function(sData)
{
   this._bShowAnimOnLoad = sData;
};
_loc1.__get__showGradient = function()
{
   return this._bShowGradient;
};
_loc1.__set__showGradient = function(sData)
{
   this._bShowGradient = sData;
};
_loc1.__get__uberValue = function()
{
   return this._nUberValue;
};
_loc1.arrange = function()
{
   var _loc7_ = [this._mcRenderer,this._mcRendererUber];
   var _loc4_ = 0;
   while(_loc4_ < _loc7_.length)
   {
      var _loc2_ = _loc7_[_loc4_];
      _loc2_._mcBgLeft._height = _loc2_._mcBgMiddle._height = _loc2_._mcBgRight._height = this.__height;
      var _loc3_ = _loc2_._mcBgLeft._yscale;
      _loc2_._mcBgLeft._xscale = _loc2_._mcUpLeft._xscale = _loc2_._mcUpLeft._yscale = _loc3_;
      _loc2_._mcBgRight._xscale = _loc2_._mcUpRight._xscale = _loc2_._mcUpRight._yscale = _loc3_;
      _loc2_._mcUpMiddle._yscale = _loc3_;
      var _loc5_ = _loc2_._mcBgLeft._width;
      var _loc6_ = _loc2_._mcBgLeft._width;
      _loc2_._mcBgLeft._x = _loc2_._mcBgLeft._y = _loc2_._mcBgMiddle._y = _loc2_._mcBgRight._y = 0;
      _loc2_._mcUpLeft._x = _loc2_._mcUpLeft._y = _loc2_._mcUpMiddle._y = _loc2_._mcUpRight._y = 0;
      _loc2_._mcBgMiddle._x = _loc2_._mcUpMiddle._x = _loc5_;
      _loc2_._mcBgRight._x = this.__width - _loc6_;
      _loc2_._mcBgMiddle._width = this.__width - _loc5_ - _loc6_ + 0.5;
      _loc2_._mcUpLeft._width += 0.5;
      if(this._bShowGradient)
      {
         _loc2_._mcGradientLeft._xscale = _loc2_._mcGradientLeft._yscale = _loc3_;
         _loc2_._mcGradientRight._xscale = _loc2_._mcGradientRight._yscale = _loc3_;
         _loc2_._mcGradientMiddle._yscale = _loc3_;
         _loc2_._mcGradientLeft._x = _loc2_._mcGradientLeft._y = _loc2_._mcGradientMiddle._y = _loc2_._mcGradientRight._y = 0;
         _loc2_._mcGradientMiddle._x = _loc5_;
         _loc2_._mcGradientLeft._width = _loc2_._mcGradientLeft._width;
      }
      _loc4_ += 1;
   }
};
_loc1.__set__uberValue = function(nUberValue)
{
   if(nUberValue > this._nMaximum)
   {
      nUberValue = this._nMaximum;
   }
   if(nUberValue < this._nMinimum)
   {
      nUberValue = this._nMinimum;
   }
   this._nUberValue = Number(nUberValue);
   this.addToQueue({object:this,method:this.applyValueUber});
};
_loc1.applyValue = function()
{
   var _loc3_ = this._mcRenderer._mcBgLeft._width;
   var _loc7_ = this._mcRenderer._mcBgLeft._width;
   var _loc4_ = this._nValue - this._nMinimum;
   if(_loc4_ == 0)
   {
      this.hideUp(true);
   }
   else
   {
      this.hideUp(false);
      var _loc5_ = this._nMaximum - this._nMinimum;
      var _loc6_ = this.__width - _loc3_ - _loc7_;
      var _loc2_ = Math.floor(_loc4_ / _loc5_ * _loc6_);
      this._mcRenderer._mcUpMiddle._width = _loc2_ + 0.5;
      this._mcRenderer._mcUpRight._x = _loc2_ + _loc3_;
      if(this._bShowGradient)
      {
         this.hideGradient(false);
         this._mcRenderer._mcGradientMiddle._width = _loc2_;
         this._mcRenderer._mcGradientRight._x = _loc2_ + _loc3_;
      }
   }
};
_loc1.draw = function()
{
   var _loc4_ = this.getStyle();
   var _loc13_ = [this._mcRenderer,this._mcRendererUber];
   var _loc12_ = 0;
   while(_loc12_ < _loc13_.length)
   {
      var _loc5_ = _loc13_[_loc12_];
      var _loc3_ = _loc5_ == this._mcRendererUber ? "uber" : "";
      var _loc2_ = _loc5_._mcBgLeft;
      for(var _loc14_ in _loc2_)
      {
         var _loc6_ = _loc14_.split("_")[0];
         this.setMovieClipColor(_loc2_[_loc14_],_loc4_[_loc3_ + _loc6_ + "color"]);
      }
      _loc2_ = _loc5_._mcBgMiddle;
      for(_loc14_ in _loc2_)
      {
         var _loc11_ = _loc14_.split("_")[0];
         this.setMovieClipColor(_loc2_[_loc14_],_loc4_[_loc3_ + _loc11_ + "color"]);
      }
      _loc2_ = _loc5_._mcBgRight;
      for(_loc14_ in _loc2_)
      {
         var _loc8_ = _loc14_.split("_")[0];
         this.setMovieClipColor(_loc2_[_loc14_],_loc4_[_loc3_ + _loc8_ + "color"]);
      }
      _loc2_ = _loc5_._mcUpLeft;
      for(_loc14_ in _loc2_)
      {
         var _loc7_ = _loc14_.split("_")[0];
         this.setMovieClipColor(_loc2_[_loc14_],_loc4_[_loc3_ + _loc7_ + "color"]);
      }
      _loc2_ = _loc5_._mcUpMiddle;
      for(_loc14_ in _loc2_)
      {
         var _loc10_ = _loc14_.split("_")[0];
         this.setMovieClipColor(_loc2_[_loc14_],_loc4_[_loc3_ + _loc10_ + "color"]);
      }
      _loc2_ = _loc5_._mcUpRight;
      for(_loc14_ in _loc2_)
      {
         var _loc9_ = _loc14_.split("_")[0];
         this.setMovieClipColor(_loc2_[_loc14_],_loc4_[_loc3_ + _loc9_ + "color"]);
      }
      _loc12_ += 1;
   }
};
_loc1.uberHideUp = function(_loc2_)
{
   this._mcRendererUber._mcUpLeft._visible = !_loc2_;
   this._mcRendererUber._mcUpMiddle._visible = !_loc2_;
   this._mcRendererUber._mcUpRight._visible = !_loc2_;
};
_loc1.hideGradient = function(_loc2_)
{
   this._mcRenderer._mcGradientLeft._visible = !_loc2_;
   this._mcRenderer._mcGradientMiddle._visible = !_loc2_;
   this._mcRenderer._mcGradientRight._visible = !_loc2_;
};
_loc1.uberHideGradient = function(_loc2_)
{
   this._mcRendererUber._mcGradientLeft._visible = !_loc2_;
   this._mcRendererUber._mcGradientMiddle._visible = !_loc2_;
   this._mcRendererUber._mcGradientRight._visible = !_loc2_;
};
_loc1.createChildren = function()
{
   this.attachMovie(this._sRenderer,"_mcRenderer",10);
   this.attachMovie(this._sRenderer,"_mcRendererUber",20);
   this._mcRendererUber._mcBgLeft._visible = false;
   this._mcRendererUber._mcBgRight._visible = false;
   this._mcRendererUber._mcBgMiddle._visible = false;
   this.hideUp(true);
   this.uberHideUp(true);
   this.hideGradient(true);
   this.uberHideGradient(true);
};
_loc1.applyValueUber = function()
{
   if(this._nUberValue == undefined)
   {
      return undefined;
   }
   var _loc3_ = this._mcRendererUber._mcBgLeft._width;
   var _loc7_ = this._mcRendererUber._mcBgLeft._width;
   var _loc4_ = this._nUberValue - this._nMinimum;
   if(_loc4_ == 0)
   {
      this.uberHideUp(true);
   }
   else
   {
      this.uberHideUp(false);
      var _loc5_ = this._nMaximum - this._nMinimum;
      var _loc6_ = this.__width - _loc3_ - _loc7_;
      var _loc2_ = Math.floor(_loc4_ / _loc5_ * _loc6_);
      this._mcRendererUber._mcUpMiddle._width = _loc2_ + 0.5;
      this._mcRendererUber._mcUpRight._x = _loc2_ + _loc3_;
      if(this._bShowGradient)
      {
         this.uberHideGradient(false);
         this._mcRendererUber._mcGradientMiddle._width = _loc2_;
         this._mcRendererUber._mcGradientRight._x = _loc2_ + _loc3_;
      }
   }
};
_loc1._nUberValue = undefined;
_loc1.addProperty("showAnimOnLoad",_loc1.__get__showAnimOnLoad,_loc1.__set__showAnimOnLoad);
_loc1.addProperty("showGradient",_loc1.__get__showAnimOnLoad,_loc1.__set__showGradient);
_loc1.addProperty("uberValue",_loc1.__get__uberValue,_loc1.__set__uberValue);
