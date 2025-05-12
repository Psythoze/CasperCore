var _loc1 = ank["\x1e\n\x07"]["\x0f\x01"].prototype;
_loc1.addAtPosition = function(_loc2_, _loc3_)
{
   if(_loc2_ == undefined || _loc3_ == undefined)
   {
      return undefined;
   }
   if(this.length < _loc2_)
   {
      var _loc9_ = this[this.length - 1];
      var _loc3_ = this.length;
      while(_loc3_ <= _loc2_)
      {
         if(_loc3_ == _loc2_)
         {
            super.push(_loc3_);
            this.dispatchEvent({type:"modelChanged",eventName:"updateOne",updateIndex:_loc2_});
            return this;
         }
         this.push(undefined);
         _loc3_ += 1;
      }
   }
   this.updateItem(_loc2_,_loc3_);
   return this;
};
_loc1.getItemPosition = function(_loc2_)
{
   if(_loc2_ == undefined)
   {
      return -1;
   }
   var _loc2_ = 0;
   while(_loc2_ < this.length)
   {
      if(this[_loc2_] == _loc2_)
      {
         return _loc2_;
      }
      _loc2_ = _loc2_ + 1;
   }
};
ASSetPropFlags(_loc1,null,1);
