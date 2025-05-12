var _loc1 = dofus.aks.Quests.prototype;
_loc1.onList = function(_loc2_)
{
   var _loc8_ = 0;
   var _loc10_ = new Array();
   if(_loc2_.length != 0)
   {
      var _loc9_ = _loc2_.split("|");
      var _loc2_ = 0;
      while(_loc2_ < _loc9_.length)
      {
         var _loc3_ = _loc9_[_loc2_].split(";");
         var _loc5_ = Number(_loc3_[0]);
         var _loc4_ = _loc3_[1] == "1";
         var _loc7_ = Number(_loc3_[2]);
         if(!_loc4_)
         {
            _loc8_ += 1;
         }
         var _loc6_ = new dofus.datacenter["\x1e\x15\x1b"](_loc5_,_loc4_,_loc7_);
         _loc10_.push(_loc6_);
         _loc2_ += 1;
      }
   }
   this.api.datacenter.Temporary["\x1e\x15\x1a"].quests.replaceAll(0,_loc10_);
   this.api.ui.getUIComponent("Quests").setPendingCount(_loc8_);
   this.api.ui.getUIComponent("Temporis").setQuestTemporis(_loc10_);
};
