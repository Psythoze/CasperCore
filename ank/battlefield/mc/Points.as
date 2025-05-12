var _loc1 = ank.battlefield.mc.Points.prototype;
_loc1.initialize = function(pointsHandler, _loc3_, _loc4_, _loc5_, _loc6_)
{
   this._pointsHandler = pointsHandler;
   this._nRefY = _loc4_;
   this._nID = _loc3_;
   this.createTextField("_tf",10,0,0,150,100);
   this._tf.autoSize = "left";
   this._tf.embedFonts = true;
   this._tf.selectable = false;
   this._tf.textColor = _loc6_;
   this._tf.text = _loc5_;
   this._tf.setTextFormat(ank.battlefield.Constants.SPRITE_POINTS_TEXTFORMAT);
   this._tf._x = (- this._tf.textWidth) / 2;
   this._tf._y = (- this._tf.textHeight) / 2;
   this._visible = false;
   this._nI = 0;
   if(dofus.Constants.DOUBLEFRAMERATE)
   {
      this._nSz = 300;
      this._nVy = -20;
      this._nOpacity = 100;
   }
   else
   {
      this._nSz = 100;
      this._nVy = -20;
   }
   this._nY = _loc4_;
};
_loc1.animate = function()
{
   this._visible = true;
   this._nCurrentFrame = 0;
   this.onEnterFrame = function()
   {
      this._nCurrentFrame = this._nCurrentFrame + 1;
      if(dofus.Constants.DOUBLEFRAMERATE)
      {
         this._xscale = this._nT;
         this._yscale = this._nT;
         this._alpha = this._nOpacity;
         this._nT = 100 + this._nSz * Math.sin(this._nI += 0.17);
         this._nSz *= 0.95;
         this._nY += this._nVy *= 0.7;
         this._y = this._nY;
         var _loc3_ = this._nRefY - this._nY;
         if(_loc3_ > ank.battlefield.Constants.SPRITE_POINTS_OFFSET)
         {
            this._nOpacity -= 0;
         }
         if(_nCurrentFrame > 16)
         {
            this._nT = this._nSz;
         }
         if(this._nSz <= 0 || this._nCurrentFrame > 25)
         {
            this._bFinished = true;
            this._pointsHandler.onAnimateFinished(this._nID);
            this.removeMovieClip();
            delete this.onEnterFrame;
         }
      }
      else
      {
         this._xscale = this._nT;
         this._yscale = this._nT;
         this._nT = 100 + this._nSz * Math.sin(this._nI += 1.2);
         this._nSz *= 0.85;
         this._nY += this._nVy *= 0.7;
         this._y = this._nY;
         var _loc2_ = this._nRefY - this._nY;
         if(_loc2_ > ank.battlefield.Constants.SPRITE_POINTS_OFFSET)
         {
            this.remove();
         }
         if(!this._bFinished)
         {
            if(_loc2_ > ank.battlefield.Constants.SPRITE_POINTS_OFFSET - 2)
            {
               this._bFinished = true;
               this._pointsHandler.onAnimateFinished(this._nID);
            }
         }
      }
   };
};
