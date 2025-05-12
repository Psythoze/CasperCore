var _loc1 = dofus["\r\x14"].battlefield["\x10\x18"].prototype;
_loc1.onSpriteRollOver = function(_loc2_, _loc3_)
{
   if(!_loc3_)
   {
      this._rollOverMcSprite = _loc2_;
   }
   if(_root._xscale != 100)
   {
      return undefined;
   }
   var _loc4_ = _loc2_.data;
   var _loc6_ = dofus.Constants.OVERHEAD_TEXT_OTHER;
   if(_loc4_.isClear)
   {
      return undefined;
   }
   if(_loc4_.hasParent)
   {
      this.onSpriteRollOver(_loc4_.linkedParent.mc,_loc3_);
      return undefined;
   }
   if(this.api.datacenter.Game.isRunning || this.api.datacenter.Game.interactionType == 5)
   {
      var _loc16_ = this.mapHandler.getCellData(_loc4_.cellNum).mc;
      if(_loc4_.isVisible)
      {
         this.onCellRollOver(_loc16_);
      }
   }
   var _loc5_ = _loc4_.name;
   if(_loc4_ instanceof dofus.datacenter["\t\x07"] && _loc4_.showIsPlayer)
   {
      if(this.api.datacenter.Game.isRunning)
      {
         if(_global.API.kernel.OptionsManager.getOption("ViewHPAsBar"))
         {
            _loc5_ = "";
            this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield.HealthBarOverHead,[_loc4_,100]);
         }
         else
         {
            _loc5_ = _loc4_.playerName + " (" + _loc4_.LP + ")";
         }
         this.showSpriteInfosIfWeNeed(_loc4_);
      }
      else
      {
         _loc5_ = _loc4_.playerName + " [" + _loc4_.monsterName + " (" + _loc4_.Level + ")]";
      }
   }
   else if(_loc4_ instanceof dofus.datacenter["\t\x07"] || (_loc4_ instanceof dofus.datacenter.Creature || _loc4_ instanceof dofus.datacenter["\n\x01"]))
   {
      _loc6_ = dofus.Constants.NPC_ALIGNMENT_COLOR[_loc4_.alignment.index];
      if(this.api.datacenter.Game.isRunning)
      {
         if(_global.API.kernel.OptionsManager.getOption("ViewHPAsBar"))
         {
            _loc5_ = "";
            this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield.HealthBarOverHead,[_loc4_,100]);
         }
         else
         {
            _loc5_ += " (" + _loc4_.LP + ")";
         }
         this.showSpriteInfosIfWeNeed(_loc4_);
      }
      else if(_loc3.ArchiMob)
      {
         _loc5_ += " (" + _loc4_.Level + ")" + " [ARCHI]";
      }
      else
      {
         _loc5_ += " (" + _loc4_.Level + ")";
      }
   }
   else if(_loc4_ instanceof dofus.datacenter["\x13\x01"])
   {
      _loc6_ = dofus.Constants.OVERHEAD_TEXT_CHARACTER;
      if(_loc4_.colorNombre != undefined && _loc4_.colorNombre > -1)
      {
         _loc6_ = "16777215";
      }
      if(this.api.datacenter.Game.isRunning)
      {
         if(_global.API.kernel.OptionsManager.getOption("ViewHPAsBar"))
         {
            _loc5_ = "";
            this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield.HealthBarOverHead,[_loc4_,100]);
         }
         else
         {
            _loc5_ += " (" + _loc4_.LP + ")";
         }
         if(_loc4_.isVisible)
         {
            var _loc11_ = _loc4_.EffectsManager.getEffects();
            if(_loc11_.length != 0)
            {
               this.addSpriteOverHeadItem(_loc4_.id,"effects",dofus["\r\x14"].battlefield["\x0f\n"],[_loc11_]);
            }
         }
         this.showSpriteInfosIfWeNeed(_loc4_);
      }
      else if(this.api.datacenter.Game.isFight)
      {
         _loc5_ += " (" + _loc4_.Level + ")";
      }
      if(!_loc4_.isVisible)
      {
         return undefined;
      }
      var _loc8_ = dofus.Constants.DEMON_ANGEL_FILE;
      if(_loc4_.alignment.fallenAngelDemon)
      {
         _loc8_ = dofus.Constants.FALLEN_DEMON_ANGEL_FILE;
      }
      var _loc9_ = !!_loc4_.haveFakeAlignement ? _loc4_.fakeAlignment.index : _loc4_.alignment.index;
      if(_loc4_.rank.value > 0)
      {
         if(_loc9_ == 1)
         {
            var _loc7_ = _loc4_.rank.value;
         }
         else if(_loc9_ == 2)
         {
            _loc7_ = 10 + _loc4_.rank.value;
         }
         else if(_loc9_ == 3)
         {
            _loc7_ = 20 + _loc4_.rank.value;
         }
      }
      var _loc12_ = _loc4_.title;
      var _loc13_ = _loc4_.title2;
      if(_loc4_.guildName != undefined && _loc4_.guildName.length != 0)
      {
         _loc5_ = "";
         this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield["\r\f"],[_loc4_.guildName,_loc4_.name,_loc4_.emblem,_loc8_,_loc7_,_loc4_.pvpGain,_loc12_,"clips/ornamentos.swf",_loc4_.ornamento,16777215,_loc13_],undefined,true);
      }
   }
   else if(_loc4_ instanceof dofus.datacenter["\x1e\x0b\r"])
   {
      if(this.api.datacenter.Game.isRunning)
      {
         if(_global.API.kernel.OptionsManager.getOption("ViewHPAsBar"))
         {
            _loc5_ = "";
            this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield.HealthBarOverHead,[_loc4_,100]);
         }
         else
         {
            _loc5_ += " (" + _loc4_.LP + ")";
         }
         this.showSpriteInfosIfWeNeed(_loc4_);
      }
      else if(this.api.datacenter.Game.isFight)
      {
         _loc5_ += " (" + _loc4_.Level + ")";
      }
      else
      {
         _loc5_ = "";
         this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield["\r\f"],[_loc4_.guildName,_loc4_.name,_loc4_.emblem]);
      }
   }
   else if(_loc4_ instanceof dofus.datacenter["\x1e\x16\b"])
   {
      _loc8_ = dofus.Constants.DEMON_ANGEL_FILE;
      if(_loc4_.alignment.value > 0)
      {
         if(_loc4_.alignment.index == 1)
         {
            _loc7_ = _loc4_.alignment.value;
         }
         else if(_loc4_.alignment.index == 2)
         {
            _loc7_ = 10 + _loc4_.alignment.value;
         }
         else if(_loc4_.alignment.index == 3)
         {
            _loc7_ = 20 + _loc4_.alignment.value;
         }
      }
      _loc6_ = dofus.Constants.NPC_ALIGNMENT_COLOR[_loc4_.alignment.index];
      this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[_loc5_,_loc8_,_loc6_,_loc7_]);
   }
   else if(_loc4_ instanceof dofus.datacenter["\x1e\x17\x01"])
   {
      _loc6_ = dofus.Constants.OVERHEAD_TEXT_CHARACTER;
      _loc5_ = this.api.lang.getText("MOUNT_PARK_OVERHEAD",[_loc4_.modelName,_loc4_.level,_loc4_.ownerName]);
      this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[_loc5_,_loc8_,_loc6_,_loc7_]);
   }
   else if(_loc4_ instanceof dofus.datacenter["\x1e\x19\f"])
   {
      _loc6_ = dofus.Constants.OVERHEAD_TEXT_CHARACTER;
      _loc5_ = "";
      this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield["\x1e\x19\x0b"],[_loc4_]);
   }
   else if(_loc4_ instanceof dofus.datacenter["\x02\x01"])
   {
      var _loc15_ = this.api.datacenter.Map;
      var _loc14_ = this.api.datacenter.Subareas.getItemAt(_loc15_.subarea);
      if(_loc14_ != undefined)
      {
         _loc6_ = dofus.Constants.NPC_ALIGNMENT_COLOR[_loc14_.alignment.index];
      }
   }
   else if(_loc4_ instanceof dofus.datacenter["\t\x1d"] || _loc4_ instanceof dofus.datacenter.Team)
   {
      if(_loc4_.alignment.index != -1)
      {
         _loc6_ = dofus.Constants.NPC_ALIGNMENT_COLOR[_loc4_.alignment.index];
      }
      var _loc10_ = _loc4_.challenge.fightType;
      if(_loc4_.isVisible && (_loc4_ instanceof dofus.datacenter["\t\x1d"] || _loc4_.type == 1 && (_loc10_ == 2 || (_loc10_ == 3 || _loc10_ == 4))))
      {
         if(_loc5_ != "")
         {
            var _loc17_ = dofus.Constants.OVERHEAD_TEXT_TITLE;
            this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield["\x1e\x0b\x05"],[_loc5_,_loc8_,_loc6_,_loc7_,this.api.lang.getText("LEVEL") + " " + _loc4_.totalLevel,_loc17_,_loc4_.bonusValue,_loc4_.totalExp,_loc4_.sArchi]);
         }
         this.selectSprite(_loc4_.id,true);
         return undefined;
      }
   }
   if(_loc4_.isVisible)
   {
      if(_loc5_ != "")
      {
         this.addSpriteOverHeadItem(_loc4_.id,"text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[_loc5_,_loc8_,_loc6_,_loc7_,_loc4_.pvpGain,_loc12_,"clips/others/css.swf",_loc4_.ornamento,_loc13_]);
      }
      this.selectSprite(_loc4_.id,true);
   }
};
_loc1.onCellRollOver = function(_loc2_)
{
   if(this.api.kernel.TutorialManager.isTutorialMode)
   {
      this.api.kernel.TutorialManager.onWaitingCase({code:"CELL_OVER",params:[_loc2_.num]});
      return undefined;
   }
   if(this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isCurrentPlayer && this.api.datacenter.Game.interactionType != 6))
   {
      return undefined;
   }
   switch(this.api.datacenter.Game.interactionType)
   {
      case 1:
         var _loc11_ = this.api.datacenter.Player;
         var _loc7_ = _loc11_.data;
         var _loc12_ = this.mapHandler.getCellData(_loc2_.num).spriteOnID;
         var _loc8_ = this.api.datacenter.Sprites.getItemAt(_loc12_);
         if(_loc8_ != undefined)
         {
            this.showSpriteInfosIfWeNeed(_loc8_);
         }
         if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkRange(this.mapHandler,_loc7_.cellNum,_loc2_.num,false,0,_loc7_.MP,0))
         {
            this.api.datacenter.Player.InteractionsManager.setState(this.api.datacenter.Game.isFight);
            this.api.datacenter.Player.InteractionsManager.calculatePath(this.mapHandler,_loc2_.num,false,this.api.datacenter.Game.isFight);
         }
         else
         {
            delete this.api.datacenter.Basics.interactionsManager_path;
         }
         break;
      case 2:
      case 3:
         var _loc4_ = this.api.datacenter.Player;
         var _loc5_ = _loc4_.data;
         var _loc15_ = _loc5_.cellNum;
         var _loc6_ = _loc4_.currentUseObject;
         var _loc10_ = _loc4_.SpellsManager;
         var _loc9_ = !!_loc6_.canBoostRange ? _loc5_.CharacteristicsManager.getModeratorValue(19) + _loc4_.RangeModerator : 0;
         this.api.datacenter.Basics.gfx_canLaunch = _loc10_.checkCanLaunchSpellOnCell(this.mapHandler,_loc6_,this.mapHandler.getCellData(_loc2_.num),_loc9_);
         if(this.api.datacenter.Basics.gfx_canLaunch)
         {
            this.api.ui.setCursorForbidden(false);
            this.drawPointer(_loc2_.num);
         }
         else
         {
            this.api.ui.setCursorForbidden(true,dofus.Constants.FORBIDDEN_FILE);
         }
         break;
      case 5:
      case 6:
         this.api.datacenter.Basics.gfx_canLaunch = true;
         this.api.ui.setCursorForbidden(false);
         this.drawPointer(_loc2_.num);
         break;
      case 7:
         this.api.ui.setCursorForbidden(false);
         if(Key.isDown(16))
         {
            if(mcCell.num != undefined)
            {
               if(_global.COLOR_POS_PELEA == 1 || _global.COLOR_POS_PELEA == 2)
               {
                  this.api.network.send("BAADD_FIGHT_POS " + _global.COLOR_POS_PELEA + " " + mcCell.num);
               }
               else if(_global.COLOR_POS_PELEA == 4)
               {
                  this.api.network.send("BAADD_CELL_MOUNTPARK " + mcCell.num);
               }
               else
               {
                  this.api.network.send("BADEL_FIGHT_POS " + mcCell.num);
               }
            }
         }
         break;
      case 8:
         this.api.ui.setCursorForbidden(false);
   }
};
_loc1.onCellRollOut = function(_loc2_)
{
   if(this.api.kernel.TutorialManager.isTutorialMode)
   {
      this.api.kernel.TutorialManager.onWaitingCase({code:"CELL_OUT",params:[_loc2_.num]});
      return undefined;
   }
   if(this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isCurrentPlayer && this.api.datacenter.Game.interactionType != 6))
   {
      return undefined;
   }
   switch(this.api.datacenter.Game.interactionType)
   {
      case 1:
         this.hideSpriteInfos();
         this.unSelect(true);
         break;
      case 3:
         break;
      case 5:
      case 6:
         this.api.ui.setCursorForbidden(true,dofus.Constants.FORBIDDEN_FILE);
         this.api.datacenter.Basics.gfx_canLaunch = false;
         this.hidePointer();
         break;
      case 2:
         this.api.ui.setCursorForbidden(true,dofus.Constants.FORBIDDEN_FILE);
         this.hidePointer();
         this.api.datacenter.Basics.gfx_canLaunch = false;
         this.hideSpriteInfos();
         break;
      case 7:
      case 8:
         this.api.ui.setCursorForbidden(true,dofus.Constants.FORBIDDEN_FILE);
   }
};
_loc1.onCellRelease = function(_loc2_)
{
   if(this.api.kernel.TutorialManager.isTutorialMode)
   {
      this.api.kernel.TutorialManager.onWaitingCase({code:"CELL_RELEASE",params:[_loc2_.num]});
      return false;
   }
   switch(this.api.datacenter.Game.interactionType)
   {
      case 1:
         var _loc4_ = this.api.datacenter.Player.data;
         var _loc5_ = false;
         var _loc13_ = this.api.datacenter.Player.canMoveInAllDirections;
         var _loc14_ = this.api.datacenter.Player.data.isInMove;
         if(this.api.datacenter.Player.InteractionsManager.calculatePath(this.mapHandler,_loc2_.num,true,this.api.datacenter.Game.isFight,false,_loc13_,_loc14_))
         {
            if(this.api.datacenter.Game.isFight)
            {
               _loc5_ = true;
            }
            else
            {
               _loc5_ = this.api.datacenter.Basics.interactionsManager_path[this.api.datacenter.Basics.interactionsManager_path.length - 1].num == _loc2_.num;
            }
         }
         if(!this.api.datacenter.Game.isFight && !_loc5_)
         {
            if(this.api.datacenter.Player.InteractionsManager.calculatePath(this.mapHandler,_loc2_.num,true,this.api.datacenter.Game.isFight,true,_loc13_,_loc14_))
            {
               _loc5_ = true;
            }
         }
         if(_loc5_)
         {
            if(getTimer() - this.api.datacenter.Basics.gfx_lastActionTime < dofus.Constants.CLICK_MIN_DELAY && (_loc4_ == undefined || !_loc4_.isAdminSonicSpeed))
            {
               ank["\x1e\n\x07"]["\x0b\f"].err("T trop rapide du clic");
               return null;
            }
            this.api.datacenter.Basics.gfx_lastActionTime = getTimer();
            if(this.api.datacenter.Basics.interactionsManager_path.length != 0)
            {
               var _loc8_ = ank.battlefield["\x1e\n\x07"]["\x12\r"].compressPath(this.api.datacenter.Basics.interactionsManager_path);
               if(_loc8_ != undefined)
               {
                  if(this.api.datacenter.Game.isFight && this.api.datacenter.Game.isRunning)
                  {
                     var _loc10_ = _loc4_.sequencer;
                     _loc10_.addAction(122,false,_loc4_.GameActionsManager,_loc4_.GameActionsManager.transmittingMove,[1,[_loc8_]]);
                     _loc10_.execute();
                  }
                  else
                  {
                     _loc4_.GameActionsManager.transmittingMove(1,[_loc8_]);
                  }
                  delete this.api.datacenter.Basics.interactionsManager_path;
               }
            }
            return true;
         }
         return false;
         break;
      case 2:
         if(this.api.datacenter.Player.currentUseObject != null && this.api.datacenter.Basics.gfx_canLaunch == true)
         {
            var _loc9_ = this.api.datacenter.Player.data;
            var _loc11_ = _loc9_.sequencer;
            _loc11_.addAction(123,false,_loc9_.GameActionsManager,_loc9_.GameActionsManager.transmittingOther,[300,[this.api.datacenter.Player.currentUseObject.ID,_loc2_.num]]);
            _loc11_.execute();
            this.api.datacenter.Player.currentUseObject = null;
         }
         else if(this.api.datacenter.Basics.spellManager_errorMsg != undefined)
         {
            this.api.kernel.showMessage(undefined,this.api.datacenter.Basics.spellManager_errorMsg,"ERROR_CHAT");
            delete this.api.datacenter.Basics.spellManager_errorMsg;
         }
         this.api.ui.removeCursor();
         this.api.kernel.GameManager.lastSpellLaunch = getTimer();
         this.api.datacenter.Game.setInteractionType("move");
         break;
      case 3:
         if(this.api.datacenter.Player.currentUseObject != null && this.api.datacenter.Basics.gfx_canLaunch == true)
         {
            var _loc7_ = this.api.datacenter.Player.data;
            var _loc12_ = _loc7_.sequencer;
            _loc12_.addAction(124,false,_loc7_.GameActionsManager,_loc7_.GameActionsManager.transmittingOther,[303,[_loc2_.num]]);
            _loc12_.execute();
            this.api.datacenter.Player.currentUseObject = null;
         }
         this.api.ui.removeCursor();
         this.api.kernel.GameManager.lastSpellLaunch = getTimer();
         this.api.datacenter.Game.setInteractionType("move");
         break;
      case 4:
         var _loc15_ = this.mapHandler.getCellData(_loc2_.num).spriteOnID;
         if(_loc15_ != undefined)
         {
            break;
         }
         this.api.network.Game.setPlayerPosition(_loc2_.num);
         break;
      case 5:
         if(this.api.datacenter.Player.currentUseObject != null && this.api.datacenter.Basics.gfx_canLaunch == true)
         {
            this.api.network.Items.use(this.api.datacenter.Player.currentUseObject.ID,this.mapHandler.getCellData(_loc2_.num).spriteOnID,_loc2_.num);
         }
         this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
         this.api.gfx.clearPointer();
         this.unSelect(true);
         this.api.datacenter.Player.reset();
         this.api.ui.removeCursor();
         this.api.datacenter.Game.setInteractionType("move");
         break;
      case 6:
         if(this.api.datacenter.Game.isFight)
         {
            if(_loc2_.num != undefined)
            {
               this.api.network.Game.setFlag(_loc2_.num);
            }
            this.api.gfx.clearPointer();
            this.api.gfx.unSelectAllButOne("startPosition");
            this.api.ui.removeCursor();
            if(this.api.datacenter.Game.isRunning && this.api.datacenter.Game.currentPlayerID == this.api.datacenter.Player.ID)
            {
               this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
               this.api.datacenter.Game.setInteractionType("move");
               break;
            }
            this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
            this.api.datacenter.Game.setInteractionType("place");
         }
         break;
      case 7:
         if(_loc2_.num != undefined)
         {
            if(_global.COLOR_POS_PELEA == 1 || _global.COLOR_POS_PELEA == 2)
            {
               this.api.network.send("BAADD_FIGHT_POS " + _global.COLOR_POS_PELEA + " " + _loc2_.num);
            }
            else if(_global.COLOR_POS_PELEA == 4)
            {
               this.api.network.send("BAADD_CELL_MOUNTPARK " + _loc2_.num);
            }
            else
            {
               this.api.network.send("BADEL_FIGHT_POS " + _loc2_.num);
            }
         }
         break;
      case 8:
         if(_loc2_.num != undefined)
         {
            var _loc6_ = undefined;
            if(_global.COLOR_TRIGGER == 5)
            {
               _loc6_ = _global.CELDA_START;
               _global.MAPA_START = this.api.datacenter.Map.id;
               _global.CELDA_START = _loc2_.num;
               this.api.ui.getUIComponent("Triggers").actualizar();
            }
            else
            {
               if(_global.COLOR_TRIGGER != 4)
               {
                  this.api.network.send("BADEL_TRIGGER " + _loc2_.num);
                  return undefined;
               }
               _loc6_ = _global.CELDA_END;
               _global.MAPA_END = this.api.datacenter.Map.id;
               _global.CELDA_END = _loc2_.num;
               this.api.ui.getUIComponent("Triggers").actualizar();
            }
            if(_loc6_)
            {
               this.api.gfx.clearZone(_loc6_,0,_global.COLOR_TRIGGER);
            }
            this.api.gfx.drawZone(_loc2_.num,0,0,_global.COLOR_TRIGGER,dofus.Constants.ZONE_COLOR[_global.COLOR_TRIGGER]);
            this.api.ui.getUIComponent("Triggers").actualizar();
         }
   }
};
_loc1.onObjectRollOver = function(_loc2_)
{
   this._rollOverMcObject = _loc2_;
   if(_root._xscale != 100)
   {
      return undefined;
   }
   var _loc6_ = _loc2_.cellData;
   var _loc4_ = _loc6_.mc;
   var _loc16_ = _loc6_.layerObject2Num;
   if(this.api.datacenter.Game.interactionType == 5)
   {
      _loc4_ = _loc2_.cellData.mc;
      this.onCellRollOver(_loc4_);
   }
   _loc2_.select(true);
   var _loc5_ = _loc6_.layerObjectExternalData;
   if(_loc5_ != undefined)
   {
      var _loc7_ = _loc5_.name;
      if(_loc5_.durability != undefined)
      {
         if(this.api.datacenter.Map.mountPark.isMine(this.api))
         {
            _loc7_ += "\n" + this.api.lang.getText("DURABILITY") + " : " + _loc5_.durability + "/" + _loc5_.durabilityMax;
         }
      }
      var _loc12_ = new dofus.datacenter["\x13\x01"]("itemOnCell",ank.battlefield.mc["\x1e\x0e\x10"],"",_loc4_.num,0,0);
      this.api.datacenter.Sprites.addItemAt("itemOnCell",_loc12_);
      this.api.gfx.addSprite("itemOnCell");
      this.addSpriteOverHeadItem("itemOnCell","text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[_loc7_,"",dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
   }
   var _loc9_ = this.api.lang.getInteractiveObjectDataByGfxText(_loc16_);
   var _loc13_ = _loc9_.n;
   var _loc20_ = _loc9_.sk;
   var _loc15_ = _loc9_.t;
   switch(_loc15_)
   {
      case 1:
         var _loc18_ = new dofus.datacenter["\x13\x01"]("recursos",ank.battlefield.mc["\x1e\x0e\x10"],"",_loc4_.num,0,0);
         this.api.datacenter.Sprites.addItemAt("recursos",_loc18_);
         this.api.gfx.addSprite("recursos");
         this.addSpriteOverHeadItem("recursos","text",dofus["\r\x14"].battlefield["\x1e\x0b\x05"],["",undefined,undefined,undefined,_loc13_,dofus.Constants.OVERHEAD_TEXT_TITLE,_loc6_.estrellas]);
         break;
      case 13:
         var _loc3_ = this.api.datacenter.Map.mountPark;
         var _loc19_ = new dofus.datacenter["\x13\x01"]("enclos",ank.battlefield.mc["\x1e\x0e\x10"],"",_loc4_.num,0,0);
         this.api.datacenter.Sprites.addItemAt("enclos",_loc19_);
         this.api.gfx.addSprite("enclos");
         if(_loc3_.isPublic)
         {
            this.addSpriteOverHeadItem("enclos","text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[this.api.lang.getText("MOUNTPARK_PUBLIC"),"",dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
         }
         else if(_loc3_.hasNoOwner)
         {
            this.addSpriteOverHeadItem("enclos","text",dofus["\r\x14"].battlefield["\x1e\x0b\x06"],[this.api.lang.getText("MOUNTPARK_TO_BUY",[_loc3_.price,_loc3_.size,_loc3_.items]),"",dofus.Constants.OVERHEAD_TEXT_CHARACTER]);
         }
         else
         {
            if(_loc3_.price > 0)
            {
               var _loc10_ = this.api.lang.getText("MOUNTPARK_PRIVATE_TO_BUY",[_loc3_.price]);
            }
            else
            {
               _loc10_ = this.api.lang.getText("MOUNTPARK_PRIVATE");
            }
            this.addSpriteOverHeadItem("enclos","text",dofus["\r\x14"].battlefield["\r\f"],[_loc3_.guildName,_loc10_,_loc3_.guildEmblem]);
         }
         break;
      case 5:
         var _loc14_ = this.api.lang.getHousesDoorText(this.api.datacenter.Map.id,_loc4_.num);
         var _loc8_ = this.api.datacenter.Houses.getItemAt(_loc14_);
         if(_loc8_.guildName.length > 0)
         {
            var _loc17_ = new dofus.datacenter["\x13\x01"]("porte",ank.battlefield.mc["\x1e\x0e\x10"],"",_loc4_.num,0,0);
            this.api.datacenter.Sprites.addItemAt("porte",_loc17_);
            this.api.gfx.addSprite("porte");
            this.addSpriteOverHeadItem("porte","text",dofus["\r\x14"].battlefield["\r\f"],[this.api.lang.getText("GUILD_HOUSE"),_loc8_.guildName,_loc8_.guildEmblem]);
         }
   }
};
_loc1.onObjectRollOut = function(mcObject)
{
   this.api.ui.hideTooltip();
   if(this.api.datacenter.Game.interactionType == 5)
   {
      var _loc2_ = mcObject.cellData.mc;
      this.onCellRollOut(_loc2_);
   }
   mcObject.select(false);
   this.removeSpriteOverHeadLayer("recursos","text");
   this.removeSprite("recursos",false);
   this.removeSpriteOverHeadLayer("enclos","text");
   this.removeSprite("enclos",false);
   this.removeSpriteOverHeadLayer("porte","text");
   this.removeSprite("porte",false);
   this.removeSpriteOverHeadLayer("itemOnCell","text");
   this.removeSprite("itemOnCell",false);
};
