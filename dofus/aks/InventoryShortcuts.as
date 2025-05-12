if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.aks)
{
   _global.dofus.aks = new Object();
}
_global.dofus.aks.InventoryShortcuts = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
_global.dofus.aks.InventoryShortcuts.prototype = new dofus.aks.Handler();
var _loc1 = _global.dofus.aks.InventoryShortcuts.prototype;
_loc1.sendInventoryShortcutAdd = function(_loc2_, nObjectID)
{
   this.aks.send("OrA" + _loc2_ + ";" + nObjectID);
};
_loc1.sendInventoryShortcutMove = function(nOldPosition, nNewPosition)
{
   this.aks.send("OrM" + nOldPosition + ";" + nNewPosition);
};
_loc1.sendInventoryShortcutRemove = function(_loc2_)
{
   this.aks.send("OrR" + _loc2_);
};
_loc1.onInventoryShortcutAdded = function(_loc2_)
{
   var _loc2_ = _loc2_.split(";");
   var _loc3_ = Number(_loc2_[0]);
   var _loc5_ = Number(_loc2_[1]);
   var _loc7_ = _loc2_[2];
   var _loc6_ = new dofus.datacenter.InventoryShortcutItem(_loc5_,_loc3_,_loc7_);
   var _loc4_ = this.api.datacenter.Player.InventoryShortcuts;
   _loc4_.addItemAt(_loc3_,_loc6_);
};
_loc1.onInventoryShortcutRemoved = function(_loc2_)
{
   var _loc3_ = Number(_loc2_);
   var _loc2_ = this.api.datacenter.Player.InventoryShortcuts;
   _loc2_.removeItemAt(_loc3_);
};
ASSetPropFlags(_loc1,null,1);
