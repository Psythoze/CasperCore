var _loc1 = dofus["\x0b\b"].KeyManager.prototype;
_loc1.initialize = function(oAPI)
{
   super.initialize(oAPI);
   Key.addListener(this);
   this._aAnyTimeShortcuts = new Array();
   this._aNoChatShortcuts = new Array();
   this._so = SharedObject.getLocal(this.api.datacenter.Player.login + "_" + dofus.Constants.GLOBAL_SO_SHORTCUTS_NAME);
   this._nCurrentSet = this.api.kernel.OptionsManager.getOption("ShortcutSet");
   this.addToQueue({object:this,method:this.loadShortcuts});
};
_loc1.loadShortcuts = function()
{
   if(this._nCurrentSet == undefined)
   {
      this._nCurrentSet = this.api.kernel.OptionsManager.getOption("ShortcutSet");
   }
   var _loc4_ = this.api.lang.getKeyboardShortcuts();
   this._aNoChatShortcuts = new Array();
   this._aAnyTimeShortcuts = new Array();
   this._oKeys = new Object();
   for(var _loc15_ in _loc4_)
   {
      var _loc3_ = this.api.lang.getKeyboardShortcutsKeys(this._nCurrentSet,_loc15_);
      var _loc6_ = this.getCustomShortcut(_loc15_,false);
      if(_loc6_ != undefined && !_loc4_[_loc15_].s)
      {
         if(_loc3_.o)
         {
            this._aNoChatShortcuts.push({k:_loc6_.k,c:_loc6_.c,o:_loc3_.o,d:_loc15_,l:_loc6_.i,s:_loc4_[_loc15_].s});
         }
         else
         {
            this._oKeys[_loc6_.k] = true;
            this._aAnyTimeShortcuts.push({k:_loc6_.k,c:_loc6_.c,o:_loc3_.o,d:_loc15_,l:_loc6_.i,s:_loc4_[_loc15_].s});
         }
      }
      else if(_loc3_.o)
      {
         this._aNoChatShortcuts.push({k:_loc3_.k,c:_loc3_.c,o:_loc3_.o,d:_loc15_,l:_loc3_.s,s:_loc4_[_loc15_].s});
      }
      else if(_loc3_.k != undefined)
      {
         this._oKeys[_loc3_.k] = true;
         this._aAnyTimeShortcuts.push({k:_loc3_.k,c:_loc3_.c,o:_loc3_.o,d:_loc15_,l:_loc3_.s,s:_loc4_[_loc15_].s});
      }
      var _loc5_ = this.getCustomShortcut(_loc15_,true);
      if(_loc5_ != undefined && !_loc4_[_loc15_].s)
      {
         if(_loc3_.o)
         {
            this._aNoChatShortcuts.push({k:_loc5_.k,c:_loc5_.c,o:_loc3_.o,d:_loc15_,l:_loc5_.i,s:_loc4_[_loc15_].s});
         }
         else
         {
            this._oKeys[_loc5_.k] = true;
            this._aAnyTimeShortcuts.push({k:_loc5_.k,c:_loc5_.c,o:_loc3_.o,d:_loc15_,l:_loc5_.i,s:_loc4_[_loc15_].s});
         }
      }
      else if(!_global.isNaN(_loc3_.k2) && _loc3_.k2 != undefined)
      {
         if(_loc3_.o)
         {
            this._aNoChatShortcuts.push({k:_loc3_.k2,c:_loc3_.c2,o:_loc3_.o,d:_loc15_,l:_loc3_.s2,s:_loc4_[_loc15_].s});
            continue;
         }
         this._oKeys[_loc3_.k2] = true;
         this._aAnyTimeShortcuts.push({k:_loc3_.k2,c:_loc3_.c2,o:_loc3_.o,d:_loc15_,l:_loc3_.s2,s:_loc4_[_loc15_].s});
      }
   }
   if(!this._oKeys[38])
   {
      this._oKeys[38] = true;
      this._aAnyTimeShortcuts.push({k:38,c:0,o:true,d:"HISTORY_UP"});
   }
   if(!this._oKeys[40])
   {
      this._oKeys[40] = true;
      this._aAnyTimeShortcuts.push({k:40,c:0,o:true,d:"HISTORY_DOWN"});
   }
   if(!this._oKeys[13])
   {
      this._aAnyTimeShortcuts.push({k:13,c:1,o:true,d:"GUILD_MESSAGE"});
   }
   if(!this._oKeys[13])
   {
      this._oKeys[13] = true;
      this._aAnyTimeShortcuts.push({k:13,c:0,o:true,d:"ACCEPT_CURRENT_DIALOG"});
   }
   if(!this._oKeys[70])
   {
      this._oKeys[70] = true;
      this._aAnyTimeShortcuts.push({k:70,c:1,o:true,d:"FULLSCREEN"});
   }
   var _loc8_ = this.api.lang.getDefaultConsoleShortcuts();
   var _loc7_ = -1;
   while(true)
   {
      _loc7_ = _loc7_ + 1;
      if(_loc7_ >= _loc8_.length)
      {
         break;
      }
      if(!this._oKeys[_loc8_[_loc7_].k])
      {
         this._oKeys[_loc8_[_loc7_].k] = true;
         this._aAnyTimeShortcuts.push({k:_loc8_[_loc7_].k,c:_loc8_[_loc7_].c,o:true,d:"CONSOLE"});
      }
   }
};
_loc1.setCustomShortcut = function(sShortcut, bIsAlternative, nKeyCode, nCtrlCode, sAscii)
{
   if(sShortcut == undefined || bIsAlternative == undefined)
   {
      return undefined;
   }
   var _loc4_ = sShortcut + (!!bIsAlternative ? "_ALT" : "_MAIN");
   if(nKeyCode == undefined)
   {
      this._so.data[_loc4_] = undefined;
   }
   else
   {
      if(nCtrlCode == undefined)
      {
         nCtrlCode = 0;
      }
      if(sAscii == undefined || sAscii == "")
      {
         sAscii = this.api.lang.getKeyStringFromKeyCode(nKeyCode);
         sAscii = this.api.lang.getControlKeyString(nCtrlCode) + sAscii;
      }
      this._so.data[_loc4_] = {s:sShortcut,a:bIsAlternative,k:nKeyCode,c:nCtrlCode,i:sAscii};
   }
   this._so.flush();
   this.loadShortcuts();
};
_loc1.onShortcut = function(_loc2_)
{
   var _loc2_ = true;
   switch(_loc2_)
   {
      case "TOGGLE_FIGHT_INFOS":
         this.api.kernel.OptionsManager.setOption("ChatEffects",!this.api.kernel.OptionsManager.getOption("ChatEffects"));
         _loc2_ = false;
         break;
      case "ESCAPE":
         this.api.datacenter.Basics.gfx_canLaunch = false;
         if(!this.api.ui.removeCursor(true))
         {
            if(this.api.ui.callCloseOnLastUI() == false)
            {
               this.api.ui.loadUIComponent("AskMainMenu","AskMainMenu");
            }
         }
         break;
      case "TPSHORT":
         this.api.network.send("XD2");
         _loc2_ = false;
         break;
      case "CONSOLE":
         if(this.api.datacenter.Player.isAuthorized)
         {
            this.api.ui.loadUIComponent("Debug","Debug",undefined,{bAlwaysOnTop:true});
            _loc2_ = false;
         }
         break;
      case "CONSOLESIZE":
         if(this.api.datacenter.Player.isAuthorized)
         {
            var _loc3_ = this.api.ui.getUIComponent("Debug");
            if(_loc3_ != undefined)
            {
               _loc3_.changeSize();
            }
            _loc2_ = false;
         }
         break;
      case "GRID":
         this.api.kernel.OptionsManager.setOption("Grid");
         _loc2_ = false;
         break;
      case "SHOWMONSTERSTOOLTIP":
         this.api.gfx.spriteHandler.showMonstersTooltip(true);
         _loc2_ = false;
         break;
      case "SHOWTRIGGERS":
         if(this.api.datacenter.Game.isFight || getTimer() - this._nLastTriggerShow < dofus.Constants.CLICK_MIN_DELAY)
         {
            break;
         }
         if(!this.api.datacenter.Game.isFight)
         {
            if(getTimer() - this._nLastTriggerShow >= dofus.Constants.CLICK_MIN_DELAY)
            {
               this._nLastTriggerShow = getTimer();
               this.api.gfx.mapHandler.showTriggers();
               this.api.gfx.mapHandler.showFightCells();
            }
            _loc2_ = false;
         }
         break;
      case "STARTFIGHT":
         this.api.ui.getUIComponent("ChallengeMenu").sendReadyState();
         _loc2_ = false;
         break;
      case "HIDESPRITES":
         this.api.gfx.spriteHandler.hidePlayerSprites(true);
         _loc2_ = false;
         break;
      case "TRANSPARENCY":
         this.api.kernel.OptionsManager.setOption("Transparency",!this.api.gfx.bGhostView);
         _loc2_ = false;
         break;
      case "SPRITEINFOS":
         this.api.kernel.OptionsManager.setOption("SpriteInfos");
         _loc2_ = false;
         break;
      case "COORDS":
         this.api.kernel.OptionsManager.setOption("MapInfos");
         _loc2_ = false;
         break;
      case "STRINGCOURSE":
         this.api.kernel.OptionsManager.setOption("StringCourse");
         _loc2_ = false;
         break;
      case "BUFF":
         this.api.kernel.OptionsManager.setOption("Buff");
         _loc2_ = false;
         break;
      case "MOVABLEBAR":
         this.api.kernel.OptionsManager.setOption("MovableBar",!this.api.kernel.OptionsManager.getOption("MovableBar"));
         _loc2_ = false;
         break;
      case "MOUNTING":
         this.api.network.Mount.ride();
         _loc2_ = false;
         break;
      case "FULLSCREEN":
         _loc0_ = _loc0_ = !this.api.kernel.GameManager.isFullScreen;
         this.api.kernel.GameManager.isFullScreen = _loc0_;
         getURL("FSCommand:fullscreen",_loc0_);
         _loc2_ = false;
         break;
      case "ALLOWSCALE":
         _loc0_ = _loc0_ = !this.api.kernel.GameManager.isAllowingScale;
         this.api.kernel.GameManager.isAllowingScale = _loc0_;
         getURL("FSCommand:allowscale",_loc0_);
         _loc2_ = false;
   }
   return _loc2_;
};
