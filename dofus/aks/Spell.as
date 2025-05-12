var _loc1 = dofus.aks.Spells.prototype;
_loc1.onList2 = function(Packet)
{
   var _loc8_ = Packet.split(",");
   var _loc9_ = _loc8_[0];
   var _loc13_ = this.api.datacenter.Sprites.getItemAt(_loc9_);
   var _loc6_ = _loc8_[1];
   var _loc12_ = _loc8_[2];
   var _loc7_ = _loc8_[3];
   if(_loc9_ == this.api.datacenter.Player.ID)
   {
      var _loc5_ = this.api.datacenter.Player.SpellsManager;
      var _loc11_ = this.api.gfx.mapHandler.getCellData(_loc12_).spriteOnID;
      var _loc10_ = new dofus.datacenter["\x0b\x18"](_loc6_,_loc11_);
      _loc5_.addLaunchedSpell(_loc10_);
      _loc10_.__set__remainingTurn(_loc7_);
      var _loc2_ = _loc5_._aSpellsDelay.length;
      while(true)
      {
         _loc2_ -= 1;
         if(_loc2_ < 0)
         {
            break;
         }
         var _loc3_ = _loc5_._aSpellsDelay[_loc2_];
         var _loc4_ = _loc3_.spell;
         if(_loc4_.ID == _loc6_)
         {
            _loc3_.remainingTurn = _loc7_;
         }
      }
      this.api.ui.getUIComponent("Banner")._msShortcuts.updateCurrentTabInformations();
   }
};
_loc1.Delete = function(_loc2_)
{
   this.aks.send("SMD" + _loc2_,false);
};
