var _loc1 = _global.ank.battlefield["\x1c\n"].prototype;
_loc1.setObject2Frame = function(nCellNum, frame)
{
   if(!this.isMapBuild)
   {
      return undefined;
   }
   this.mapHandler.setObject2Frame(nCellNum,frame);
};
_loc1.setObject2Interactive = function(nCellNum, bInteractive, nPermanentLevel, nEstrellas)
{
   if(!this.isMapBuild)
   {
      return undefined;
   }
   this.mapHandler.setObject2Interactive(nCellNum,bInteractive,nPermanentLevel,nEstrellas);
};
_loc1.activateTacticMode = function(_loc2_)
{
   this.mapHandler.tacticMode(_loc2_);
};
