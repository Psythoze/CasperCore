var _loc1 = ank["\x1e\n\x07"]["\x1e\x12\x14"].prototype;
_loc1.addAction = function(_loc2_, bWaitEnd, mRefObject, fFunction, aParams, nDuration)
{
   var _loc2_ = new Object();
   _loc7.debugId = _loc2_;
   _loc2_.id = this.getActionIndex();
   _loc2_.waitEnd = bWaitEnd;
   _loc2_.object = mRefObject;
   _loc2_.fn = fFunction;
   _loc2_.parameters = aParams;
   _loc2_.duration = nDuration;
   this._aActions.push(_loc2_);
};
_loc1.execute = function(_loc2_)
{
   if(this._bPlaying && !_loc2_)
   {
      _global.API.kernel.debug("RETURN ACA");
      return undefined;
   }
   this._bPlaying = true;
   var _loc4_ = true;
   while(_loc4_)
   {
      if(this._aActions.length > 0)
      {
         var _loc3_ = this._aActions[0];
         if(_loc3_.waitEnd)
         {
            _loc3_.object[this._unicID] = _loc3_.id;
         }
         _loc3_.fn.apply(_loc3_.object,_loc3_.parameters);
         if(!_loc3_.waitEnd)
         {
            this.onActionEnd(true);
         }
         else
         {
            _loc4_ = false;
            ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(_loc3_.object,"sequencer",this,this.onActionTimeOut,_loc3_.duration != undefined ? _loc3_.duration * this._nTimeModerator : this._nTimeout,[_loc3_]);
         }
      }
      else
      {
         _loc4_ = false;
         this.stop();
      }
   }
};
