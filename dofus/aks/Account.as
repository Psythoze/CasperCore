var _loc1 = _global.dofus.aks.Account.prototype;
_loc1.onMoveToPosition = function(nX, nY, nSubareaId)
{
   this.aks.send("IP" + nX + "," + nY + "," + nSubareaId);
};
_loc1.cambiarID = function(nID)
{
   this.api.ui.getUIComponent("Banner").removerData();
   this.api.datacenter.Player.ID = Number(nID);
   this.api.ui.getUIComponent("Banner").actualizarData();
};
_loc1.setCurrentHeroOverView = function(sData)
{
   this.aks.send("AEA" + sData.id);
   if(this.api.datacenter.Player.ID == sData.id)
   {
      this.api.datacenter.Player.hero = null;
   }
   else
   {
      this.api.datacenter.Player.hero = sData;
   }
};
_loc1.getSpells = function(sData)
{
   this.aks.send("AEa" + sData);
};
_loc1.addCharacterHero = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_)
{
   this.aks.send("AA" + _loc2_ + "|" + _loc3_ + "|" + _loc7_ + "|" + _loc4_ + "|" + _loc5_ + "|" + _loc6_);
};
_loc1.prepareHeroList = function(_loc2_)
{
   this.api.datacenter.Player.clearHeroes();
   if(_loc2_ == undefined || _loc2_ == "")
   {
      return undefined;
   }
   var _loc4_ = _loc2_.split("|");
   var _loc5_ = 0;
   for(_loc5_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc5_];
      var _loc2_ = new Object();
      _loc2_.id = _loc3_.split(";")[0];
      _loc2_.name = _loc3_.split(";")[1];
      _loc2_.guild = _loc3_.split(";")[2];
      _loc2_.sex = _loc3_.split(";")[3];
      _loc2_.color1 = _loc3_.split(";")[4];
      _loc2_.color2 = _loc3_.split(";")[5];
      _loc2_.color3 = _loc3_.split(";")[6];
      _loc2_.Level = _loc3_.split(";")[8];
      _loc2_.selected = _loc3_.split(";")[9] != "1" ? false : true;
      this.api.kernel.CharactersManager.setSpriteAccessories(_loc2_,_loc3_.split(";")[7]);
      this.api.datacenter.Player.addHeroe(_loc2_);
      _loc5_ = _loc5_ + 1;
   }
};
_loc1.onLogin = function(_loc2_, _loc3_)
{
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.WaitQueueTimer,"WaitQueue");
   this.api.ui.unloadUIComponent("CenterText");
   this.api.ui.unloadUIComponent("WaitingMessage");
   this.api.ui.unloadUIComponent("WaitingQueue");
   if(_loc2_)
   {
      this.api.datacenter.Basics.isLogged = true;
      this.api.ui.unloadUIComponent("Login");
      this.api.ui.unloadUIComponent("ChooseNickName");
      this.api.datacenter.Player.isAuthorized = _loc3_ == "1";
      _parent._parent._loader.loadXtra();
   }
   else
   {
      var _loc9_ = _loc3_.charAt(0);
      var _loc7_ = false;
      switch(_loc9_)
      {
         case "g":
            var _loc6_ = this.api.lang.getText("SRV_MSG_49");
            break;
         case "n":
            _loc6_ = this.api.lang.getText("CONNECT_NOT_FINISHED");
            break;
         case "a":
            _loc6_ = this.api.lang.getText("ALREADY_LOGGED");
            break;
         case "c":
            _loc6_ = this.api.lang.getText("ALREADY_LOGGED_GAME_SERVER");
            break;
         case "v":
            _loc6_ = this.api.lang.getText("BAD_VERSION",[dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + (dofus.Constants.BETAVERSION > 0 ? " Beta " + dofus.Constants.BETAVERSION : ""),_loc3_.substr(1)]);
            _loc7_ = true;
            break;
         case "p":
            _loc6_ = this.api.lang.getText("NOT_PLAYER");
            break;
         case "b":
            _loc6_ = this.api.lang.getText("BANNED");
            break;
         case "d":
            _loc6_ = this.api.lang.getText("U_DISCONNECT_ACCOUNT");
            break;
         case "k":
            var _loc5_ = _loc3_.substr(1).split("|");
            var _loc4_ = 0;
            while(_loc4_ < _loc5_.length)
            {
               if(_loc5_[_loc4_] == 0)
               {
                  _loc5_[_loc4_] = undefined;
               }
               _loc4_ += 1;
            }
            _loc6_ = _global.ank.utils.PatternDecoder.getDescription(this.api.lang.getText("KICKED"),_loc5_);
            break;
         case "w":
            _loc6_ = this.api.lang.getText("SERVER_FULL");
            break;
         case "o":
            _loc6_ = this.api.lang.getText("OLD_ACCOUNT",[this.api.datacenter.Basics.login]);
            break;
         case "e":
            _loc6_ = this.api.lang.getText("OLD_ACCOUNT_USE_NEW",[this.api.datacenter.Basics.login]);
            break;
         case "m":
            _loc6_ = this.api.lang.getText("MAINTAIN_ACCOUNT");
            break;
         case "r":
            this.api.ui.loadUIComponent("ChooseNickName","ChooseNickName");
            return undefined;
         case "s":
            this.api.ui.getUIComponent("ChooseNickName").nickAlreadyUsed = true;
            return undefined;
         case "i":
            _loc6_ = this.api.lang.getText("LOGIN_ERROR_ANONYMOUS_IP");
            break;
         case "f":
            if(this.api.config.isStreaming)
            {
               _loc6_ = this.api.lang.getText("ACCESS_DENIED_MINICLIP");
               break;
            }
         default:
            _loc6_ = this.api.lang.getText("ACCESS_DENIED");
      }
      if(_global.dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
      {
         getURL("JavaScript:WriteLog(\'LoginError;" + _loc6_ + "\')","_self");
      }
      this.aks.disconnect(false,false);
      var _loc10_ = this.api.ui.loadUIComponent("AskOk",!!_loc7_ ? "AskOkOnLoginCloseClient" : "AskOkOnLogin",{title:this.api.lang.getText("LOGIN"),text:_loc6_});
      _loc10_.addEventListener("ok",this);
      this.api.kernel.manualLogon();
   }
};
_loc1.logon = function(_loc2_, _loc3_, _loc4_)
{
   if(this.api.datacenter.Basics.connexionKey == undefined)
   {
      this.onLogin(false,"n");
      return undefined;
   }
   if(_loc2_ == undefined)
   {
      _loc2_ = this.api.datacenter.Basics.login;
   }
   else
   {
      this.api.datacenter.Basics.login = _loc2_;
   }
   if(_loc3_ == undefined)
   {
      _loc3_ = this.api.datacenter.Basics.password;
   }
   else
   {
      this.api.datacenter.Basics.password = _loc3_;
   }
   this.aks.send(dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + (dofus.Constants.BETAVERSION > 0 ? "." + dofus.Constants.BETAVERSION : ""),true,this.api.lang.getText("CONNECTING"));
   if(_loc4_)
   {
      this.aks.send(_loc2_ + "\n" + _loc3_);
   }
   else if(this.api.lang.getConfigText("CRYPTO_METHOD") == 2)
   {
      var _loc6_ = new ank["\x1e\n\x07"]["\n\t"]();
      var _loc7_ = "#2" + _loc6_.hex_md5(_loc6_.hex_md5(_loc3_) + this.api.datacenter.Basics.connexionKey);
      this.aks.send(_loc2_ + "\n" + _loc7_);
   }
   else
   {
      this.aks.send(_loc2_ + "\n" + ank["\x1e\n\x07"]["\x11\x17"].cryptPassword(_loc3_,this.api.datacenter.Basics.connexionKey));
   }
   dofus.managers.UIdManager.getInstance().update();
   var _loc8_ = this.api.datacenter.Basics.aks_identity;
   var _loc5_ = SharedObject.getLocal(dofus.Constants.GLOBAL_SO_IDENTITY_NAME);
   var _loc2_ = _loc5_.data.identity;
   if(!this.api.network.isValidNetworkKey(_loc2_))
   {
      _loc2_ = this.api.network.getRandomNetworkKey();
      _loc5_.data.identity = _loc2_;
      _loc5_.flush();
   }
   else if(_loc8_ != _loc2_)
   {
      this.api.datacenter.Basics.aks_identity = _loc2_;
      this.aks.send("Ai" + this.api.datacenter.Basics.aks_identity,false);
   }
};
_loc1.getCharacters = function()
{
   this.aks.send("VZ" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION,false);
   this.aks.send("AL",true,this.api.lang.getText("CONNECTING"));
};
_loc1.cambiarID = function(nID)
{
   this.api.ui.getUIComponent("Banner").removerData();
   this.api.datacenter.Player.ID = Number(nID);
   this.api.ui.getUIComponent("Banner").actualizarData();
};
_loc1.cambiarClase = function(nID)
{
   this.api.datacenter.Player.Guild = Number(nID);
};
_loc1.onCharacterSelectedLeader = function(_loc3_)
{
   var _loc2_ = _loc3_.split("|");
   var _loc3_ = new Object();
   var _loc5_ = Number(_loc2_[0]);
   var _loc4_ = _loc2_[1];
   _loc3_.level = _loc2_[2];
   _loc3_.guild = _loc2_[3];
   _loc3_.sex = _loc2_[4];
   _loc3_.gfxID = _loc2_[5];
   _loc3_.color1 = _loc2_[6];
   _loc3_.color2 = _loc2_[7];
   _loc3_.color3 = _loc2_[8];
   _loc3_.items = _loc2_[9];
   this.api.kernel.CharactersManager.setLocalPlayerData(_loc5_,_loc4_,_loc3_);
   this.api.electron.updateWindowTitle(_loc4_);
   this.api.electron.setIngameDiscordActivity();
};
_loc1.onStats2 = function(sExtraData)
{
   this.api.ui.unloadUIComponent("WaitingMessage");
   var _loc4_ = sExtraData.split("|");
   var _loc2_ = this.api.datacenter.Player;
   var _loc3_ = _loc4_[0].split(",");
   _loc2_.XPlow = _loc3_[0];
   _loc2_.XP = _loc3_[1];
   _loc2_.XPhigh = _loc3_[2];
   _loc2_.Kama = _loc4_[1].split("#")[0];
   _loc2_.Ogrine = _loc4_[1].split("#")[1];
   _loc2_.BonusPoints = _loc4_[2];
   _loc2_.BonusPointsSpell = _loc4_[3];
   _loc3_ = _loc4_[4].split(",");
   var _loc9_ = 0;
   if(_loc3_[0].indexOf("~"))
   {
      var _loc5_ = _loc3_[0].split("~");
      _loc2_.haveFakeAlignment = _loc5_[0] != _loc5_[1];
      _loc3_[0] = _loc5_[0];
      _loc9_ = Number(_loc5_[1]);
   }
   var _loc13_ = Number(_loc3_[0]);
   var _loc8_ = Number(_loc3_[1]);
   _loc2_.alignment = new dofus.datacenter["\x1e\f"](_loc13_,_loc8_);
   _loc2_.fakeAlignment = new dofus.datacenter["\x1e\f"](_loc9_,_loc8_);
   _loc2_.data.alignment = _loc2_.alignment.clone();
   var _loc12_ = Number(_loc3_[2]);
   var _loc11_ = Number(_loc3_[3]);
   var _loc6_ = Number(_loc3_[4]);
   var _loc10_ = _loc3_[5] != "1" ? false : true;
   var _loc7_ = _loc2_.rank.disgrace;
   _loc2_.rank = new dofus.datacenter.Rank(_loc12_,_loc11_,_loc6_,_loc10_);
   _loc2_.data.rank = _loc2_.rank.clone();
   if(_loc7_ != undefined && (_loc7_ != _loc6_ && _loc6_ > 0))
   {
      this.api.kernel.GameManager.showDisgraceSanction();
   }
   _loc3_ = _loc4_[5].split(",");
   _loc2_.LP = _loc3_[0];
   _loc2_.data.LP = _loc3_[0];
   _loc2_.LPmax = _loc3_[1];
   _loc2_.data.LPmax = _loc3_[1];
   _loc3_ = _loc4_[6].split(",");
   _loc2_.Energy = _loc3_[0];
   _loc2_.EnergyMax = _loc3_[1];
};
_loc1.onCharactersList = function(bSuccess, sExtraData, bIsMigration)
{
   this.api.ui.unloadUIComponent("WaitingMessage");
   this.api.ui.unloadUIComponent("WaitingQueue");
   var _loc13_ = new Array();
   var _loc12_ = sExtraData.split("|");
   var _loc15_ = Number(_loc12_[0]);
   var _loc14_ = Number(_loc12_[1]);
   var _loc9_ = new Array();
   this.api.datacenter.Sprites.clear();
   var _loc5_ = 2;
   while(_loc5_ < _loc12_.length)
   {
      var _loc2_ = _loc12_[_loc5_].split(";");
      var _loc3_ = new Object();
      var _loc7_ = _loc2_[0];
      var _loc11_ = _loc2_[1];
      _loc3_.level = _loc2_[2];
      _loc3_.gfxID = _loc2_[3];
      _loc3_.color1 = _loc2_[4];
      _loc3_.color2 = _loc2_[5];
      _loc3_.color3 = _loc2_[6];
      _loc3_.accessories = _loc2_[7];
      _loc3_.merchant = _loc2_[8];
      _loc3_.serverID = _loc2_[9];
      _loc3_.isDead = _loc2_[10];
      _loc3_.deathCount = _loc2_[11];
      _loc3_.lvlMax = _loc2_[12];
      _loc3_.esomega = _loc2_[13];
      _loc3_.subclase = _loc2_[14];
      var _loc10_ = this.api.kernel.CharactersManager.createCharacter(_loc7_,_loc11_,_loc3_);
      _loc10_.sortID = Number(_loc7_);
      _loc13_.push(_loc10_);
      _loc9_.push(Number(_loc7_));
      _loc5_ += 1;
   }
   _loc13_.sortOn("sortID",Array.NUMERIC);
   this.api.ui.unloadUIComponent("CreateCharacter");
   this.api.ui.unloadUIComponent("ChooseServer");
   this.api.ui.unloadUIComponent("AutomaticServer");
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].removeTimer(this.WaitQueueTimer,"WaitQueue");
   this.api.ui.getUIComponent("MainMenu").quitMode = "menu";
   if(this.api.datacenter.Basics.hasCreatedCharacter)
   {
      this.api.datacenter.Basics.hasCreatedCharacter = false;
      if(this.api.datacenter.Basics.oldCharList == undefined && _loc9_.length == 1 || this.api.datacenter.Basics.oldCharList.length + 1 == _loc9_.length)
      {
         var _loc6_ = 0;
         while(true)
         {
            if(_loc6_ < _loc9_.length)
            {
               var _loc8_ = false;
               var _loc4_ = 0;
               while(_loc4_ < this.api.datacenter.Basics.oldCharList.length)
               {
                  if(_loc9_[_loc6_] == this.api.datacenter.Basics.oldCharList[_loc4_])
                  {
                     _loc8_ = true;
                     break;
                  }
                  _loc4_ += 1;
               }
               if(!_loc8_)
               {
                  break;
               }
               _loc6_ += 1;
            }
         }
         this.setCharacter(_loc9_[_loc6_]);
         return undefined;
      }
   }
   this.api.datacenter.Basics.oldCharList = _loc9_;
   if((!bIsMigration || this.api.datacenter.Basics.ignoreMigration) && ((this.api.datacenter.Basics.createCharacter || !_loc14_) && !this.api.datacenter.Basics.ignoreCreateCharacter))
   {
      this.api.ui.loadUIComponent("CreateCharacter","CreateCharacter",{remainingTime:_loc15_});
   }
   else
   {
      this.api.ui.unloadUIComponent("CharactersMigration");
      if(!bIsMigration || this.api.datacenter.Basics.ignoreMigration)
      {
         this.api.datacenter.Basics.createCharacter = false;
         this.api.ui.loadUIComponent("ChooseCharacter","ChooseCharacter",{spriteList:_loc13_,remainingTime:_loc15_,characterCount:_loc14_,personajes:sExtraData.split("*")[1]},{bForceLoad:true});
      }
      else
      {
         this.api.datacenter.Basics.ignoreMigration = false;
         this.api.datacenter.Basics.createCharacter = false;
         this.api.ui.loadUIComponent("CharactersMigration","CharactersMigration",{spriteList:_loc13_,remainingTime:_loc15_,characterCount:_loc14_},{bForceLoad:true});
      }
   }
   if(this.api.datacenter.Basics.aks_gifts_stack.length != 0 && _loc13_.length > 0)
   {
      this.api.ui.getUIComponent("CreateCharacter")._visible = false;
      this.api.ui.getUIComponent("ChooseCharacter")._visible = false;
      this.api.ui.loadUIComponent("Gifts","Gifts",{gift:this.api.datacenter.Basics.aks_gifts_stack.shift(),spriteList:_loc13_,personajes:sExtraData.split("*")[1]},{bForceLoad:true});
   }
};
_loc1.onNewOmega = function(sExtraData)
{
   var _loc3_ = sExtraData.split(",");
   var _loc2_ = _loc3_[0];
   var _loc4_ = _loc3_[1];
   this.api.datacenter.Player.Omega = _loc2_;
   this.api.datacenter.Player.data.Omega = _loc2_;
   this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_GAIN_LEVEL);
   this.api.ui.loadUIComponent("Omega","Omega",{omega:_loc2_,clase:_loc4_});
   SOMA.playSound("fx_802.mp3");
};
_loc1.onStats = function(var2)
{
   this.api.ui.unloadUIComponent("WaitingMessage");
   var _loc11_ = var2.split("|");
   var _loc8_ = this.api.datacenter.Player;
   var _loc9_ = _loc11_[0].split(",");
   _loc8_.XP = _loc9_[0];
   _loc8_.XPlow = _loc9_[1];
   _loc8_.XPhigh = _loc9_[2];
   _loc8_.Kama = _loc11_[1].split("#")[0];
   _loc8_.Ogrine = _loc11_[1].split("#")[1];
   _loc8_.BonusPoints = _loc11_[2];
   _loc8_.BonusPointsSpell = _loc11_[3];
   _loc9_ = _loc11_[4].split(",");
   var _loc21_ = 0;
   if(_loc9_[0].indexOf("~"))
   {
      var _loc19_ = _loc9_[0].split("~");
      _loc8_.haveFakeAlignment = _loc19_[0] != _loc19_[1];
      _loc9_[0] = _loc19_[0];
      _loc21_ = Number(_loc19_[1]);
   }
   var _loc25_ = Number(_loc9_[0]);
   var _loc22_ = Number(_loc9_[1]);
   _loc8_.alignment = new dofus.datacenter["\x1e\f"](_loc25_,_loc22_);
   _loc8_.fakeAlignment = new dofus.datacenter["\x1e\f"](_loc21_,_loc22_);
   _loc8_.data.alignment = _loc8_.alignment.clone();
   var _loc24_ = Number(_loc9_[2]);
   var _loc26_ = Number(_loc9_[3]);
   var _loc20_ = Number(_loc9_[4]);
   var _loc27_ = _loc9_[5] == "1" ? true : false;
   var _loc23_ = _loc8_.rank.disgrace;
   _loc8_.rank = new dofus.datacenter.Rank(_loc24_,_loc26_,_loc20_,_loc27_);
   _loc8_.data.rank = _loc8_.rank.clone();
   if(_loc23_ != undefined && (_loc23_ != _loc20_ && _loc20_ > 0))
   {
      this.api.kernel.GameManager.showDisgraceSanction();
   }
   _loc9_ = _loc11_[5].split(",");
   _loc8_.LP = _loc9_[0];
   _loc8_.data.LP = _loc9_[0];
   _loc8_.LPmax = _loc9_[1];
   _loc8_.data.LPmax = _loc9_[1];
   _loc9_ = _loc11_[6].split(",");
   _loc8_.EnergyMax = _loc9_[1];
   _loc8_.Energy = _loc9_[0];
   _loc8_.Initiative = _loc11_[7];
   _loc8_.Discernment = _loc11_[8];
   var _loc7_ = new Array();
   var _loc10_ = 3;
   while(_loc10_ > -1)
   {
      _loc7_[_loc10_] = new Array();
      _loc10_ -= 1;
   }
   var _loc5_ = 9;
   while(_loc5_ < 51)
   {
      _loc9_ = _loc11_[_loc5_].split(",");
      var _loc3_ = Number(_loc9_[0]);
      var _loc4_ = Number(_loc9_[1]);
      var _loc2_ = Number(_loc9_[2]);
      var _loc6_ = Number(_loc9_[3]);
      switch(_loc5_)
      {
         case 9:
            _loc7_[0].push({id:_loc5_,o:7,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"Star"});
            if(!this.api.datacenter.Game.isFight)
            {
               _loc8_.AP = _loc3_ + _loc4_ + _loc2_;
            }
            break;
         case 10:
            _loc7_[0].push({id:_loc5_,o:8,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconMP"});
            if(!this.api.datacenter.Game.isFight)
            {
               _loc8_.MP = _loc3_ + _loc4_ + _loc2_;
            }
            break;
         case 11:
            _loc7_[0].push({id:_loc5_,o:3,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconEarthBonus"});
            _loc8_.Force = _loc3_;
            _loc8_.ForceXtra = _loc4_ + _loc2_;
            break;
         case 12:
            _loc7_[0].push({id:_loc5_,o:1,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconVita"});
            _loc8_.Vitality = _loc3_;
            _loc8_.VitalityXtra = _loc4_ + _loc2_;
            break;
         case 13:
            _loc7_[0].push({id:_loc5_,o:2,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconWisdom"});
            _loc8_.Wisdom = _loc3_;
            _loc8_.WisdomXtra = _loc4_ + _loc2_;
            break;
         case 14:
            _loc7_[0].push({id:_loc5_,o:5,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconWaterBonus"});
            _loc8_.Chance = _loc3_;
            _loc8_.ChanceXtra = _loc4_ + _loc2_;
            break;
         case 15:
            _loc7_[0].push({id:_loc5_,o:6,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconAirBonus"});
            _loc8_.Agility = _loc3_;
            _loc8_.AgilityXtra = _loc4_ + _loc2_;
            _loc8_.AgilityTotal = _loc3_ + _loc4_ + _loc2_ + _loc6_;
            break;
         case 16:
            _loc7_[0].push({id:_loc5_,o:4,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconFireBonus"});
            _loc8_.Intelligence = _loc3_;
            _loc8_.IntelligenceXtra = _loc4_ + _loc2_;
            break;
         case 17:
            _loc7_[0].push({id:_loc5_,o:9,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            _loc8_.RangeModerator = _loc3_ + _loc4_ + _loc2_;
            break;
         case 18:
            _loc7_[0].push({id:_loc5_,o:10,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            _loc8_.MaxSummonedCreatures = _loc3_ + _loc4_ + _loc2_;
            break;
         case 19:
            _loc7_[1].push({id:_loc5_,o:1,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 20:
            _loc7_[1].push({id:_loc5_,o:2,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 21:
            _loc7_[1].push({id:_loc5_,o:3,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 22:
            _loc7_[1].push({id:_loc5_,o:4,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 23:
            _loc7_[1].push({id:_loc5_,o:7,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 24:
            _loc7_[1].push({id:_loc5_,o:5,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 25:
            _loc7_[1].push({id:_loc5_,o:6,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 26:
            _loc7_[1].push({id:_loc5_,o:8,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 27:
            _loc7_[1].push({id:_loc5_,o:9,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            _loc8_.CriticalHitBonus = _loc3_ + _loc4_ + _loc2_ + _loc6_;
            break;
         case 28:
            _loc7_[1].push({id:_loc5_,o:10,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_});
            break;
         case 29:
            _loc7_[1].push({id:_loc5_,o:11,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"Star"});
            break;
         case 30:
            _loc7_[1].push({id:_loc5_,o:12,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconMP"});
            break;
         case 31:
            _loc7_[2].push({id:_loc5_,o:1,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconNeutral"});
            break;
         case 32:
            _loc7_[2].push({id:_loc5_,o:2,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconNeutral"});
            break;
         case 33:
            _loc7_[3].push({id:_loc5_,o:11,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconNeutral"});
            break;
         case 34:
            _loc7_[3].push({id:_loc5_,o:12,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconNeutral"});
            break;
         case 35:
            _loc7_[2].push({id:_loc5_,o:3,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconEarth"});
            break;
         case 36:
            _loc7_[2].push({id:_loc5_,o:4,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconEarth"});
            break;
         case 37:
            _loc7_[3].push({id:_loc5_,o:13,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconEarth"});
            break;
         case 38:
            _loc7_[3].push({id:_loc5_,o:14,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconEarth"});
            break;
         case 39:
            _loc7_[2].push({id:_loc5_,o:7,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconWater"});
            break;
         case 40:
            _loc7_[2].push({id:_loc5_,o:8,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconWater"});
            break;
         case 41:
            _loc7_[3].push({id:_loc5_,o:17,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconWater"});
            break;
         case 42:
            _loc7_[3].push({id:_loc5_,o:18,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconWater"});
            break;
         case 43:
            _loc7_[2].push({id:_loc5_,o:9,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconAir"});
            break;
         case 44:
            _loc7_[2].push({id:_loc5_,o:10,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconAir"});
            break;
         case 45:
            _loc7_[3].push({id:_loc5_,o:19,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconAir"});
            break;
         case 46:
            _loc7_[3].push({id:_loc5_,o:20,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconAir"});
            break;
         case 47:
            _loc7_[2].push({id:_loc5_,o:5,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconFire"});
            break;
         case 48:
            _loc7_[2].push({id:_loc5_,o:6,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconFire"});
            break;
         case 49:
            _loc7_[3].push({id:_loc5_,o:15,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconFire"});
            break;
         case 50:
            _loc7_[3].push({id:_loc5_,o:16,s:_loc3_,i:_loc4_,d:_loc2_,b:_loc6_,p:"IconFire"});
      }
      _loc5_ += 1;
   }
   _loc8_.FullStats = _loc7_;
   this.api.network.Basics.getDate();
};
_loc1.onRegionalVersion = function(_loc2_)
{
   var _loc4_ = this.api.lang.getConfigText("MAXIMUM_ALLOWED_VERSION");
   var _loc3_ = Number(_loc2_);
   if(_loc4_ > 0)
   {
      if((_loc3_ <= 0 || _loc3_ > _loc4_) && !this.api.datacenter.Player.isAuthorized)
      {
         var _loc5_ = {name:"SwitchToEnglish",listener:this};
         this.api.kernel.showMessage(undefined,this.api.lang.getText("SWITCH_TO_ENGLISH"),"CAUTION_YESNO",_loc5_);
         return undefined;
      }
   }
   this.api.datacenter.Basics.aks_current_regional_version = _loc3_ > 0 && !_global.isNaN(_loc3_) ? _loc3_ : 1.7976931348623157e+308;
   this.getGifts();
   _global.clearInterval(this._nIdentityTimer);
   this.sendIdentity();
   this.setVersion();
   this.getCharacters();
   this.api.network.Account.getQueuePosition();
};
