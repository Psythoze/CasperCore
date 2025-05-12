var _loc1 = ank.battlefield.datacenter["\x13\n"].prototype;
_loc1.__get__isTactic = function(_loc2_)
{
   var _loc2_ = false;
   if(this.layerGroundNum == 0 && (this.groundSlope == 1 && (this.layerObject2Num == 0 || (this.layerObject2Num == 25 || this.layerObject2Num == 1030))))
   {
      if(!this.lineOfSight)
      {
         if(this.layerObject1Num == dofus.Constants.getTacticGfx(_loc2_.subarea,0))
         {
            _loc2_ = true;
         }
      }
      else if(this.movement == 0 || this.movement == 1)
      {
         if(this.layerObject1Num == 10002)
         {
            _loc2_ = true;
         }
      }
      else if(this.layerObject1Num == dofus.Constants.getTacticGfx(_loc2_.subarea,1) || this.layerObject1Num == dofus.Constants.getTacticGfx(_loc2_.subarea,3))
      {
         _loc2_ = true;
      }
   }
   return _loc2_;
};
_loc1.turnTactic = function(_loc2_, _loc3_)
{
   var _loc5_ = this.isTrigger;
   if(this.nPermanentLevel == 0)
   {
      this.nPermanentLevel = 1;
   }
   this.layerGroundNum = 0;
   this.groundSlope = 1;
   this.layerObject1Rot = 0;
   if(!this.lineOfSight)
   {
      this.layerObject1Num = dofus.Constants.getTacticGfx(_loc3_.subarea,0);
      if(dofus.Constants.DEBUG)
      {
         _global.API.kernel.showMessage(undefined,this.layerObject1Num + "Walk.","INFO_CHAT");
      }
   }
   else if(this.movement == 0 || this.movement == 1)
   {
      this.layerObject1Num = 10002;
   }
   else
   {
      var _loc3_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc2_,this.num);
      var _loc6_ = Math.abs(_loc3_.x) % 2 == Math.abs(_loc3_.y) % 2;
      this.layerObject1Num = !!_loc6_ ? dofus.Constants.getTacticGfx(_loc3_.subarea,1) : dofus.Constants.getTacticGfx(_loc3_.subarea,3);
      if(dofus.Constants.DEBUG)
      {
         _global.API.kernel.showMessage(undefined,this.layerObject1Num + "Ground.","INFO_CHAT");
      }
   }
   if(this.layerObject2Num != 25)
   {
      if(!this.lineOfSight)
      {
         this.layerObject2Num = dofus.Constants.getTacticLayerObject2(_loc3_.subarea);
      }
      else if(_loc5_)
      {
         this.layerObject2Num = 1030;
      }
      else
      {
         this.layerObject2Num = 0;
      }
   }
};
_loc1.addProperty("isTactic",function()
{
}
,_loc1.__get__isTactic);
_loc1.estrellas = -1;
_loc1.layerTactico1_1 = 0;
_loc1.layerTactico1_2 = 0;
_loc1.layerTactico2_1 = 0;
_loc1.layerTactico2_2 = 0;
_loc1.oGroundSlope = 1;
