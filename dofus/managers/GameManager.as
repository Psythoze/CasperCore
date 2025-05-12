var _loc1 = dofus["\x0b\b"].GameManager.prototype;
_global.dofus["\x0b\b"].GameManager.MINIMAL_SPELL_LAUNCH_DELAY = 0;
_loc1.showPlayerPopupMenu = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_, _loc9_, _loc10_)
{
   if(!_loc10_)
   {
      this._sLastClickedMessage = undefined;
   }
   if(_loc9_ == undefined)
   {
      _loc9_ = false;
   }
   var _loc5_ = null;
   if(_loc2_ != undefined)
   {
      _loc5_ = _loc2_;
   }
   else
   {
      if(_loc3_ == undefined)
      {
         return undefined;
      }
      var _loc4_ = this.api.datacenter.Sprites.getItems();
      for(var _loc9_ in _loc4_)
      {
         var _loc3_ = _loc4_[_loc9_];
         if(_loc3_.name.toUpperCase() == _loc3_.toUpperCase())
         {
            _loc5_ = _loc3_;
            break;
         }
      }
   }
   var _loc12_ = this.api.datacenter.Game.isFight;
   var _loc20_ = _loc5_.id;
   var _loc8_ = _loc3_ == undefined ? _loc5_.name : _loc3_;
   if(Key.isDown(16) && _loc8_ != this.api.datacenter.Player.Name && !_loc12_ && !this.api.datacenter.Game.isRunning)
   {
      var _loc10_ = this.api.ui.getUIComponent("Banner");
      _loc10_.txtConsole = "/w " + _loc8_ + " ";
      _loc10_.placeCursorAtTheEnd();
   }
   else if(Key.isDown(16) && _loc8_ != this.api.datacenter.Player.Name && _loc10_ && !this.api.datacenter.Game.isRunning)
   {
      this.api.network.Game.cambiarPosN(_loc12_);
   }
   else
   {
      if(this.api.datacenter.Player.isAuthorized && !_loc9_ && Key.isDown(16))
      {
         var _loc7_ = this.api.kernel.AdminManager.getAdminPopupMenu(_loc8_,false);
         _loc7_.addItem(_loc8_ + " >>",this,this.showPlayerPopupMenu,[_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,true],true);
         _loc7_.items.unshift(_loc7_.items.pop());
      }
      else
      {
         _loc7_ = this.getPlayerPopupMenu(_loc5_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      if(_loc7_.items.length > 0)
      {
         _loc7_.show(_root._xmouse,_root._ymouse,true);
      }
   }
};
_loc1.getPlayerPopupMenu = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_, _loc8_)
{
   var _loc13_ = this.api.datacenter.Game.isFight;
   var _loc11_ = _loc2_.id;
   var _loc10_ = _loc3_ == undefined ? _loc2_.name : _loc3_;
   var _loc2_ = this.api.ui.createPopupMenu();
   _loc2_.addStaticItem(_loc10_);
   var _loc14_ = this.api.kernel.ChatManager.isBlacklisted(_loc10_);
   if(_loc14_)
   {
      _loc2_.addStaticItem("(" + this.api.lang.getText("IGNORED_WORD") + ")");
   }
   if(_loc13_)
   {
      if(!this.api.datacenter.Game.isRunning && (!this.api.datacenter.Player.isMutant || this.api.datacenter.Player.canAttackDungeonMonstersWhenMutant))
      {
         if(_loc2_ != null && _loc11_ != this.api.datacenter.Player.ID)
         {
            if(Key.isDown(16))
            {
               this.api.network.Game.cambiarPosN(_loc11_);
            }
            else
            {
               _loc2_.addItem(this.api.lang.getText("KICK"),this.api.network.Game,this.api.network.Game.leave,[_loc11_]);
               _loc2_.addItem(this.api.lang.getText("SWITCH"),this.api.network.Game,this.api.network.Game.cambiarPosN,[_loc11_]);
            }
         }
      }
   }
   if(_loc11_ == this.api.datacenter.Player.ID)
   {
      _loc2_.addItem("Les commandes >>",this.api.kernel.GameManager,this.api.kernel.GameManager.Comandos);
      _loc2_.addItem(this.api.lang.getText("HIT_HIMSELF"),this.api.network.Chat,this.api.network.Chat.send,[this.api.lang.getText("SLAP_SENTENCE"),"*"]);
      if(!_loc13_ && this.api.datacenter.Player.canBeMerchant)
      {
         _loc2_.addItem(this.api.lang.getText("ORGANIZE_SHOP"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[6]);
         _loc2_.addItem(this.api.lang.getText("MERCHANT_MODE"),this.api.kernel.GameManager,this.api.kernel.GameManager.offlineExchange);
      }
      if(this.api.datacenter.Player.data.isTomb)
      {
         _loc2_.addItem(this.api.lang.getText("FREE_MY_SOUL"),this.api.network.Game,this.api.network.Game.freeMySoul);
      }
      else if(!_loc13_)
      {
         var _loc20_ = _loc2_.animation == "static";
         _loc2_.addItem(this.api.lang.getText("CHANGE_DIRECTION"),this.api.ui,this.api.ui.loadUIComponent,["DirectionChooser","DirectionChooser",{allDirections:this.api.datacenter.Player.canMoveInAllDirections,target:this.api.datacenter.Player.data.mc}]);
      }
   }
   else
   {
      if(_loc7_ != undefined && (_loc7_.length > 0 && (_loc7_ != "" && !_loc14_)))
      {
         var _loc12_ = false;
         var _loc5_ = 0;
         while(_loc5_ < this.api.lang.getConfigText("ENABLED_SERVER_REPORT_LIST").length)
         {
            if(this.api.lang.getConfigText("ENABLED_SERVER_REPORT_LIST")[_loc5_] == this.api.datacenter.Basics.aks_current_server.id)
            {
               _loc12_ = true;
               break;
            }
            _loc5_ += 1;
         }
         if(_loc12_)
         {
            _loc2_.addItem(this.api.lang.getText("REPORT_SENTANCE"),this.api.kernel.GameManager,this.api.kernel.GameManager.reportSentance,[_loc10_,_loc11_,_loc7_,_loc2_]);
         }
      }
      if(!this.api.kernel.ChatManager.isBlacklisted(_loc10_))
      {
         _loc2_.addItem(this.api.lang.getText("BLACKLIST_TEMPORARLY"),this.api.kernel.GameManager,this.api.kernel.GameManager.reportSentance,[_loc10_,_loc11_,undefined,_loc2_]);
      }
      else
      {
         _loc2_.addItem(this.api.lang.getText("BLACKLIST_REMOVE"),this.api.kernel.ChatManager,this.api.kernel.ChatManager.removeToBlacklist,[_loc10_]);
      }
      if(!_loc13_ || _loc13_ && _loc3_ != undefined)
      {
         _loc2_.addItem(this.api.lang.getText("WHOIS"),this.api.network.Basics,this.api.network.Basics.whoIs,[_loc10_]);
         if(_loc5_ != true)
         {
            _loc2_.addItem(this.api.lang.getText("ADD_TO_FRIENDS"),this.api.network.Friends,this.api.network.Friends.addFriend,[_loc10_]);
         }
         if(_loc5_ != true)
         {
            _loc2_.addItem(this.api.lang.getText("ADD_TO_ENEMY"),this.api.network.Enemies,this.api.network.Enemies.addEnemy,[_loc10_]);
         }
         _loc2_.addItem(this.api.lang.getText("WISPER_MESSAGE"),this.api.kernel.GameManager,this.api.kernel.GameManager.askPrivateMessage,[_loc10_]);
         if(_loc4_ == undefined)
         {
            _loc2_.addItem(this.api.lang.getText("ADD_TO_PARTY"),this.api.network.Party,this.api.network.Party.invite,[_loc10_]);
         }
         if(this.api.datacenter.Player.guildInfos != undefined)
         {
            if(_loc6_ != true)
            {
               if(_loc2_ == null || (_loc2_ != null && _loc2_.guildName == undefined || _loc2_.guildName.length == 0))
               {
                  if(this.api.datacenter.Player.guildInfos.playerRights.canInvite)
                  {
                     _loc2_.addItem(this.api.lang.getText("INVITE_IN_GUILD"),this.api.network.Guild,this.api.network.Guild.invite,[_loc10_]);
                  }
               }
            }
         }
         if(_loc8_)
         {
            if(this.api.datacenter.Player.isAuthorized)
            {
               _loc2_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.kernel.AdminManager,this.api.kernel.AdminManager.sendCommand,["join " + _loc10_]);
            }
            else if(this.api.datacenter.Map.superarea == 3)
            {
               _loc2_.addItem(this.api.lang.getText("JOIN_SMALL"),this.api.network.Friends,this.api.network.Friends.joinFriend,[_loc10_]);
            }
         }
      }
      if(!_loc13_ && (_loc2_ != null && (_loc2_.gfxID != "999" && !_loc5_)))
      {
         if(this.api.datacenter.Player.isAtHome(this.api.datacenter.Map.id))
         {
            _loc2_.addItem(this.api.lang.getText("KICKOFF"),this.api.network.Houses,this.api.network.Houses.kick,[_loc11_]);
         }
         if(this.api.datacenter.Player.canExchange && _loc2_.canExchange)
         {
            _loc2_.addItem(this.api.lang.getText("EXCHANGE"),this.api.kernel.GameManager,this.api.kernel.GameManager.startExchange,[1,_loc11_]);
         }
         if(this.api.datacenter.Player.canChallenge && _loc2_.canBeChallenge)
         {
            _loc2_.addItem(this.api.lang.getText("CHALLENGE"),this.api.network.GameActions,this.api.network.GameActions.challenge,[_loc11_],this.api.datacenter.Map.bCanChallenge);
         }
         if(this.api.datacenter.Player.canAssault && !_loc2_.showIsPlayer)
         {
            var _loc19_ = this.api.datacenter.Player.data.alignment.index;
            if(this.api.lang.getAlignmentCanAttack(_loc19_,_loc2_.alignment.index))
            {
               _loc2_.addItem(this.api.lang.getText("ASSAULT"),this.api.kernel.GameManager,this.api.kernel.GameManager.askAttack,[[_loc11_]],this.api.datacenter.Map.bCanAttack);
            }
         }
         if(this.api.datacenter.Player.canAttack && (_loc2_.canBeAttack && !_loc2_.showIsPlayer))
         {
            _loc2_.addItem(this.api.lang.getText("ATTACK"),this.api.network.GameActions,this.api.network.GameActions.mutantAttack,[_loc2_.id]);
         }
         var _loc7_ = _loc2_.multiCraftSkillsID;
         if(_loc7_ != undefined && _loc7_.length > 0)
         {
            var _loc4_ = 0;
            while(_loc4_ < _loc7_.length)
            {
               var _loc8_ = Number(_loc7_[_loc4_]);
               _loc2_.addItem(this.api.lang.getText("ASK_TO") + " " + this.api.lang.getSkillText(_loc8_).d,this.api.network.Exchange,this.api.network.Exchange.request,[13,_loc2_.id,_loc8_]);
               _loc4_ += 1;
            }
         }
         else
         {
            _loc7_ = this.api.datacenter.Player.data.multiCraftSkillsID;
            if(_loc7_ != undefined && _loc7_.length > 0)
            {
               var _loc3_ = 0;
               while(_loc3_ < _loc7_.length)
               {
                  var _loc9_ = Number(_loc7_[_loc3_]);
                  _loc2_.addItem(this.api.lang.getText("INVITE_TO") + " " + this.api.lang.getSkillText(_loc9_).d,this.api.network.Exchange,this.api.network.Exchange.request,[12,_loc2_.id,_loc9_]);
                  _loc3_ += 1;
               }
            }
         }
      }
   }
   if(_loc4_ != undefined)
   {
      _loc4_.addPartyMenuItems(_loc2_);
   }
   return _loc2_;
};
_loc1.useRessource = function(_loc2_, _loc3_, _loc4_)
{
   if(this.api.gfx.onCellRelease(_loc2_))
   {
      this.api.network.GameActions.sendActions(500,[_loc3_,_loc4_]);
   }
};
_loc1.cleanPlayer = function(_loc2_)
{
   if(_loc2_ != this.api.datacenter.Game.currentPlayerID)
   {
      var _loc2_ = this.api.datacenter.Sprites.getItemAt(_loc2_);
      _loc2_.EffectsManager.nextTurn();
      _loc2_.CharacteristicsManager.nextTurn();
      _loc2_.GameActionsManager.clear();
   }
};
_loc1.forceCleanPlayer = function(_loc2_)
{
   var _loc2_ = this.api.datacenter.Sprites.getItemAt(_loc2_);
   _loc2_.EffectsManager.nextTurn();
   _loc2_.CharacteristicsManager.nextTurn();
   _loc2_.GameActionsManager.clear();
};
_loc1.terminateFight = function()
{
   this.api.kernel.debug("HERE TERMINATE FIGHT");
   if(!this.api.datacenter.Basics.isLogged)
   {
      return undefined;
   }
   this.api.sounds.events.onGameEnd();
   this.api.sounds.playMusic(this.api.datacenter.Map.musicID);
   this.api.kernel.showMessage(undefined,ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("GAME_END"),"m",this.api.datacenter.Basics.exp_lastGained > 0 || this.api.datacenter.Basics.kamas_lastGained > 0),"INFO_CHAT");
   if(!this.api.datacenter.Game.isSpectator)
   {
      this.printFightResultInfo(8,this.api.datacenter.Basics.exp_lastGained);
      this.printFightResultInfo(45,this.api.datacenter.Basics.kamas_lastGained);
      this.printFightResultInfo(209,this.api.datacenter.Basics.guildExp_lastGained);
      this.printFightResultInfo(210,this.api.datacenter.Basics.mountExp_lastGained);
   }
   if(!this.api.datacenter.Player.isSkippingLootPanel)
   {
      if(this.api.kernel.OptionsManager.getOption("UseLightEndFightUI") && this.api.datacenter.Game.results.currentPlayerInfos.length != 0)
      {
         this.api.ui.loadUIComponent("GameResultLight","GameResultLight",{data:this.api.datacenter.Game.results},{bAlwaysOnTop:true});
      }
      else
      {
         this.api.ui.loadUIComponent("GameResult","GameResult",{data:this.api.datacenter.Game.results},{bAlwaysOnTop:true});
      }
   }
   this.api.gfx.cleanMap();
   this.api.network.Game.onLeave();
};
_loc1.printFightResultInfo = function(_loc2_, nResultValue)
{
   if(nResultValue > 0)
   {
      this.api.kernel.showMessage(undefined," - " + this.api.lang.getText("INFOS_" + _loc2_,[new ank["\x1e\n\x07"]["\x0e\x1c"](nResultValue).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3)]),"INFO_CHAT");
   }
};
_loc1.Comandos = function()
{
   var _loc3_ = this.api.ui.createPopupMenu();
   _loc3_.addStaticItem("Les commandes");
   _loc3_.addItem("Activer/Désactiver Window ",this.api.network.Chat,this.api.network.Chat.send,[".window","*"]);
   _loc3_.addItem("Activer/Désactiver Modulaire ",this.api.network.Chat,this.api.network.Chat.send,[".djmodu","*"]);
   _loc3_.addItem("Activer/Désactiver Maître",this.api.network.Chat,this.api.network.Chat.send,[".maitre","*"]);
   _loc3_.addItem("Activer/Désactiver IpDrop",this.api.network.Chat,this.api.network.Chat.send,[".ipdrop","*"]);
   _loc3_.addItem("Activer/Désactiver Contrôle invocation",this.api.network.Chat,this.api.network.Chat.send,[".cinvoc","*"]);
   _loc3_.show(_root._xmouse,_root._ymouse);
};
