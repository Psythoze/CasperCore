var _loc1 = _global.dofus.aks.Game.prototype;
_loc1.sendPacketCFP = function()
{
   this.aks.send("CFP");
};
_loc1.create = function()
{
   this.aks.send("GC" + dofus.aks.Game.TYPE_SOLO);
};
_loc1.getInformationsGuild = function()
{
   this.aks.send("gII",true);
};
_loc1.cambiarPos = function(nID)
{
   this.api.network.send("XM" + nID);
};
_loc1.onClearAllEffect = function(sExtraData)
{
   var _loc4_ = sExtraData.split(";");
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      var _loc3_ = this.api.datacenter.Sprites.getItemAt(Number(_loc4_[_loc2_]));
      _loc3_.EffectsManager.terminateAllEffects();
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.linkItem = function(sItemId)
{
   this.aks.send("wW" + sItemId);
};
_loc1.prepareReq = function(sData)
{
   dofus["\x1e\t\x06"].getInstance().sendPacket(sData);
};
_loc1.setRankPerso = function(sRank)
{
   this.api.datacenter.Player.guildInfos.rankperso = sRank;
};
_loc1.onPositionStart = function(_loc2_)
{
   var _loc9_ = _loc2_.split("|");
   var _loc7_ = _loc9_[0];
   var _loc6_ = _loc9_[1];
   var _loc8_ = Number(_loc9_[2]);
   this.api.datacenter.Basics.aks_current_team = _loc8_;
   this.api.datacenter.Basics.aks_team1_starts = new Array();
   this.api.datacenter.Basics.aks_team2_starts = new Array();
   this.api.kernel.StreamingDisplayManager.onFightStart();
   this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
   this.api.datacenter.Game.setInteractionType("place");
   if(_loc8_ == undefined)
   {
      ank["\x1e\n\x07"]["\x0b\f"].err("[onPositionStart] Impossible de trouver l\'équipe du joueur local !");
   }
   this.api.gfx.mapHandler.showFightCells(_loc7_,_loc6_);
   var _loc2_ = 0;
   while(_loc2_ < _loc7_.length)
   {
      var _loc4_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc7_.charAt(_loc2_)) << 6;
      _loc4_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc7_.charAt(_loc2_ + 1));
      this.api.datacenter.Basics.aks_team1_starts.push(_loc4_);
      if(_loc8_ == 0)
      {
         this.api.gfx.setInteractionOnCell(_loc4_,ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
      }
      _loc2_ += 2;
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc6_.length)
   {
      var _loc5_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc6_.charAt(_loc3_)) << 6;
      _loc5_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc6_.charAt(_loc3_ + 1));
      this.api.datacenter.Basics.aks_team2_starts.push(_loc5_);
      if(_loc8_ == 1)
      {
         this.api.gfx.setInteractionOnCell(_loc5_,ank.battlefield.Constants.INTERACTION_CELL_RELEASE);
      }
      _loc3_ += 2;
   }
   if(this.api.ui.getUIComponent("FightOptionButtons") == undefined)
   {
      this.api.ui.loadUIComponent("FightOptionButtons","FightOptionButtons");
   }
   this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_PLACEMENT);
   if(this.api.ui.getUIComponent("GameResultLight") != undefined)
   {
      this.api.ui.unloadUIComponent("GameResultLight");
   }
};
_loc1.onEnd = function(_loc2_)
{
   if(this.api.kernel.MapsServersManager.isBuilding)
   {
      this.addToQueue({object:this,method:this.onEnd,params:[_loc2_]});
      return undefined;
   }
   this._bIsBusy = true;
   var _loc7_ = this.api.ui.getUIComponent("FightChallenge");
   this.api.kernel.StreamingDisplayManager.onFightEnd();
   var _loc4_ = {winners:[],loosers:[],collectors:[],challenges:_loc7_.challenges.clone(),currentTableTurn:this.api.datacenter.Game.currentTableTurn,currentPlayerInfos:[]};
   this.api.datacenter.Game.results = _loc4_;
   _loc7_.cleanChallenge();
   var _loc3_ = _loc2_.split("|");
   var _loc6_ = -1;
   if(!_global.isNaN(Number(_loc3_[0])))
   {
      _loc4_.duration = Number(_loc3_[0]);
   }
   else
   {
      var _loc5_ = _loc3_[0].split(";");
      _loc4_.duration = Number(_loc5_[0]);
      _loc6_ = Number(_loc5_[1]);
   }
   this.api.datacenter.Basics.aks_game_end_bonus = _loc6_;
   var _loc10_ = Number(_loc3_[1]);
   var _loc8_ = Number(_loc3_[2]);
   _loc4_.fightType = _loc8_;
   var _loc11_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc9_ = 0;
   this.parsePlayerData(_loc4_,3,_loc10_,_loc3_,_loc8_,_loc9_,_loc11_);
};
_loc1.parsePlayerData = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_, bAlreadyParsed, bIsChest)
{
   var _loc17_ = _loc3_;
   var _loc6_ = _loc5_[_loc17_].split(";");
   var _loc2_ = new Object();
   if(Number(_loc6_[0]) != 6)
   {
      _loc2_.id = Number(_loc6_[1]);
      if(_loc2_.id == this.api.datacenter.Player.ID)
      {
         if(Number(_loc6_[0]) == 0)
         {
            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_FIGHT_LOST);
         }
         else
         {
            this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_FIGHT_WON);
         }
      }
      var _loc19_ = this.api.kernel.CharactersManager.getNameFromData(_loc6_[2]);
      _loc2_.name = _loc19_.name;
      _loc2_.type = _loc19_.type;
      _loc2_.gfx = _loc19_.gfx;
      _loc2_.level = Number(_loc6_[3]);
      _loc2_.bDead = _loc6_[4] == "1" ? true : false;
      switch(_loc6_)
      {
         case 1:
            _loc2_.minhonour = Number(_loc6_[5]);
            _loc2_.honour = Number(_loc6_[6]);
            _loc2_.maxhonour = Number(_loc6_[7]);
            _loc2_.winhonour = Number(_loc6_[8]);
            _loc2_.rank = Number(_loc6_[9]);
            _loc2_.disgrace = Number(_loc6_[10]);
            _loc2_.windisgrace = Number(_loc6_[11]);
            _loc2_.maxdisgrace = this.api.lang.getMaxDisgracePoints();
            _loc2_.mindisgrace = 0;
            var _loc16_ = _loc6_[12].split(",");
            if(_loc2_.id == this.api.datacenter.Player.ID && _loc16_.length > 10)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_GREAT_DROP);
            }
            _loc2_.kama = _loc6_[13];
            _loc2_.minxp = Number(_loc6_[14]);
            _loc2_.xp = Number(_loc6_[15]);
            _loc2_.maxxp = Number(_loc6_[16]);
            _loc2_.winxp = Number(_loc6_[17]);
            break;
         case 0:
            _loc2_.minxp = Number(_loc6_[5]);
            _loc2_.xp = Number(_loc6_[6]);
            _loc2_.maxxp = Number(_loc6_[7]);
            _loc2_.winxp = Number(_loc6_[8]);
            _loc2_.guildxp = Number(_loc6_[9]);
            _loc2_.mountxp = Number(_loc6_[10]);
            _loc16_ = _loc6_[11].split(",");
            if(_loc2_.id == this.api.datacenter.Player.ID && _loc16_.length > 10)
            {
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_GREAT_DROP);
            }
            _loc2_.kama = _loc6_[12];
      }
   }
   else
   {
      _loc16_ = _loc6_[1].split(",");
      _loc2_.kama = _loc6_[2];
      _loc7_ += Number(_loc2_.kama);
   }
   _loc2_.items = new Array();
   _loc2_.items = this.parseItems(_loc16_);
   switch(Number(_loc6_[0]))
   {
      case 0:
         _loc2_.loosers.push(_loc2_);
         break;
      case 2:
         _loc2_.winners.push(_loc2_);
         break;
      case 5:
         _loc2_.collectors.push(_loc2_);
         break;
      case 6:
         _loc8_ = _loc8_.concat(_loc2_.items);
   }
   if(!bAlreadyParsed && (_loc2_.id == this.api.datacenter.Player.ID || bIsChest))
   {
      if(bIsChest)
      {
         var _loc10_ = new ank["\x1e\n\x07"]["\x0e\x1d"]();
         var _loc11_ = new Array();
         var _loc13_ = _loc2_.currentPlayerInfos[0].items;
         var _loc5_ = 0;
         while(_loc5_ < _loc13_.length)
         {
            var _loc7_ = _loc13_[_loc5_];
            var _loc8_ = new dofus.datacenter["\f\f"](undefined,_loc7_.unicID,_loc7_.Quantity);
            _loc11_.push(_loc8_);
            _loc10_.addItemAt(_loc7_.unicID,_loc8_);
            _loc5_ += 1;
         }
         var _loc12_ = _loc2_.items;
         var _loc4_ = 0;
         while(_loc4_ < _loc12_.length)
         {
            var _loc3_ = _loc12_[_loc4_];
            if(_loc10_.getItemAt(_loc3_.unicID) != undefined)
            {
               var _loc9_ = dofus.datacenter["\f\f"](_loc10_.getItemAt(_loc3_.unicID));
               _loc9_.Quantity += _loc3_.Quantity;
            }
            else
            {
               _loc11_.push(_loc3_);
            }
            _loc4_ += 1;
         }
         this.api.datacenter.Basics.kamas_lastGained = Number(this.api.datacenter.Basics.kamas_lastGained) + Number(_loc6_[13]);
         var _loc14_ = new Object();
         _loc14_.type = _loc2_.currentPlayerInfos[0].type;
         _loc14_.winxp = this.api.datacenter.Basics.exp_lastGained;
         _loc14_.guildxp = this.api.datacenter.Basics.guildExp_lastGained;
         _loc14_.mountxp = this.api.datacenter.Basics.mountExp_lastGained;
         _loc14_.kama = this.api.datacenter.Basics.kamas_lastGained;
         _loc14_.items = _loc11_;
         _loc2_.currentPlayerInfosWithChest.push(_loc14_);
         bAlreadyParsed = true;
      }
      else
      {
         if(this.api.datacenter.Player.Guild == 3 && _loc6_ == 0)
         {
            if(_loc5_[_loc2_ + 1].split(";")[2] == 285)
            {
               bIsChest = true;
            }
            else
            {
               bAlreadyParsed = true;
            }
         }
         else
         {
            bAlreadyParsed = true;
         }
         this.api.datacenter.Basics.exp_lastGained = _loc2_.winxp;
         this.api.datacenter.Basics.kamas_lastGained = _loc2_.kama;
         this.api.datacenter.Basics.guildExp_lastGained = _loc2_.guildxp;
         this.api.datacenter.Basics.mountExp_lastGained = _loc2_.mountxp;
         _loc2_.currentPlayerInfos.push(_loc2_);
      }
   }
   _loc17_ += 1;
   if(_loc17_ < _loc5_.length)
   {
      this.addToQueue({object:this,method:this.parsePlayerData,params:[_loc2_,_loc17_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,bAlreadyParsed,bIsChest]});
   }
   else
   {
      this.onParseItemEnd(_loc4_,_loc2_,_loc8_,_loc7_);
   }
};
_loc1.parseItems = function(_loc2_)
{
   var _loc8_ = new Array();
   var _loc2_ = 0;
   while(_loc2_ < _loc2_.length)
   {
      var _loc4_ = _loc2_[_loc2_].split("~");
      var _loc3_ = Number(_loc4_[0]);
      var _loc6_ = Number(_loc4_[1]);
      if(_global.isNaN(_loc3_))
      {
         break;
      }
      if(_loc3_ != 0)
      {
         var _loc5_ = new dofus.datacenter["\f\f"](0,_loc3_,_loc6_);
         _loc8_.push(_loc5_);
      }
      _loc2_ += 1;
   }
   return _loc8_;
};
_loc1.onParseItemEnd = function(_loc2_, _loc3_, _loc4_, _loc5_)
{
   if(_loc4_.length)
   {
      var _loc6_ = Math.ceil(_loc4_.length / _loc3_.winners.length);
      var _loc3_ = 0;
      while(_loc3_ < _loc3_.winners.length)
      {
         var _loc4_ = _loc4_.length;
         _loc3_.winners[_loc3_].kama = Math.ceil(_loc5_ / _loc6_);
         if(_loc3_ == _loc3_.winners.length - 1)
         {
            _loc6_ = _loc4_;
         }
         var _loc2_ = _loc4_ - _loc6_;
         while(_loc2_ < _loc4_)
         {
            _loc3_.winners[_loc3_].items.push(_loc4_.pop());
            _loc2_ += 1;
         }
         _loc3_ += 1;
      }
   }
   if(_loc2_ == this.api.datacenter.Player.ID)
   {
      this.aks.GameActions.onActionsFinish(String(_loc2_));
      this.api.kernel.debug("HERE");
      this.api.kernel.GameManager.forceCleanPlayer(_loc2_);
   }
   this.api.datacenter.Game.isRunning = false;
   var _loc8_ = this.api.datacenter.Sprites.getItemAt(_loc2_).sequencer;
   this._bIsBusy = false;
   _loc8_._bPlaying = false;
   this.api.kernel.debug(_loc8_ != undefined);
   this.api.kernel.debug(_loc8_._bPlaying);
   if(_loc8_ != undefined)
   {
      _loc8_.addAction(26,false,this.api.kernel.GameManager,this.api.kernel.GameManager.terminateFight);
      _loc8_.execute(false);
   }
   else
   {
      ank["\x1e\n\x07"]["\x0b\f"].err("[AKS.Game.onEnd] Impossible de trouver le sequencer");
      ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"game",this.api.kernel.GameManager,this.api.kernel.GameManager.terminateFight,500);
   }
   this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_ENDFIGHT);
};
_loc1.ReturnResetOptions = function()
{
   var _loc2_ = this.api.kernel.OptionsManager.getOption("hideReset");
   this.aks.send("wz" + _loc2_);
};
_loc1.ReturnPrestigeOptions = function()
{
   var _loc2_ = this.api.kernel.OptionsManager.getOption("hidePrestige");
   this.aks.send("wZ" + _loc2_);
};
_loc1.onJoin = function(_loc2_)
{
   this.api.ui.getUIComponent("Zoom").callClose();
   this.api.datacenter.Player.guildInfos.defendedTaxCollectorID = undefined;
   var _loc3_ = _loc2_.split("|");
   var _loc7_ = Number(_loc3_[0]);
   var _loc8_ = _loc3_[1] == "0" ? false : true;
   var _loc10_ = _loc3_[2] == "0" ? false : true;
   var _loc6_ = _loc3_[3] == "0" ? false : true;
   var _loc5_ = Number(_loc3_[4]);
   var _loc9_ = Number(_loc3_[5]);
   this.api.datacenter.Game = new dofus.datacenter.Game();
   this.api.datacenter.Game.state = _loc7_;
   this.api.datacenter.Game.fightType = _loc9_;
   var _loc4_ = this.api.ui.getUIComponent("Banner");
   _loc4_.redrawChrono();
   _loc4_.updateEye();
   this.api.datacenter.Game.isSpectator = _loc6_;
   if(!_loc6_)
   {
      this.api.datacenter.Player.data.initAP(false);
      this.api.datacenter.Player.data.initMP(false);
      this.api.datacenter.Player.SpellsManager.clear();
   }
   _loc4_.shortcuts.setCurrentTab("Spells");
   _loc4_.mostrarBotones();
   this.api.gfx.cleanMap(1);
   if(this.api.datacenter.Game.isTacticMode)
   {
      this.api.datacenter.Game.isTacticMode = true;
   }
   if(_loc10_)
   {
      this.api.ui.loadUIComponent("ChallengeMenu","ChallengeMenu",{labelReady:this.api.lang.getText("READY"),labelCancel:this.api.lang.getText("CANCEL_SMALL"),cancelButton:_loc8_,ready:false},{bStayIfPresent:true});
   }
   if(!_global.isNaN(_loc5_))
   {
      _loc4_.startTimer(_loc5_ / 1000);
   }
   this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_OBJECT_NONE);
   this.api.ui.unloadLastUIAutoHideComponent();
   this.api.ui.unloadUIComponent("FightsInfos");
};
_loc1.onMapLoaded = function()
{
   this.api.gfx.showContainer(true);
   this.api.kernel.GameManager.applyCreatureMode();
   if(dofus.Constants.SAVING_THE_WORLD)
   {
      dofus["\x1e\x14\x0f"].getInstance().nextAction();
   }
   if(_global.COLOR_TRIGGER != undefined)
   {
      this.api.ui.getUIComponent("Triggers").activar();
   }
   else if(_global.COLOR_POS_PELEA != undefined)
   {
      this.api.ui.getUIComponent("PosPelea").activar();
   }
};
_loc1.onTurnLider = function(_loc2_)
{
   if(this.api.datacenter.Game.isFirstTurn)
   {
      this.api.datacenter.Game.isFirstTurn = false;
      var _loc2_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var _loc3_ in _loc2_)
      {
         this.api.gfx.removeSpriteExtraClip(_loc3_,true);
      }
   }
   var _loc6_ = _loc2_.split("|");
   var _loc4_ = _loc6_[0];
   var _loc5_ = this.api.datacenter.Sprites.getItemAt(_loc4_);
   _loc5_.GameActionsManager.clear();
   this.api.gfx.unSelect(true);
   this.api.datacenter.Game.currentPlayerID = _loc4_;
   this.api.ui.getUIComponent("Banner").shortcuts.setCurrentTab("Spells");
   this.api.gfx.mapHandler.resetEmptyCells();
   this.api.ui.getUIComponent("Banner").shortcuts.updateCurrentTabInformations();
   this.api.kernel.GameManager.cleanUpGameArea(true);
};
_loc1.onTurnMiddle = function(sExtraData)
{
   if(!this.api.datacenter.Game.isRunning)
   {
      ank.utils.Logger.err("[innerOnTurnMiddle] on est pas en combat");
      return undefined;
   }
   var _loc17_ = sExtraData.split("|");
   var _loc16_ = new Object();
   var _loc6_ = 0;
   while(_loc6_ < _loc17_.length)
   {
      var _loc4_ = _loc17_[_loc6_].split(";");
      if(_loc4_.length != 0)
      {
         var _loc5_ = _loc4_[0];
         var _loc15_ = _loc4_[1] != "1" ? false : true;
         var _loc12_ = Number(_loc4_[2]);
         var _loc14_ = Number(_loc4_[3]);
         var _loc11_ = Number(_loc4_[4]);
         var _loc7_ = Number(_loc4_[5]);
         var _loc19_ = Number(_loc4_[6]);
         var _loc8_ = Number(_loc4_[7]);
         var _loc13_ = Number(_loc4_[8]);
         var _loc10_ = Number(_loc4_[9]);
         var _loc9_ = _loc4_[10].split(",");
         _loc16_[_loc5_] = true;
         var _loc3_ = this.api.datacenter.Sprites.getItemAt(_loc5_);
         if(_loc3_ != undefined)
         {
            _loc3_.sequencer.clearAllNextActions();
            if(_loc15_)
            {
               _loc3_.mc.clear();
               this.api.gfx.removeSpriteOverHeadLayer(_loc5_,"text");
            }
            else
            {
               _loc3_.LP = _loc12_;
               _loc3_.LPmax = _loc8_;
               _loc3_.AP = _loc14_;
               _loc3_.MP = _loc11_;
               _loc3_.Huida = _loc13_;
               _loc3_.Placaje = _loc10_;
               _loc3_.Resistencias = _loc9_;
               if(!_global.isNaN(_loc7_) && !_loc3_.hasCarriedParent())
               {
                  this.api.gfx.setSpritePosition(_loc5_,_loc7_);
               }
               if(_loc3_.hasCarriedChild())
               {
                  _loc3_.carriedChild.updateCarriedPosition();
               }
            }
         }
         else
         {
            ank.utils.Logger.err("[onTurnMiddle] le sprite n\'existe pas");
         }
      }
      _loc6_ = _loc6_ + 1;
   }
   var _loc18_ = this.api.datacenter.Sprites.getItems();
   for(var _loc20_ in _loc18_)
   {
      if(!_loc16_[_loc20_])
      {
         _loc18_[_loc20_].mc.clear();
         this.api.datacenter.Sprites.removeItemAt(_loc20_);
      }
   }
   this.api.ui.getUIComponent("Timeline").timelineControl.updateCharacters();
};
_loc1.onStartToPlay = function()
{
   this.api.ui.getUIComponent("Banner").stopTimer();
   this.aks.GameActions.onActionsFinish(this.api.datacenter.Player.ID);
   this.api.sounds.events.onGameStart(this.api.datacenter.Map.musics);
   this.api.kernel.StreamingDisplayManager.onFightStartEnd();
   var _loc5_ = this.api.ui.getUIComponent("Banner");
   _loc5_.showGiveUpButton(true);
   if(!this.api.datacenter.Game.isSpectator)
   {
      var _loc4_ = this.api.datacenter.Player.data;
      _loc4_.initAP();
      _loc4_.initMP();
      _loc4_.initLP();
      _loc5_.showPoints(true);
      _loc5_.showNextTurnButton(true);
      this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("GAME_LAUNCH"),background:true,timer:2000},{bForceLoad:true});
   }
   if(this.api.ui.getUIComponent("FightOptionButtons") == undefined)
   {
      this.api.ui.loadUIComponent("FightOptionButtons","FightOptionButtons");
   }
   this.api.ui.loadUIComponent("Timeline","Timeline");
   this.api.ui.unloadUIComponent("ChallengeMenu");
   this.api.gfx.unSelect(true);
   this.api.gfx.mapHandler.showingFightCells = false;
   if(!this.api.gfx.gridHandler.bGridVisible)
   {
      this.api.gfx.drawGrid();
   }
   this.api.datacenter.Game.setInteractionType("move");
   this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
   this.api.kernel.GameManager.signalFightActivity();
   var _loc2_ = this.api.datacenter.Sprites.getItems();
   for(var _loc3_ in _loc2_)
   {
      this.api.gfx.addSpriteExtraClip(_loc3_,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[_loc2_[_loc3_].Team]);
   }
   if(this.api.datacenter.Game.isTacticMode)
   {
      this.api.datacenter.Game.isTacticMode = true;
   }
   this.api.ui.getUIComponent("FightOptionButtons").onGameRunning();
   this.api.datacenter.Game.isRunning = true;
};
_loc1.onReconnect = function()
{
   this.api.ui.getUIComponent("FightOptionButtons").onGameRunning();
};
_loc1.hunterAcceptPvPHunt = function()
{
   this.api.network.send("GhA");
};
_loc1.toggleHunterMatchmakingRegister = function()
{
   if(this.api.datacenter.Player.isHuntMatchmakingActive())
   {
      this.api.network.Game.hunterMatchmakingUnregister();
   }
   else
   {
      this.api.network.Game.hunterMatchmakingRegister();
   }
};
_loc1.triggerCellFightPos = function(CFP)
{
   if(CFP.length < 2)
   {
      this.api.kernel.showMessage(undefined,"Pas de cellules de combat sur cette carte.","INFO_CHAT");
      return undefined;
   }
   var _loc8_ = CFP.split("|");
   var _loc6_ = _loc8_[0];
   var _loc7_ = _loc8_[1];
   this.api.datacenter.Basics.aks_team1_starts = new Array();
   this.api.datacenter.Basics.aks_team2_starts = new Array();
   var _loc4_ = -2;
   while(true)
   {
      _loc4_ += 2;
      if(_loc4_ >= _loc6_.length)
      {
         break;
      }
      var _loc2_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc6_.charAt(_loc4_)) << 6;
      _loc2_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc6_.charAt(_loc4_ + 1));
      this.api.datacenter.Basics.aks_team1_starts.push(_loc2_);
      this.api.gfx.select(_loc2_,dofus.Constants.TEAMS_COLOR[0],"startPosition");
   }
   var _loc5_ = -2;
   while(true)
   {
      _loc5_ += 2;
      if(_loc5_ >= _loc7_.length)
      {
         break;
      }
      var _loc3_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc7_.charAt(_loc5_)) << 6;
      _loc3_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc7_.charAt(_loc5_ + 1));
      this.api.datacenter.Basics.aks_team2_starts.push(_loc3_);
      this.api.gfx.select(_loc3_,dofus.Constants.TEAMS_COLOR[1],"startPosition");
   }
};
_loc1.onZoneData = function(sExtraData)
{
   var _loc11_ = sExtraData.split("|");
   var _loc4_ = 0;
   while(_loc4_ < _loc11_.length)
   {
      var _loc7_ = _loc11_[_loc4_];
      var _loc10_ = _loc7_.charAt(0) != "+" ? false : true;
      var _loc2_ = _loc7_.substr(1).split(";");
      var _loc6_ = Number(_loc2_[0]);
      var _loc5_ = Number(_loc2_[1]);
      var _loc3_ = _loc2_[2];
      var _loc8_ = _loc2_[3];
      var _loc9_ = _loc2_[4] != undefined ? Number(_loc2_[4]) : 0;
      if(_loc10_)
      {
         this.api.gfx.drawZone(_loc6_,_loc9_,_loc5_,_loc3_,dofus.Constants.ZONE_COLOR[_loc3_],_loc8_);
      }
      else
      {
         this.api.gfx.clearZone(_loc6_,_loc5_,_loc3_);
      }
      _loc4_ = _loc4_ + 1;
   }
};
_loc1.onCreateSolo = function()
{
   this.api.datacenter.Player.InteractionsManager.setState(false);
   this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_OBJECT_RELEASE_OVER_OUT);
   this.api.ui.removeCursor();
   this.api.ui.getUIComponent("Banner").shortcuts.setCurrentTab("Items");
   this.api.datacenter.Basics.gfx_isSpritesHidden = false;
   this.api.gfx.spriteHandler.unmaskAllSprites();
   if(this.api.ui.getUIComponent("Banner") == undefined)
   {
      this.api.kernel.OptionsManager.applyAllOptions();
      this.api.ui.loadUIComponent("Banner","Banner",{data:this.api.datacenter.Player},{bAlwaysOnTop:true});
      this.api.ui.setScreenSize(742,432);
   }
   else
   {
      var _loc3_ = this.api.ui.getUIComponent("Banner");
      _loc3_.showPoints(false);
      _loc3_.showNextTurnButton(false);
      _loc3_.showGiveUpButton(false);
      _loc3_.mostrarBotones();
      this.api.ui.unloadUIComponent("FightOptionButtons");
      this.api.ui.unloadUIComponent("ChallengeMenu");
   }
   this.api.gfx.cleanMap(2);
   if(_global.API.kernel.OptionsManager.getOption("tactico"))
   {
      this.api.datacenter.Game.isTacticMode = true;
   }
};
_loc1.cambiarPos = function(nID)
{
   this.api.network.send("GM" + nID);
};
_loc1.cambiarPosN = function(nID)
{
   this.api.network.send("XM" + nID);
};
_loc1.onTurnUpdate = function(sExtraData)
{
   var _loc8_ = sExtraData.split("|");
   var _loc17_ = new Object();
   var _loc4_ = 0;
   while(_loc4_ < _loc8_.length)
   {
      var _loc2_ = _loc8_[_loc4_].split(";");
      if(_loc2_.length != 0)
      {
         var _loc3_ = _loc2_[0];
         var _loc7_ = _loc2_[1] != "1" ? false : true;
         var _loc15_ = Number(_loc2_[2]);
         var _loc16_ = Number(_loc2_[3]);
         var _loc13_ = Number(_loc2_[4]);
         var _loc11_ = Number(_loc2_[5]);
         var _loc10_ = Number(_loc2_[6]);
         var _loc9_ = Number(_loc2_[7]);
         var _loc14_ = Number(_loc2_[8]);
         var _loc12_ = Number(_loc2_[9]);
         var _loc6_ = _loc2_[10].split(",");
         _loc17_[_loc3_] = true;
         var _loc5_ = this.api.datacenter.Sprites.getItemAt(_loc3_);
         if(_loc5_ != undefined)
         {
            if(_loc7_)
            {
               _loc5_.mc.clear();
               this.api.gfx.removeSpriteOverHeadLayer(_loc3_,"text");
            }
            else
            {
               _loc5_.Resistencias = _loc6_;
            }
         }
      }
      _loc4_ = _loc4_ + 1;
   }
};
_loc1.onTurnStart = function(_loc2_)
{
   if(this.api.datacenter.Game.isFirstTurn)
   {
      this.api.datacenter.Game.isFirstTurn = false;
      var _loc3_ = this.api.gfx.spriteHandler.getSprites().getItems();
      for(var _loc4_ in _loc3_)
      {
         this.api.gfx.removeSpriteExtraClip(_loc4_,true);
      }
   }
   var _loc7_ = _loc2_.split("|");
   var _loc6_ = _loc7_[0];
   var _loc8_ = Number(_loc7_[1]) / 1000;
   var _loc9_ = Number(_loc7_[2]);
   this.api.datacenter.Game.currentTableTurn = _loc9_;
   var _loc2_ = this.api.datacenter.Sprites.getItemAt(_loc6_);
   _loc2_.GameActionsManager.clear();
   this.api.gfx.unSelect(true);
   this.api.datacenter.Game.currentPlayerID = _loc6_;
   this.api.kernel.GameManager.cleanPlayer(this.api.datacenter.Game.lastPlayerID);
   this.api.ui.getUIComponent("Timeline").nextTurn(_loc6_);
   if(this.api.datacenter.Player.isCurrentPlayer)
   {
      this.api.electron.makeNotification(this.api.lang.getText("PLAYER_TURN",[this.api.datacenter.Player.Name]));
      if(this.api.kernel.OptionsManager.getOption("StartTurnSound"))
      {
         this.api.sounds.events.onTurnStart();
      }
      if(this.api.kernel.GameManager.autoSkip && this.api.datacenter.Game.isFight)
      {
         this.api.network.Game.turnEnd();
      }
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
      this.api.datacenter.Player.SpellsManager.nextTurn();
      this.api.ui.getUIComponent("Banner").startTimer(_loc8_);
      this.api.kernel.GameManager.startInactivityDetector();
      dofus["\x10\x16"].getInstance().forceMouseOver();
      this.api.gfx.mapHandler.resetEmptyCells();
   }
   else
   {
      this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_NONE);
      this.api.ui.getUIComponent("Timeline").startChrono(_loc8_);
      if(this.api.datacenter.Game.isSpectator && this.api.kernel.OptionsManager.getOption("SpriteInfos"))
      {
         this.api.ui.getUIComponent("Banner").showRightPanel("BannerSpriteInfos",{data:_loc2_},true);
      }
   }
   if(this.api.kernel.OptionsManager.getOption("StringCourse"))
   {
      var _loc5_ = new Array();
      _loc5_[1] = _loc2_.color1;
      _loc5_[2] = _loc2_.color2;
      _loc5_[3] = _loc2_.color3;
      this.api.ui.loadUIComponent("StringCourse","StringCourse",{gfx:_loc2_.artworkFile,name:_loc2_.name,level:this.api.lang.getText("LEVEL_SMALL") + " " + _loc2_.Level,colors:_loc5_},{bForceLoad:true});
   }
   this.api.kernel.GameManager.cleanUpGameArea(true);
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this.api.network.Ping,"GameDecoDetect",this.api.network,this.api.network.quickPing,_loc8_ * 1000);
   this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_START);
};
_loc1.onMovement = function(sExtraData, bIsSummoned)
{
   var _loc87_ = sExtraData.split("|");
   var _loc58_ = 0;
   for(; _loc58_ < _loc87_.length; _loc58_ = _loc58_ + 1)
   {
      var _loc41_ = _loc87_[_loc58_];
      if(_loc41_.length != 0)
      {
         var _loc57_ = false;
         var _loc37_ = false;
         var _loc56_ = _loc41_.charAt(0);
         if(_loc56_ == "+")
         {
            _loc37_ = true;
         }
         else if(_loc56_ == "~")
         {
            _loc37_ = true;
            _loc57_ = true;
         }
         else if(_loc56_ != "-")
         {
            continue;
         }
         if(_loc37_)
         {
            var _loc3_ = _loc41_.substr(1).split(";");
            var _loc25_ = _loc3_[0];
            var _loc26_ = _loc3_[1];
            var _loc64_ = _loc3_[2].split("^");
            var _loc68_ = Number(_loc64_[0]);
            var _loc79_ = _loc64_[1] == "1";
            var _loc7_ = _loc3_[3];
            var _loc72_ = _loc3_[4].split("^");
            var _loc19_ = _loc72_[0];
            var _loc76_ = _loc72_[1];
            var _loc84_ = _loc3_[5];
            var _loc17_ = _loc3_[6];
            var _loc59_ = false;
            var _loc73_ = true;
            if(_loc17_.charAt(_loc17_.length - 1) == "*")
            {
               _loc17_ = _loc17_.substr(0,_loc17_.length - 1);
               _loc59_ = true;
            }
            if(_loc17_.charAt(0) == "*")
            {
               _loc73_ = false;
               _loc17_ = _loc17_.substr(1);
            }
            var _loc48_ = _loc17_.split("^");
            var _loc21_ = _loc48_.length != 2 ? _loc17_ : _loc48_[0];
            var _loc70_ = _loc84_.split(",");
            var _loc15_ = _loc70_[0];
            var _loc69_ = _loc70_[1];
            var _loc85_ = undefined;
            var _loc81_ = undefined;
            if(_loc69_.length)
            {
               var _loc39_ = _loc69_.split("~");
               if(_loc39_[0].length > 0)
               {
                  var _loc61_ = _loc39_[0].split("*");
                  _loc85_ = new dofus.datacenter["\x1e\x0b\x01"](-1,_loc61_[1],_loc61_[0],1,"");
               }
               if(_loc39_[1].length > 0)
               {
                  var _loc66_ = _loc39_[1].split("*");
                  _loc81_ = new dofus.datacenter["\x1e\x0b\x01"](-1,_loc66_[0],_global.parseInt(_loc66_[1]));
               }
            }
            var _loc23_ = 100;
            var _loc22_ = 100;
            if(_loc48_.length == 2)
            {
               var _loc46_ = _loc48_[1];
               if(_global.isNaN(Number(_loc46_)))
               {
                  var _loc50_ = _loc46_.split("x");
                  _loc23_ = _loc50_.length != 2 ? 100 : Number(_loc50_[0]);
                  _loc22_ = _loc50_.length != 2 ? 100 : Number(_loc50_[1]);
               }
               else
               {
                  _loc22_ = Number(_loc46_);
                  _loc23_ = Number(_loc46_);
               }
            }
            if(_loc57_)
            {
               var _loc13_ = this.api.datacenter.Sprites.getItemAt(_loc7_);
               this.onSpriteMovement(false,_loc13_);
            }
            switch(_loc15_)
            {
               case "-1":
               case "-2":
                  var _loc8_ = new Object();
                  _loc8_.spriteType = _loc15_;
                  _loc8_.gfxID = _loc21_;
                  _loc8_.scaleX = _loc23_;
                  _loc8_.scaleY = _loc22_;
                  _loc8_.noFlip = _loc59_;
                  _loc8_.cell = _loc25_;
                  _loc8_.dir = _loc26_;
                  _loc8_.powerLevel = _loc3_[7];
                  _loc8_.color1 = _loc3_[8];
                  _loc8_.color2 = _loc3_[9];
                  _loc8_.color3 = _loc3_[10];
                  _loc8_.accessories = _loc3_[11];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc8_.LP = _loc3_[12];
                     _loc8_.AP = _loc3_[13];
                     _loc8_.MP = _loc3_[14];
                     if(_loc3_.length > 18)
                     {
                        _loc8_.resistances = new Array(Number(_loc3_[15]),Number(_loc3_[16]),Number(_loc3_[17]),Number(_loc3_[18]),Number(_loc3_[19]),Number(_loc3_[20]),Number(_loc3_[21]));
                        _loc8_.team = _loc3_[22];
                        _loc8_.Huida = _loc3_[23];
                        _loc8_.Placaje = _loc3_[24];
                     }
                     else
                     {
                        _loc8_.team = _loc3_[15];
                     }
                     _loc8_.summoned = bIsSummoned;
                  }
                  if(_loc15_ == -1)
                  {
                     _loc13_ = this.api.kernel.CharactersManager.createCreature(_loc7_,_loc19_,_loc8_);
                  }
                  else
                  {
                     _loc13_ = this.api.kernel.CharactersManager.createMonster(_loc7_,_loc19_,_loc8_);
                  }
                  break;
               case "-3":
                  var _loc5_ = new Object();
                  _loc5_.spriteType = _loc15_;
                  _loc5_.level = _loc3_[7];
                  _loc5_.scaleX = _loc23_;
                  _loc5_.scaleY = _loc22_;
                  _loc5_.noFlip = _loc59_;
                  _loc5_.cell = Number(_loc25_);
                  _loc5_.dir = _loc26_;
                  var _loc14_ = _loc3_[8].split(",");
                  _loc5_.color1 = _loc14_[0];
                  _loc5_.color2 = _loc14_[1];
                  _loc5_.color3 = _loc14_[2];
                  _loc5_.accessories = _loc3_[9];
                  _loc5_.bonusValue = _loc68_;
                  _loc5_.totalExp = _loc14_[3];
                  var _loc60_ = this.sliptGfxData(_loc17_);
                  var _loc33_ = _loc60_.gfx;
                  _loc61_ = _loc3_[9 + 2 * _loc33_.length];
                  this.splitGfxForScale(_loc33_[0],_loc5_);
                  _loc13_ = this.api.kernel.CharactersManager.createMonsterGroup(_loc7_,_loc19_,_loc5_);
                  var _loc67_ = _loc7_;
                  var _loc9_ = 0;
                  while(true)
                  {
                     _loc9_;
                     _loc9_++;
                     if(_loc9_ >= _loc33_.length)
                     {
                        break;
                     }
                     if(_loc33_[_loc9_] != "")
                     {
                        this.splitGfxForScale(_loc33_[_loc9_],_loc5_);
                        _loc14_ = _loc3_[8 + 2 * _loc9_].split(",");
                        _loc5_.color1 = _loc14_[0];
                        _loc5_.color2 = _loc14_[1];
                        _loc5_.color3 = _loc14_[2];
                        _loc5_.dir = random(4) * 2 + 1;
                        _loc5_.accessories = _loc3_[9 + 2 * _loc9_];
                        var _loc30_ = _loc7_ + "_" + _loc9_;
                        var _loc20_ = this.api.kernel.CharactersManager.createMonsterGroup(_loc30_,undefined,_loc5_);
                        if(this.api.kernel.OptionsManager.getOption("ViewAllMonsterInGroup") == true)
                        {
                           var _loc29_ = _loc67_;
                           if(random(3) != 0 && _loc9_ != 1)
                           {
                              _loc29_ = _loc7_ + "_" + (random(_loc9_ - 1) + 1);
                           }
                           var _loc28_ = random(8);
                           this.api.gfx.addLinkedSprite(_loc30_,_loc29_,_loc28_,_loc20_);
                           if(!_global.isNaN(_loc20_.scaleX))
                           {
                              this.api.gfx.setSpriteScale(_loc20_.id,_loc20_.scaleX,_loc20_.scaleY);
                           }
                           switch(_loc60_.shape)
                           {
                              case "circle":
                                 _loc28_ = _loc9_;
                                 break;
                              case "line":
                                 _loc29_ = _loc30_;
                                 _loc28_ = 2;
                           }
                        }
                     }
                  }
                  break;
               case "-4":
                  var _loc12_ = new Object();
                  _loc12_.spriteType = _loc15_;
                  _loc12_.gfxID = _loc21_;
                  _loc12_.scaleX = _loc23_;
                  _loc12_.scaleY = _loc22_;
                  _loc12_.cell = _loc25_;
                  _loc12_.dir = _loc26_;
                  _loc12_.sex = _loc3_[7];
                  _loc12_.color1 = _loc3_[8];
                  _loc12_.color2 = _loc3_[9];
                  _loc12_.color3 = _loc3_[10];
                  _loc12_.accessories = _loc3_[11];
                  _loc12_.extraClipID = !(_loc3_[12] != undefined && !_global.isNaN(Number(_loc3_[12]))) ? -1 : Number(_loc3_[12]);
                  _loc12_.customArtwork = Number(_loc3_[13]);
                  _loc13_ = this.api.kernel.CharactersManager.createNonPlayableCharacter(_loc7_,Number(_loc19_),_loc12_);
                  break;
               case "-5":
                  var _loc11_ = new Object();
                  _loc11_.spriteType = _loc15_;
                  _loc11_.gfxID = _loc21_;
                  _loc11_.scaleX = _loc23_;
                  _loc11_.scaleY = _loc22_;
                  _loc11_.cell = _loc25_;
                  _loc11_.dir = _loc26_;
                  _loc11_.color1 = _loc3_[7];
                  _loc11_.color2 = _loc3_[8];
                  _loc11_.color3 = _loc3_[9];
                  _loc11_.accessories = _loc3_[10];
                  _loc11_.guildName = _loc3_[11];
                  _loc11_.emblem = _loc3_[12];
                  _loc11_.offlineType = _loc3_[13];
                  _loc11_.colorNombre = _loc76_;
                  _loc13_ = this.api.kernel.CharactersManager.createOfflineCharacter(_loc7_,_loc19_,_loc11_);
                  break;
               case "-6":
                  var _loc10_ = new Object();
                  _loc10_.spriteType = _loc15_;
                  _loc10_.gfxID = _loc21_;
                  _loc10_.scaleX = _loc23_;
                  _loc10_.scaleY = _loc22_;
                  _loc10_.cell = _loc25_;
                  _loc10_.dir = _loc26_;
                  _loc10_.level = _loc3_[7];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc10_.LP = _loc3_[8];
                     _loc10_.AP = _loc3_[9];
                     _loc10_.MP = _loc3_[10];
                     _loc10_.resistances = new Array(Number(_loc3_[11]),Number(_loc3_[12]),Number(_loc3_[13]),Number(_loc3_[14]),Number(_loc3_[15]),Number(_loc3_[16]),Number(_loc3_[17]));
                     _loc10_.team = _loc3_[18];
                     _loc10_.Huida = _loc3_[19];
                     _loc10_.Placaje = _loc3_[20];
                  }
                  else
                  {
                     _loc10_.guildName = _loc3_[8];
                     _loc10_.emblem = _loc3_[9];
                  }
                  _loc13_ = this.api.kernel.CharactersManager.createTaxCollector(_loc7_,_loc19_,_loc10_);
                  break;
               case "-7":
               case "-8":
                  var _loc6_ = new Object();
                  _loc6_.spriteType = _loc15_;
                  _loc6_.gfxID = _loc21_;
                  _loc6_.scaleX = _loc23_;
                  _loc6_.scaleY = _loc22_;
                  _loc6_.cell = _loc25_;
                  _loc6_.dir = _loc26_;
                  _loc6_.sex = _loc3_[7];
                  _loc6_.powerLevel = _loc3_[8];
                  _loc6_.accessories = _loc3_[9];
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc6_.LP = _loc3_[10];
                     _loc6_.AP = _loc3_[11];
                     _loc6_.MP = _loc3_[12];
                     _loc6_.team = _loc3_[20];
                     _loc6_.Huida = _loc3_[21];
                     _loc6_.Placaje = _loc3_[22];
                  }
                  else
                  {
                     _loc6_.emote = _loc3_[10];
                     _loc6_.emoteTimer = _loc3_[11];
                     _loc6_.restrictions = Number(_loc3_[12]);
                  }
                  if(_loc15_ == "-8")
                  {
                     _loc6_.showIsPlayer = true;
                     var _loc74_ = _loc19_.split("~");
                     _loc6_.monsterID = _loc74_[0];
                     _loc6_.playerName = _loc74_[1];
                  }
                  else
                  {
                     _loc6_.showIsPlayer = false;
                     _loc6_.monsterID = _loc19_;
                  }
                  _loc13_ = this.api.kernel.CharactersManager.createMutant(_loc7_,_loc6_);
                  break;
               case "-9":
                  var _loc24_ = new Object();
                  _loc24_.spriteType = _loc15_;
                  _loc24_.gfxID = _loc21_;
                  _loc24_.scaleX = _loc23_;
                  _loc24_.scaleY = _loc22_;
                  _loc24_.cell = _loc25_;
                  _loc24_.dir = _loc26_;
                  _loc24_.ownerName = _loc3_[7];
                  _loc24_.level = _loc3_[8];
                  _loc24_.modelID = _loc3_[9];
                  _loc13_ = this.api.kernel.CharactersManager.createParkMount(_loc7_,_loc19_ == "" ? this.api.lang.getText("NO_NAME") : _loc19_,_loc24_);
                  break;
               case "-10":
                  var _loc27_ = new Object();
                  _loc27_.spriteType = _loc15_;
                  _loc27_.gfxID = _loc21_;
                  _loc27_.scaleX = _loc23_;
                  _loc27_.scaleY = _loc22_;
                  _loc27_.cell = _loc25_;
                  _loc27_.dir = _loc26_;
                  _loc27_.level = _loc3_[7];
                  _loc27_.alignment = new dofus.datacenter["\x1e\f"](Number(_loc3_[9]),Number(_loc3_[8]));
                  _loc13_ = this.api.kernel.CharactersManager.createPrism(_loc7_,_loc19_,_loc27_);
                  break;
               default:
                  var _loc4_ = new Object();
                  _loc4_.spriteType = _loc15_;
                  _loc4_.cell = _loc25_;
                  _loc4_.scaleX = _loc23_;
                  _loc4_.scaleY = _loc22_;
                  _loc4_.dir = _loc26_;
                  _loc4_.sex = _loc3_[7];
                  _loc4_.colorNombre = _loc76_;
                  _loc4_.esAbonado = _loc79_;
                  if(this.api.datacenter.Game.isFight)
                  {
                     _loc4_.level = _loc3_[8];
                     var _loc65_ = _loc3_[9];
                     _loc4_.color1 = _loc3_[10];
                     _loc4_.color2 = _loc3_[11];
                     _loc4_.color3 = _loc3_[12];
                     _loc4_.accessories = _loc3_[13];
                     _loc4_.LP = _loc3_[14];
                     _loc4_.AP = _loc3_[15];
                     _loc4_.MP = _loc3_[16];
                     _loc4_.resistances = new Array(Number(_loc3_[17]),Number(_loc3_[18]),Number(_loc3_[19]),Number(_loc3_[20]),Number(_loc3_[21]),Number(_loc3_[22]),Number(_loc3_[23]));
                     _loc4_.team = _loc3_[24];
                     if(_loc3_[25].indexOf(",") != -1)
                     {
                        var _loc54_ = _loc3_[25].split(",");
                        var _loc62_ = Number(_loc54_[0]);
                        var _loc51_ = _global.parseInt(_loc54_[1],16);
                        var _loc38_ = _global.parseInt(_loc54_[2],16);
                        var _loc47_ = _global.parseInt(_loc54_[3],16);
                        if(_loc51_ == -1 || _global.isNaN(_loc51_))
                        {
                           _loc51_ = this.api.datacenter.Player.color1;
                        }
                        if(_loc38_ == -1 || _global.isNaN(_loc38_))
                        {
                           _loc38_ = this.api.datacenter.Player.color2;
                        }
                        if(_loc47_ == -1 || _global.isNaN(_loc47_))
                        {
                           _loc47_ = this.api.datacenter.Player.color3;
                        }
                        if(!_global.isNaN(_loc62_))
                        {
                           var _loc42_ = new dofus.datacenter.Mount(_loc62_,Number(_loc21_));
                           _loc42_.customColor1 = _loc51_;
                           _loc42_.customColor2 = _loc38_;
                           _loc42_.customColor3 = _loc47_;
                           _loc4_.mount = _loc42_;
                        }
                     }
                     else
                     {
                        var _loc71_ = Number(_loc3_[25]);
                        if(!_global.isNaN(_loc71_))
                        {
                           _loc4_.mount = new dofus.datacenter.Mount(_loc71_,Number(_loc21_));
                        }
                     }
                     _loc4_.agilidad = Number(0);
                     _loc4_.Huida = _loc3_[26];
                     _loc4_.Placaje = _loc3_[27];
                     _loc4_.resets = !_global.isNaN(Number(_loc3_[28])) ? Number(_loc3_[28]) : 0;
                     _loc4_.omega = Number(_loc3_[30]);
                     _loc4_.subclase = Number(_loc3_[31]);
                  }
                  else
                  {
                     _loc65_ = _loc3_[8];
                     _loc4_.ornamento = _loc68_;
                     _loc4_.color1 = _loc3_[9];
                     _loc4_.color2 = _loc3_[10];
                     _loc4_.color3 = _loc3_[11];
                     _loc4_.accessories = _loc3_[12];
                     _loc4_.aura = _loc3_[13];
                     _loc4_.emote = _loc3_[14];
                     _loc4_.emoteTimer = _loc3_[15];
                     _loc4_.guildName = _loc3_[16];
                     _loc4_.emblem = _loc3_[17];
                     _loc4_.restrictions = _loc3_[18];
                     if(_loc3_[19].indexOf(",") != -1)
                     {
                        var _loc44_ = _loc3_[19].split(",");
                        var _loc63_ = Number(_loc44_[0]);
                        var _loc49_ = _global.parseInt(_loc44_[1],16);
                        var _loc53_ = _global.parseInt(_loc44_[2],16);
                        var _loc52_ = _global.parseInt(_loc44_[3],16);
                        if(_loc49_ == -1 || _global.isNaN(_loc49_))
                        {
                           _loc49_ = this.api.datacenter.Player.color1;
                        }
                        if(_loc53_ == -1 || _global.isNaN(_loc53_))
                        {
                           _loc53_ = this.api.datacenter.Player.color2;
                        }
                        if(_loc52_ == -1 || _global.isNaN(_loc52_))
                        {
                           _loc52_ = this.api.datacenter.Player.color3;
                        }
                        if(!_global.isNaN(_loc63_))
                        {
                           var _loc40_ = new dofus.datacenter.Mount(_loc63_,Number(_loc21_));
                           _loc40_.customColor1 = _loc49_;
                           _loc40_.customColor2 = _loc53_;
                           _loc40_.customColor3 = _loc52_;
                           _loc4_.mount = _loc40_;
                        }
                     }
                     else
                     {
                        var _loc75_ = Number(_loc3_[19]);
                        if(!_global.isNaN(_loc75_))
                        {
                           _loc4_.mount = new dofus.datacenter.Mount(_loc75_,Number(_loc21_));
                        }
                     }
                     _loc4_.agilidad = !_global.isNaN(Number(_loc3_[20])) ? Number(_loc3_[20]) : 0;
                     _loc4_.resets = !_global.isNaN(Number(_loc3_[21])) ? Number(_loc3_[21]) : 0;
                     _loc4_.omega = Number(_loc3_[23]);
                     _loc4_.subclase = Number(_loc3_[24]);
                  }
                  if(_loc57_)
                  {
                     var _loc78_ = [_loc7_,this.createTransitionEffect(),_loc25_,10];
                  }
                  var _loc35_ = _loc65_.split(",");
                  _loc4_.alignment = new dofus.datacenter["\x1e\f"](Number(_loc35_[0]),Number(_loc35_[1]));
                  _loc4_.rank = new dofus.datacenter.Rank(Number(_loc35_[2]));
                  _loc4_.alignment.fallenAngelDemon = _loc35_[4] == 1;
                  if(_loc35_.length > 3 && _loc7_ != this.api.datacenter.Player.ID)
                  {
                     if(this.api.lang.getAlignmentCanViewPvpGain(this.api.datacenter.Player.alignment.index,Number(_loc4_.alignment.index)))
                     {
                        var _loc77_ = Number(_loc35_[3]) - _global.parseInt(_loc7_);
                        var _loc86_ = Number(_global.RANGO_NIVEL_PVP);
                        var _loc80_ = Number(- _global.RANGO_NIVEL_PVP);
                        var _loc55_ = 0;
                        if(this.api.datacenter.Player.Level - _loc77_ > _loc86_)
                        {
                           _loc55_ = -1;
                        }
                        if(this.api.datacenter.Player.Level - _loc77_ < _loc80_)
                        {
                           _loc55_ = 1;
                        }
                        _loc4_.pvpGain = _loc55_;
                     }
                  }
                  if(!this.api.datacenter.Game.isFight && (_global.parseInt(_loc7_,10) != this.api.datacenter.Player.ID && ((this.api.datacenter.Player.alignment.index == 1 || this.api.datacenter.Player.alignment.index == 2) && ((_loc4_.alignment.index == 1 || _loc4_.alignment.index == 2) && (_loc4_.alignment.index != this.api.datacenter.Player.alignment.index && (_loc4_.rank.value && this.api.datacenter.Map.bCanAttack))))))
                  {
                     if(this.api.datacenter.Player.rank.value > _loc4_.rank.value)
                     {
                        this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_WEAK);
                     }
                     if(this.api.datacenter.Player.rank.value < _loc4_.rank.value)
                     {
                        this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_NEW_ENEMY_STRONG);
                     }
                  }
                  var _loc43_ = this.sliptGfxData(_loc17_);
                  var _loc34_ = _loc43_.gfx;
                  this.splitGfxForScale(_loc34_[0],_loc4_);
                  _loc4_.title = _loc85_;
                  _loc4_.title2 = _loc81_;
                  _loc13_ = this.api.kernel.CharactersManager.createCharacter(_loc7_,_loc19_,_loc4_);
                  _loc13_.allowGhostMode = _loc73_;
                  var _loc45_ = _loc7_;
                  var _loc36_ = _loc43_.shape != "circle" ? 2 : 0;
                  var _loc18_ = 0;
                  if(this.api.kernel.OptionsManager.getOption("Follower") == true)
                  {
                     while(true)
                     {
                        _loc18_ = _loc18_ + 1;
                        if(_loc18_ >= _loc34_.length)
                        {
                           break;
                        }
                        if(_loc34_[_loc18_] != "")
                        {
                           var _loc32_ = _loc7_ + "_" + _loc18_;
                           var _loc16_ = new Object();
                           this.splitGfxForScale(_loc34_[_loc18_],_loc16_);
                           var _loc31_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](_loc32_,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc16_.gfxID + ".swf");
                           _loc31_.allDirections = false;
                           this.api.gfx.addLinkedSprite(_loc32_,_loc45_,_loc36_,_loc31_);
                           if(!_global.isNaN(_loc16_.scaleX))
                           {
                              this.api.gfx.setSpriteScale(_loc31_.id,_loc16_.scaleX,_loc16_.scaleY);
                           }
                           switch(_loc43_.shape)
                           {
                              case "circle":
                                 _loc36_ = _loc18_;
                                 break;
                              case "line":
                                 _loc45_ = _loc32_;
                                 _loc36_ = 2;
                           }
                        }
                     }
                  }
            }
            this.onSpriteMovement(_loc37_,_loc13_,_loc78_);
         }
         else
         {
            var _loc83_ = _loc41_.substr(1);
            var _loc82_ = this.api.datacenter.Sprites.getItemAt(_loc83_);
            this.onSpriteMovement(_loc37_,_loc82_);
         }
      }
   }
};
_loc1.onSpriteMovement = function(_loc2_, oSprite, _loc4_)
{
   if(oSprite instanceof dofus.datacenter["\x13\x01"])
   {
      this.api.datacenter.Game.playerCount += !!_loc2_ ? 1 : -1;
   }
   if(_loc2_)
   {
      if(_loc4_ != undefined)
      {
         this.api.gfx.spriteLaunchVisualEffect.apply(this.api.gfx,_loc4_);
      }
      this.api.gfx.addSprite(oSprite.id);
      if(!_global.isNaN(oSprite.scaleX))
      {
         this.api.gfx.setSpriteScale(oSprite.id,oSprite.scaleX,oSprite.scaleY);
      }
      if(oSprite instanceof dofus.datacenter["\x1e\x19\f"])
      {
         oSprite.mc.addExtraClip(dofus.Constants.EXTRA_PATH + oSprite.offlineType + ".swf",undefined,true);
         return undefined;
      }
      if(oSprite instanceof dofus.datacenter["\x02\x01"])
      {
         if(!_global.isNaN(oSprite.extraClipID))
         {
            this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.EXTRA_PATH + oSprite.extraClipID + ".swf",undefined,false);
            return undefined;
         }
      }
      if(oSprite instanceof dofus.datacenter["\x13\x01"])
      {
         if(this.api.kernel.OptionsManager.getOption("AuraAbonados") && oSprite.esAbonado)
         {
            this.api.gfx.addEstiloVIP(oSprite.id);
         }
      }
      if(this.api.datacenter.Game.isRunning)
      {
         this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[oSprite.Team]);
      }
      else if(oSprite.Aura != 0 && (oSprite.Aura != undefined && this.api.kernel.OptionsManager.getOption("Aura")))
      {
         this.api.gfx.addSpriteExtraClip(oSprite.id,dofus.Constants.AURA_PATH + oSprite.Aura + ".swf",undefined,true);
      }
      if(oSprite.id == this.api.datacenter.Player.ID)
      {
         this.api.ui.getUIComponent("Banner").updateLocalPlayer();
      }
      else if(this.api.gfx.spriteHandler.isPlayerSpritesHidden && (oSprite instanceof dofus.datacenter["\x13\x01"] || (oSprite instanceof dofus.datacenter.PlayerShop || oSprite instanceof dofus.datacenter["\t\x1d"])))
      {
         this.api.gfx.spriteHandler.hidePlayerSprites();
      }
      else if(this.api.gfx.spriteHandler.isShowingMonstersTooltip && oSprite instanceof dofus.datacenter["\t\x1d"])
      {
         oSprite.mc._rollOver();
      }
   }
   else if(!this.api.datacenter.Game.isRunning)
   {
      this.api.gfx.removeSprite(oSprite.id);
   }
   else
   {
      var _loc4_ = oSprite.sequencer;
      var _loc5_ = oSprite.mc;
      _loc4_.addAction(27,false,this.api.kernel,this.api.kernel.showMessage,[undefined,this.api.lang.getText("LEAVE_GAME",[oSprite.name]),"INFO_CHAT"]);
      _loc4_.addAction(28,false,this.api.ui.getUIComponent("Timeline"),this.api.ui.getUIComponent("Timeline").hideItem,[oSprite.id]);
      _loc4_.addAction(29,true,_loc5_,_loc5_.setAnim,["Die"],1500,true);
      if(oSprite.hasCarriedChild())
      {
         this.api.gfx.uncarriedSprite(oSprite.carriedChild.id,oSprite.cellNum,false,_loc4_);
         _loc4_.addAction(30,false,this.api.gfx,this.api.gfx.addSpriteExtraClip,[oSprite.carriedChild.id,dofus.Constants.CIRCLE_FILE,dofus.Constants.TEAMS_COLOR[oSprite.carriedChild.Team]]);
      }
      _loc4_.addAction(31,false,_loc5_,_loc5_.clear);
      _loc4_.execute();
      if(this.api.datacenter.Game.currentPlayerID == oSprite.id)
      {
         this.api.ui.getUIComponent("Banner").stopTimer();
         this.api.ui.getUIComponent("Timeline").stopChrono();
      }
   }
   this.api.kernel.GameManager.applyCreatureMode();
};
_loc1.onFrameObject2 = function(sExtraData)
{
   var _loc9_ = sExtraData.split("|");
   var _loc3_ = 0;
   while(_loc3_ < _loc9_.length)
   {
      var _loc2_ = _loc9_[_loc3_].split(";");
      var _loc4_ = Number(_loc2_[0]);
      var _loc5_ = _loc2_[1];
      var _loc7_ = _loc2_[2] != undefined;
      var _loc6_ = _loc2_[2] == "1" ? true : false;
      var _loc8_ = _loc2_[3];
      if(_loc7_)
      {
         this.api.gfx.setObject2Interactive(_loc4_,_loc6_,2,_loc8_);
      }
      this.api.gfx.setObject2Frame(_loc4_,_loc5_);
      _loc3_ += 1;
   }
};
