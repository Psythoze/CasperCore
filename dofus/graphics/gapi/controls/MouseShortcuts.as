var _loc1 = dofus["\r\x14"].gapi.controls.MouseShortcuts.prototype;
_loc1.initTexts = function()
{
   this._btnTabSpells.label = this.api.lang.getText("BANNER_TAB_SPELLS");
   this._btnTabSpells2.label = "S2";
   this._btnTabSets.label = "SET";
   this._btnTabItems.label = this.api.lang.getText("BANNER_TAB_ITEMS");
};
_loc1.addListeners = function()
{
   this._btnTabSpells.addEventListener("click",this);
   this._btnTabSpells2.addEventListener("click",this);
   this._btnTabSpells2.addEventListener("over",this);
   this._btnTabSpells2.addEventListener("out",this);
   this._btnTabItems.addEventListener("click",this);
   this._btnTabSpells.addEventListener("over",this);
   this._btnTabItems.addEventListener("over",this);
   this._btnTabSpells.addEventListener("out",this);
   this._btnTabItems.addEventListener("out",this);
   this._btnTabSets.addEventListener("click",this);
   this._btnTabSets.addEventListener("over",this);
   this._btnTabSets.addEventListener("out",this);
   var _loc3_ = 1;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      var _loc2_ = this["_ctr" + _loc3_];
      _loc2_.addEventListener("click",this);
      _loc2_.addEventListener("dblClick",this);
      _loc2_.addEventListener("over",this);
      _loc2_.addEventListener("out",this);
      _loc2_.addEventListener("drag",this);
      _loc2_.addEventListener("drop",this);
      _loc2_.addEventListener("onContentLoaded",this);
      _loc2_.params = {position:_loc3_};
      _loc3_ += 1;
   }
   this._ctrCC.addEventListener("click",this);
   this._ctrCC.addEventListener("over",this);
   this._ctrCC.addEventListener("out",this);
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
   this.api.datacenter.Player.Spells.addEventListener("modelChanged",this);
   this.api.datacenter.Player.Inventory.addEventListener("modelChanged",this);
   this.api.datacenter.Player.SetsRapidos.addEventListener("modelChanged",this);
   this.api.datacenter.Player.InventoryShortcuts.addEventListener("modelChanged",this);
};
_loc1.getCurrentTab = function()
{
   return this._sCurrentTab;
};
_loc1.updateSets = function()
{
   var _loc6_ = new Array();
   var _loc3_ = 0;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc6_[_loc3_] = true;
      _loc3_ += 1;
   }
   var _loc8_ = this.api.datacenter.Player.SetsRapidos;
   for(var _loc9_ in _loc8_)
   {
      var _loc5_ = _loc8_[_loc9_];
      var _loc4_ = _loc5_.ID;
      var _loc7_ = this["_ctr" + _loc4_];
      _loc7_.contentData = _loc5_;
      _loc6_[_loc4_] = false;
   }
   var _loc2_ = 0;
   while(_loc2_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      if(_loc6_[_loc2_])
      {
         this["_ctr" + _loc2_].contentData = undefined;
      }
      _loc2_ += 1;
   }
};
_loc1.updateSpells = function()
{
   var _loc8_ = new Array();
   var _loc4_ = 0;
   while(_loc4_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc8_[_loc4_] = true;
      _loc4_ += 1;
   }
   var _loc9_ = this.api.datacenter.Player.Spells;
   for(var _loc10_ in _loc9_)
   {
      var _loc6_ = _loc9_[_loc10_];
      var _loc7_ = _loc6_.position;
      if(!_global.isNaN(_loc7_))
      {
         var _loc5_ = Number(_loc7_);
         if(this._sCurrentTab == "Spells2")
         {
            _loc5_ -= _global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2;
         }
         this["_ctr" + _loc5_].contentData = _loc6_;
         _loc8_[_loc5_] = false;
      }
   }
   var _loc3_ = 0;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      if(_loc8_[_loc3_])
      {
         this["_ctr" + _loc3_].contentData = undefined;
      }
      _loc3_ += 1;
   }
   this.addToQueue({object:this,method:this.setSpellStateOnAllContainers});
};
_loc1.updateCurrentTabInformations = function()
{
   switch(this._sCurrentTab)
   {
      case "Spells2":
      case "Spells":
         this.updateSpells();
         this._ctrCC._visible = !this.api.datacenter.Player.isMutant;
         break;
      case "Items":
         this.updateItems();
         this._ctrCC._visible = false;
         break;
      case "Sets":
         this.updateSets();
         this._ctrCC._visible = false;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnTabSets":
         this.setCurrentTab("Sets");
         break;
      case "_btnTabSpells2":
         this.api.sounds.events.onBannerSpellItemButtonClick();
         this.setCurrentTab("Spells2");
         break;
      case "_btnTabSpells":
         this.api.sounds.events.onBannerSpellItemButtonClick();
         this.setCurrentTab("Spells");
         break;
      case "_btnTabItems":
         this.api.sounds.events.onBannerSpellItemButtonClick();
         this.setCurrentTab("Items");
         break;
      case "_ctrCC":
         if(this._ctrCC._visible)
         {
            if(this.api.kernel.TutorialManager.isTutorialMode)
            {
               this.api.kernel.TutorialManager.onWaitingCase({code:"CC_CONTAINER_SELECT"});
               break;
            }
            this.api.kernel.GameManager.switchToSpellLaunch(this.api.datacenter.Player.Spells[0],false);
         }
         break;
      default:
         switch(this._sCurrentTab)
         {
            case "Spells2":
            case "Spells":
               this.api.sounds.events.onBannerSpellSelect();
               if(this.api.kernel.TutorialManager.isTutorialMode)
               {
                  this.api.kernel.TutorialManager.onWaitingCase({code:"SPELL_CONTAINER_SELECT",params:[Number(oEvent.target._name.substr(4))]});
                  break;
               }
               if(this.gapi.getUIComponent("Spells") != undefined)
               {
                  return undefined;
               }
               var _loc6_ = oEvent.target.contentData;
               if(_loc6_ == undefined)
               {
                  return undefined;
               }
               this.api.kernel.GameManager.switchToSpellLaunch(_loc6_,true);
               break;
            case "Items":
               if(this.api.kernel.TutorialManager.isTutorialMode)
               {
                  this.api.kernel.TutorialManager.onWaitingCase({code:"OBJECT_CONTAINER_SELECT",params:[Number(oEvent.target._name.substr(4))]});
                  break;
               }
               var _loc4_ = oEvent.target.contentData;
               var _loc2_ = _loc4_ != undefined ? _loc4_.realLinkedItem : undefined;
               if(_loc2_ == undefined)
               {
                  return undefined;
               }
               if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
               {
                  this.api.kernel.GameManager.insertItemInChat(_loc2_);
                  return undefined;
               }
               var _loc5_ = this.gapi.getUIComponent("Inventory");
               if(_loc5_ != undefined)
               {
                  _loc5_.showItemInfos(_loc2_);
                  break;
               }
               if(!this.api.datacenter.Player.checkCanMoveItem())
               {
                  return undefined;
               }
               if(oEvent.keyBoard)
               {
                  if(_loc2_.isEquiped)
                  {
                     this.api.network.Items.movement(_loc2_.ID,-1);
                     return undefined;
                  }
                  if(this.api.network.Items.equipItem(_loc2_))
                  {
                     return undefined;
                  }
               }
               if(this.api.datacenter.Player.canUseObject)
               {
                  if(_loc2_.canTarget)
                  {
                     this.api.kernel.GameManager.switchToItemTarget(_loc2_);
                     break;
                  }
                  if(_loc2_.canUse && oEvent.keyBoard)
                  {
                     this.api.network.Items.use(_loc2_.ID);
                     break;
                  }
                  break;
               }
               break;
         }
   }
};
_loc1.setSpellStateOnAllContainers = function()
{
   if(this._sCurrentTab != "Spells" && this._sCurrentTab != "Spells2")
   {
      return undefined;
   }
   var _loc3_ = this.api.datacenter.Player.Spells;
   if(this._sCurrentTab == "Spells")
   {
      for(var _loc4_ in _loc3_)
      {
         if(!_global.isNaN(_loc3_[_loc4_].position))
         {
            this.setSpellStateOnContainer(_loc3_[_loc4_].position);
         }
      }
   }
   else if(this._sCurrentTab == "Spells2")
   {
      for(_loc4_ in _loc3_)
      {
         if(!_global.isNaN(_loc3_[_loc4_].position))
         {
            this.setSpellStateOnContainer(_loc3_[_loc4_].position - _global.dofus["\r\x13"].gapi.controls.MouseShortcuts.VALOR_TAB2);
         }
      }
   }
   this.setSpellStateOnContainer(0);
};
_loc1.dblClick = function(oEvent)
{
   switch(this._sCurrentTab)
   {
      case "Spells2":
      case "Spells":
         if((_loc0_ = oEvent.target._name) !== "_ctrCC")
         {
            var _loc7_ = oEvent.target.contentData;
         }
         else
         {
            _loc7_ = this.api.datacenter.Player.Spells[0];
         }
         if(_loc7_ == undefined)
         {
            return undefined;
         }
         if(Key.isDown(16))
         {
            var _loc13_ = oEvent.target.params.position;
            this.api.network.send("SN" + _loc7_.ID + "|" + 0,false);
            this.addToQueue({object:this,method:this.setSpellStateOnAllContainers});
            return undefined;
         }
         this.gapi.loadUIAutoHideComponent("SpellInfos","SpellInfos",{spell:_loc7_},{bStayIfPresent:true});
         break;
      case "Items":
      case "Items":
         if(!this.api.datacenter.Player.checkCanMoveItem())
         {
            return undefined;
         }
         var _loc4_ = oEvent.target.contentData;
         var _loc3_ = _loc4_ != undefined ? _loc4_.realLinkedItem : undefined;
         if(_loc3_ == undefined)
         {
            return undefined;
         }
         if(Key.isDown(17))
         {
            _loc7_ = this.api.ui;
            _loc4_ = "POPUP_QUANTITY_BATCH_USE_ITEM_DESCRIPTION";
            _loc3_ = _loc7_.name;
            var _loc10_ = [function(_loc2_, _loc3, _loc4_)
            {
               return String(_loc4_);
            },_loc3_];
            var _loc8_ = _loc7_.Quantity;
            var _loc9_ = _loc7_.loadUIComponent("PopupQuantityWithDescription","PopupQuantityWithDescription",{descriptionLangKey:_loc4_,descriptionLangKeyParams:_loc10_,value:1,max:_loc8_,params:{type:"batchUseItem",item:_loc7_}},{bForceLoad:true});
            var _loc6_ = new Object();
            _loc6_.validate = function(var2)
            {
               var _loc2_ = var2.params.item.ID;
               _global.API.network.send("OT" + _loc2_ + "|" + var2.value);
            };
            _loc9_.addEventListener("validate",_loc6_);
         }
         else
         {
            if(!_loc3_.isEquiped)
            {
               if(!_loc3_.canUse || !this.api.datacenter.Player.canUseObject)
               {
                  this.api.network.Items.equipItem(_loc3_);
               }
               else
               {
                  this.api.network.Items.use(_loc3_.ID);
               }
               break;
            }
            this.api.network.Items.movement(_loc3_.ID,-1);
         }
         break;
      case "Sets":
         _loc7_ = oEvent.target.contentData;
         if(_loc7_ != undefined)
         {
            this.api.network.send("ZSU" + _loc7_.ID);
         }
   }
};
_loc1.over = function(oEvent)
{
   if(!this.gapi.isCursorHidden())
   {
      return undefined;
   }
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) !== "_ctrCC")
   {
      switch(this._sCurrentTab)
      {
         case "Spells2":
         case "Spells":
            var _loc6_ = oEvent.target.contentData;
            if(_loc6_ != undefined)
            {
               this.gapi.showTooltip(_loc6_.name + " (" + _loc6_.apCost + " " + this.api.lang.getText("AP") + (_loc6_.actualCriticalHit <= 0 ? "" : ", " + this.api.lang.getText("ACTUAL_CRITICAL_CHANCE") + ": 1/" + _loc6_.actualCriticalHit) + ")",oEvent.target,-20,{bXLimit:true,bYLimit:false});
            }
            break;
         case "Items":
            var _loc3_ = oEvent.target.contentData;
            if(_loc3_ != undefined)
            {
               var _loc4_ = _loc3_.name;
               if(this.gapi.getUIComponent("Inventory") == undefined)
               {
                  if(_loc3_.canUse && _loc3_.canTarget)
                  {
                     _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK_CLICK");
                  }
                  else
                  {
                     if(_loc3_.canUse)
                     {
                        _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_DBLCLICK");
                     }
                     if(_loc3_.canTarget)
                     {
                        _loc4_ += "\n" + this.api.lang.getText("HELP_SHORTCUT_CLICK");
                     }
                  }
               }
               this.gapi.showTooltip(_loc4_,oEvent.target,-30,{bXLimit:true,bYLimit:false});
            }
            break;
         case "Sets":
            _loc3_ = oEvent.target.contentData;
            if(_loc3_ != undefined)
            {
               this.gapi.showTooltip(_loc3_.name,oEvent.target,-30,{bXLimit:true,bYLimit:false});
            }
      }
   }
   else
   {
      var _loc7_ = this.api.datacenter.Player.Spells[0];
      var _loc8_ = this.api.kernel.GameManager.getCriticalHitChance(this.api.datacenter.Player.weaponItem.criticalHit);
      this.gapi.showTooltip(_loc7_.name + "\n" + _loc7_.descriptionVisibleEffects + " (" + _loc7_.apCost + " " + this.api.lang.getText("AP") + (!!_global.isNaN(_loc8_) ? "" : ", " + this.api.lang.getText("ACTUAL_CRITICAL_CHANCE") + ": 1/" + _loc8_) + ")",oEvent.target,-30,{bXLimit:true,bYLimit:false});
   }
};
_loc1.drop = function(_loc2_)
{
   switch(this._sCurrentTab)
   {
      case "Spells":
      case "Spells2":
         if(this.gapi.getUIComponent("Spells") == undefined && !Key.isDown(16))
         {
            return undefined;
         }
         var _loc5_ = this.gapi.getCursor();
         if(_loc5_ == undefined)
         {
            return undefined;
         }
         this.gapi.removeCursor();
         var _loc6_ = _loc5_.position;
         var _loc4_ = _loc2_.target.params.position;
         if(this._sCurrentTab == "Spells2")
         {
            _loc6_ -= _global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2;
         }
         if(_loc6_ == _loc4_)
         {
            return undefined;
         }
         if(_loc6_ != undefined)
         {
            this["_ctr" + _loc6_].contentData = undefined;
         }
         var _loc9_ = this["_ctr" + _loc4_].contentData;
         if(_loc9_ != undefined)
         {
            _loc9_.position = undefined;
         }
         if(this._sCurrentTab == "Spells2")
         {
            _loc4_ += _global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2;
         }
         _loc5_.position = _loc4_;
         _loc2_.target.contentData = _loc5_;
         this.api.network.Spells.moveToUsed(_loc5_.ID,_loc4_);
         this.addToQueue({object:this,method:this.setSpellStateOnAllContainers});
         break;
      case "Items":
         if(this.gapi.getUIComponent("Inventory") == undefined && !Key.isDown(16))
         {
            return undefined;
         }
         var _loc3_ = this.gapi.getCursor();
         if(_loc3_ == undefined)
         {
            return undefined;
         }
         var _loc8_ = _loc3_.ID;
         if(_loc8_ == -1)
         {
            return undefined;
         }
         this.gapi.removeCursor();
         var _loc7_ = _loc2_.target.params.position;
         if(_loc3_.isShortcut && _loc3_.position == _loc7_)
         {
            return undefined;
         }
         if(_loc3_.isShortcut)
         {
            this.api.network.InventoryShortcuts.sendInventoryShortcutMove(_loc3_.position,_loc7_);
            break;
         }
         this.api.network.InventoryShortcuts.sendInventoryShortcutAdd(_loc7_,_loc8_);
         break;
   }
};
_loc1.modelChanged = function(oEvent)
{
   switch(oEvent.eventName)
   {
      case "updateOne":
      case "updateAll":
   }
   if(oEvent.target == this.api.datacenter.Player.Spells)
   {
      if(this._sCurrentTab == "Spells" || this._sCurrentTab == "Spells2")
      {
         this.updateSpells();
      }
   }
   else if(this._sCurrentTab == "Items")
   {
      this.updateItems();
   }
   else if(this._sCurrentTab == "Sets")
   {
      this.updateSets();
   }
};
_loc1.updateItems = function()
{
   if(this._sCurrentTab != "Items")
   {
      return undefined;
   }
   var _loc8_ = new Array();
   var _loc5_ = 1;
   _loc5_ = 1;
   while(_loc5_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      _loc8_[_loc5_] = true;
      _loc5_ += 1;
   }
   var _loc9_ = this.api.datacenter.Player.InventoryShortcuts.getItems();
   for(var _loc10_ in _loc9_)
   {
      var _loc4_ = _loc9_[_loc10_];
      if(!_global.isNaN(_loc4_.position))
      {
         var _loc7_ = _loc4_.position;
         var _loc6_ = this["_ctr" + _loc7_];
         _loc6_.contentData = _loc4_;
         this.setMovieClipTransform(_loc6_.content,!!_loc4_.findRealItem() ? dofus["\r\x14"].gapi.controls.MouseShortcuts.NO_TRANSFORM : dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
         _loc8_[_loc7_] = false;
      }
   }
   var _loc3_ = 1;
   while(_loc3_ < dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER)
   {
      if(_loc8_[_loc3_])
      {
         this["_ctr" + _loc3_].contentData = undefined;
      }
      _loc3_ += 1;
   }
   this.addToQueue({object:this,method:this.setItemStateOnAllContainers});
};
_loc1.setItemStateOnAllContainers = function()
{
   if(this._sCurrentTab != "Items")
   {
      return undefined;
   }
   var _loc4_ = this.api.datacenter.Player.InventoryShortcuts.getItems();
   for(var _loc5_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc5_];
      if(!(_global.isNaN(_loc3_) && _loc5_ < 1))
      {
         this.setItemStateOnContainer(_loc5_);
      }
   }
   this.setSpellStateOnContainer(0);
};
_loc1.setSpellStateOnContainer = function(nIndex)
{
   var _loc2_ = nIndex != 0 ? this["_ctr" + nIndex] : this._ctrCC;
   var _loc4_ = nIndex != 0 ? _loc2_.contentData : this.api.datacenter.Player.Spells[0];
   if(_loc4_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = this.api.datacenter.Player.SpellsManager.checkCanLaunchSpellReturnObject(_loc4_.ID);
   if(this.api.kernel.TutorialManager.isTutorialMode)
   {
      _loc3_.can = true;
   }
   if(_loc3_.can == false)
   {
      switch(_loc3_.type)
      {
         case "NOT_IN_REQUIRED_STATE":
         case "IN_FORBIDDEN_STATE":
            this.setMovieClipTransform(_loc2_.content,dofus["\r\x14"].gapi.controls.MouseShortcuts.WRONG_STATE_TRANSFORM);
            if(_loc3_.params[1])
            {
               _loc2_.showLabel = true;
               _loc2_.label = _loc3_.params[1];
            }
            else
            {
               _loc2_.showLabel = false;
            }
            break;
         case "IS_AUTOMATIC_END_TURN":
         case "NOT_ENOUGH_AP":
         case "CANT_SUMMON_MORE_CREATURE":
         case "CANT_LAUNCH_MORE":
         case "CANT_RELAUNCH":
         case "NOT_IN_FIGHT":
            _loc2_.showLabel = false;
            this.setMovieClipTransform(_loc2_.content,dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
            break;
         case "CANT_LAUNCH_BEFORE":
            this.setMovieClipTransform(_loc2_.content,dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
            _loc2_.showLabel = true;
            _loc2_.label = _loc3_.params[0];
      }
   }
   else
   {
      _loc2_.showLabel = false;
      this.setMovieClipTransform(_loc2_.content,dofus["\r\x14"].gapi.controls.MouseShortcuts.NO_TRANSFORM);
   }
};
_loc1.setItemStateOnContainer = function(_loc2_)
{
   var _loc3_ = this["_ctr" + _loc2_];
   var _loc2_ = _loc3_.contentData;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this.setMovieClipTransform(_loc3_.content,!!_loc2_.findRealItem() ? dofus["\r\x14"].gapi.controls.MouseShortcuts.NO_TRANSFORM : dofus["\r\x14"].gapi.controls.MouseShortcuts.INACTIVE_TRANSFORM);
   _loc3_.showLabel = _loc2_.label != undefined;
};
_global.dofus["\r\x14"].gapi.controls.MouseShortcuts.MAX_CONTAINER = 31;
_global.dofus["\r\x14"].gapi.controls.MouseShortcuts.VALOR_TAB2 = 31;
