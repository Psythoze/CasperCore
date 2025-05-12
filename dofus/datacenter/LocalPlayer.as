var _loc1 = dofus.datacenter["\x0b\r"].prototype;
this._bHeroes = new ank["\x1e\n\x07"]["\x0f\x01"]();
_loc1.__set__hero = function(bHero)
{
   _loc1._bHero = bHero;
   this.dispatchEvent({type:"infoHero",value:bHero});
};
_loc1.__get__hero = function()
{
   return _loc1._bHero;
};
_loc1.__set__ogrine = function(bOgrine)
{
   _loc1._bOgrine = bOgrine;
   this.dispatchEvent({type:"playerOgrineChange",value:bOgrine});
   return _loc1._bOgrine;
};
_loc1.__get__ogrine = function()
{
   return _loc1._bOgrine;
};
_loc1.getObjeto = function(nID)
{
   return this.Inventory.findFirstItem("ID",nID);
};
__loc1.__set__ttgCollection = function(bOgrine)
{
   this.ttgCollection = bOgrine;
};
_loc1.addHeroe = function(oData)
{
   this.HeroesList.push(oData);
   this.dispatchEvent({type:"infoHero",value:bHero});
   this.arrangeHeroes();
};
_loc1.getHeroes = function()
{
   return this.HeroesList;
};
_loc1.setHeroes = function(sHeroesList)
{
   this.HeroesList = sHeroesList;
   this.arrangeHeroes();
};
_loc1.clearHeroes = function()
{
   this.HeroesList = new _global.palmad.ank.utils.ExtendedArray();
};
_loc1.arrangeHeroes = function()
{
   var _loc2_ = this.HeroesList.findFirstItem("ID",this.ID);
   if(_loc2_.index != -1)
   {
      this.HeroesList.removeItems(_loc2_.index,1);
      this.HeroesList.unshift(_loc2_.item);
   }
};
_loc1.findHeroe = function(nHeroeId)
{
   var _loc2_ = this.HeroesList.findFirstItem("ID",nHeroeId);
   return _loc2_.item;
};
_loc1.checkCanMoveItem = function()
{
   var _loc5_ = this.api.datacenter.Game.isRunning;
   var _loc4_ = this.api.datacenter.Exchange != undefined;
   var _loc3_ = true;
   var _loc2_ = true;
   if(_loc5_ || (_loc4_ || (!_loc3_ || !_loc2_)))
   {
      this.gapi.loadUIComponent("AskOk","AskOkInventory",{title:this.api.lang.getText("INFORMATIONS"),text:this.api.lang.getText("CANT_MOVE_ITEM")});
   }
   return !(_loc5_ || (_loc4_ || (!_loc3_ || !_loc2_)));
};
_loc1.__set__weaponItem = function(oWeaponItem)
{
   _global.API.kernel.debug("HERE SET " + oWeaponItem);
   this._oWeaponItem = oWeaponItem;
   this.updateCloseCombat();
};
_loc1.__get__ttgCollection = function()
{
   return this.ttgCollection;
};
_loc1.getObjeto = function(nID)
{
   return this.Inventory.findFirstItem("ID",nID);
};
_loc1.ArmaOneWindows = function(_loc2_)
{
   var _loc2_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc2_);
   this.setWeaponItem(_loc2_);
};
_loc1.canBoost = function(_loc2_, _loc3_)
{
   var _loc2_ = this.getBoostCostAndCountForCharacteristic(_loc2_,_loc3_).cost;
   if(this._nBoostPoints >= _loc2_ && _loc2_ != undefined)
   {
      return true;
   }
   return false;
};
_loc1.getBoostCostAndCountForCharacteristicV2 = function(var2)
{
   var _loc3_ = this.api.lang.getClassText(this._nGuild)["b" + var2];
   var _loc6_ = 1;
   var _loc7_ = 1;
   var _loc5_ = 0;
   switch(var2)
   {
      case 10:
         _loc5_ = this._nForce;
         break;
      case 11:
         _loc5_ = this._nVitality;
         break;
      case 12:
         _loc5_ = this._nWisdom;
         break;
      case 13:
         _loc5_ = this._nChance;
         break;
      case 14:
         _loc5_ = this._agility;
         break;
      case 15:
         _loc5_ = this._intelligence;
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc4_ = _loc3_[_loc2_][0];
      if(_loc5_ < _loc4_)
      {
         _loc6_ = _loc3_[_loc2_][1];
         _loc7_ = _loc3_[_loc2_][2] == undefined ? 1 : _loc3_[_loc2_][2];
         break;
      }
      _loc2_ += 1;
   }
   var _loc8_ = _loc4_ - _loc5_;
   return {cost:_loc6_,count:_loc7_,possibleCount:_loc8_};
};
_loc1.clean = function()
{
   this.SpellsManager = new _global.palmad.dofus.managers.SpellsManager(this);
   this.InteractionsManager = new _global.palmad.dofus.managers.InteractionsManager(this,this.api);
   this.Inventory = new _global.palmad.ank.utils.ExtendedArray();
   this.ItemSets = new _global.palmad.ank.utils.ExtendedObject();
   this.Jobs = new _global.palmad.ank.utils.ExtendedArray();
   this.Spells = new _global.palmad.ank.utils.ExtendedArray();
   this.Emotes = new _global.palmad.ank.utils.ExtendedObject();
   this.Titles = new _global.palmad.ank.utils.ExtendedObject();
   this.InventoryByItemPositions = new _global.palmad.ank.utils.ExtendedObject();
   this.InventoryShortcuts = new _global.palmad.ank.utils.ExtendedObject();
   this.SetsRapidos = new _global.palmad.ank.utils.ExtendedArray();
   this.clearSummon();
   this._bCraftPublicMode = false;
   this.ttgCollection = undefined;
   if(this.HeroesList == undefined)
   {
      this.HeroesList = new _global.palmad.ank.utils.ExtendedArray();
   }
   this._bInParty = false;
   _loc1._bOgrine = 0;
};
_loc1.reset = function()
{
   this.currentUseObject = null;
   this.hero = undefined;
   this.api.datacenter.Game.heroPlaying = undefined;
   if(this.HeroesList == undefined)
   {
      this.HeroesList = new _global.palmad.utils.ExtendedArray();
   }
};
_loc1.getSet = function(nID)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",nID);
   if(_loc2_.index == -1)
   {
      return undefined;
   }
   return _loc2_.item;
};
_loc1.dropItem = function(nItemNum)
{
   var _loc2_ = this.Inventory.findFirstItem("ID",nItemNum);
   this.api.kernel.debug("dropItem : " + _loc2_.item.position);
   if(_loc2_.item.position == 1)
   {
      this.setWeaponItem();
   }
   this.Inventory.removeItems(_loc2_.index,1);
};
_loc1.addSet = function(oItem)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",oItem.ID);
   if(_loc2_.index == -1)
   {
      this.SetsRapidos.push(oItem);
   }
   else
   {
      this.SetsRapidos.updateItem(_loc2_.index,oItem);
   }
};
_loc1.updateItem = function(_loc2_)
{
   var _loc2_ = this.Inventory.findFirstItem("ID",_loc2_.ID);
   if(_loc2_.item.ID == _loc2_.ID && _loc2_.item.maxSkin != _loc2_.maxSkin)
   {
      if(!_loc2_.item.isLeavingItem && _loc2_.isLeavingItem)
      {
         this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_ASSOCIATE);
      }
      if(_loc2_.item.isLeavingItem && _loc2_.isLeavingItem)
      {
         this.api.kernel.SpeakingItemsManager.triggerPrivateEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_LEVEL_UP);
      }
   }
   if(_loc2_ != undefined && _loc2_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc2_.position);
   }
   this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.updateItem(_loc2_.index,_loc2_);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(_loc2_.position,_loc2_);
   }
};
_loc1.updateItemPosition = function(_loc2_, _loc3_)
{
   var _loc3_ = this.Inventory.findFirstItem("ID",_loc2_);
   var _loc2_ = _loc3_.item;
   if(_loc2_.position == 1)
   {
      this.setWeaponItem();
   }
   else if(_loc3_ == 1)
   {
      this.setWeaponItem(_loc2_);
   }
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc2_.position);
   }
   _loc2_.position = _loc3_;
   this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.updateItem(_loc3_.index,_loc2_);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(_loc2_.position,_loc2_);
   }
};
_loc1.dropItem = function(_loc2_)
{
   var _loc3_ = this.Inventory.findFirstItem("ID",_loc2_);
   var _loc2_ = _loc3_.item;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   _loc2_.isRemovedFromInventory = true;
   if(_loc3_.item.position == 1)
   {
      this.setWeaponItem();
   }
   this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.removeItems(_loc3_.index,1);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.removeItemAt(_loc2_.position);
   }
};
_loc1.addItem = function(_loc2_)
{
   if(_loc2_.position == 1)
   {
      this.setWeaponItem(_loc2_);
   }
   this.Inventory.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
   this.Inventory.push(_loc2_);
   if(_loc2_.isEquiped)
   {
      this.InventoryByItemPositions.addItemAt(_loc2_.position,_loc2_);
   }
};
_loc1.removeSet = function(nID)
{
   var _loc2_ = this.SetsRapidos.findFirstItem("ID",nID);
   if(_loc2_.index != -1)
   {
      this.SetsRapidos.removeItems(_loc2_.index,1);
   }
};
_loc1._oWeaponItem = undefined;
_loc1.addProperty("weaponItem",_loc1.__get__weaponItem,_loc1.__set__weaponItem);
_loc1.addProperty("Ogrine",_loc1.__get__ogrine,_loc1.__set__ogrine);
_loc1.addProperty("hero",_loc1.__get__hero,_loc1.__set__hero);
