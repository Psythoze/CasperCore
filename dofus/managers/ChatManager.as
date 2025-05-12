var _loc1 = dofus["\x0b\b"].ChatManager.prototype;
_loc1.addToBlacklist = function(sName, nClass)
{
   if(sName != this.api.datacenter.Player.Name && !this.isBlacklisted(sName))
   {
      this._aBlacklist.push({sName:sName,nClass:nClass});
      this.api.network.send("BYO+" + sName);
   }
};
_loc1.removeToBlacklist = function(sName)
{
   for(var _loc3_ in this._aBlacklist)
   {
      if(sName == this._aBlacklist[_loc3_].sName || sName == "*" + this._aBlacklist[_loc3_].sName)
      {
         this._aBlacklist[_loc3_] = undefined;
         this.api.ui.getUIComponent("Friends").updateIgnoreList();
         this.api.kernel.showMessage(undefined,this.api.lang.getText("TEMPORARY_NOMORE_BLACKLISTED",[sName]),"INFO_CHAT");
         this.api.network.send("BYO-" + sName);
         return undefined;
      }
   }
};
loc1.isTypeVisible = function(nType)
{
   return this._aVisibleTypes[nType];
};
_loc1.setTypeVisible = function(nType, bVisible)
{
   if(nType == dofus["\x0b\b"].ChatManager.TYPE_ABO)
   {
      bVisible = true;
   }
   this._aVisibleTypes[nType] = bVisible;
   this.refresh(true);
};
_loc1.parseInlineItems = function(sMessage, aItems)
{
   var _loc2_ = -2;
   while(true)
   {
      _loc2_ += 2;
      if(_loc2_ >= aItems.length)
      {
         break;
      }
      var _loc4_ = aItems[_loc2_].split(";");
      var _loc10_ = Number(_loc4_[0]);
      var _loc8_ = Number(_loc4_[1]);
      var _loc9_ = aItems[_loc2_ + 1];
      var _loc11_ = new dofus.datacenter["\f\f"](_loc8_,_loc10_,1,1,_loc9_,-1);
      var _loc6_ = "°" + _loc2_ / 2;
      var _loc12_ = this.getLinkItem(_loc11_);
      var _loc5_ = sMessage.indexOf(_loc6_);
      if(_loc5_ != -1)
      {
         var _loc3_ = sMessage.split("");
         _loc3_.splice(_loc5_,_loc6_.length,_loc12_);
         sMessage = _loc3_.join("");
      }
   }
   return sMessage;
};
_loc1.refresh = function(bForceRefresh)
{
   var _loc7_ = this._aMessages.length;
   var _loc3_ = new String();
   var _loc6_ = 0;
   if(_loc7_ == 0 && !bForceRefresh)
   {
      return undefined;
   }
   var _loc4_ = _loc7_;
   while(true)
   {
      _loc4_ -= 1;
      if(!(_loc6_ < dofus["\x0b\b"].ChatManager.MAX_VISIBLE && _loc4_ >= 0))
      {
         break;
      }
      var _loc2_ = this._aMessages[_loc4_];
      if(this._aVisibleTypes[_loc2_.type] == true)
      {
         _loc6_ += 1;
         if(!_loc2_.htmlSyntaxChecked)
         {
            var _loc5_ = dofus["\x0b\b"].ChatManager.safeHtml(_loc2_.text);
            _loc2_.lf = !_loc5_.v || _loc2_.lf;
            _loc2_.text = _loc5_.t;
            _loc2_.htmlSyntaxChecked = true;
         }
         if(this.api.kernel.OptionsManager.getOption("TimestampInChat"))
         {
            _loc3_ = (!!_loc2_.lf ? "<br/>" : "") + _loc2_.textStyleLeft + _loc2_.timestamp + _loc2_.text + _loc2_.textStyleRight + _loc3_;
            continue;
         }
         _loc3_ = (!!_loc2_.lf ? "<br/>" : "") + _loc2_.textStyleLeft + _loc2_.text + _loc2_.textStyleRight + _loc3_;
      }
   }
   this.api.ui.getUIComponent("Banner").setChatText(_loc3_);
};
_global.dofus["\x0b\b"].ChatManager.safeHtml = function(s)
{
   var _loc17_ = true;
   var _loc16_ = new Array();
   var _loc9_ = new Array();
   var _loc1_ = s;
   var _loc10_ = 0;
   var _loc11_ = 0;
   var _loc8_ = "";
   while(_loc1_.indexOf("<") > -1)
   {
      var _loc6_ = _loc1_.indexOf("<");
      if(_loc1_.indexOf(">",_loc6_) == -1)
      {
         _loc1_ = _loc1_.split("<").join("&lt;").split(">").join("&gt;");
         break;
      }
      var _loc4_ = _loc1_.indexOf(">",_loc6_) + 1;
      var _loc3_ = _loc1_.substring(_loc6_,_loc4_);
      var _loc5_ = _loc3_.indexOf("/") == 1;
      var _loc7_ = _loc3_.indexOf("/") == _loc3_.length - 2;
      var _loc2_ = !!_loc5_ ? _loc3_.substring(2,_loc3_.length - 1) : _loc3_.substring(1,_loc3_.length - 1);
      _loc2_ = _loc2_.substring(0,_loc2_.indexOf(" ") > -1 ? _loc2_.indexOf(" ") : _loc2_.length);
      _loc11_;
      _loc9_[_loc11_++] = {c:_loc5_,b:_loc2_};
      if(_loc7_)
      {
         _loc11_;
         _loc9_[_loc11_++] = {c:!_loc5_,b:_loc2_};
      }
      _loc8_ += _loc1_.substring(0,_loc4_);
      _loc1_ = _loc1_.substring(_loc4_);
      _loc10_ += 1;
   }
   _loc8_ += _loc1_;
   return {v:true,t:_loc8_};
};
_loc1.addText = function(sText, sColor, bSound, sUniqId)
{
   if(bSound == undefined)
   {
      bSound = true;
   }
   var _loc7_ = "";
   var _loc4_ = false;
   switch(sColor)
   {
      case dofus.Constants.MSG_CHAT_COLOR:
         var _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         var _loc3_ = true;
         break;
      case dofus.Constants.EMOTE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.GAME_HUNT_CHAT:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ERRORS;
         this.api.electron.makeNotification(_loc2_);
         if(_loc5_ == "START_CONFIRMATION" && _loc4_)
         {
            this.api.sounds.events.onStartHunt();
         }
         break;
      case dofus.Constants.THINK_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_MESSAGES;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.KOLISEO_CHAT_COLOR:
      case dofus.Constants.GROUP_CHAT_COLOR:
      case dofus.Constants.MSGCHUCHOTE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_WISP;
         _loc4_ = true;
         _loc3_ = true;
         if(bSound)
         {
            this.api.sounds.events.onChatWisper();
         }
         break;
      case dofus.Constants.ABO_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ABO;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.INFO_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_INFOS;
         this._nMessageCounterInfo = this._nMessageCounterInfo + 1;
         _loc3_ = false;
         break;
      case dofus.Constants.ERROR_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ERRORS;
         _loc3_ = true;
         if(bSound)
         {
            if(this._bFirstErrorCatched)
            {
               this.api.sounds.events.onError();
            }
            else
            {
               this._bFirstErrorCatched = true;
            }
         }
         break;
      case dofus.Constants.GUILD_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_GUILD;
         _loc4_ = true;
         _loc3_ = true;
         if(bSound && this.api.kernel.OptionsManager.getOption("GuildMessageSound"))
         {
            this.api.sounds.events.onChatWisper();
         }
         break;
      case dofus.Constants.PVP_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_PVP;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.TRADE_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_TRADE;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.RECRUITMENT_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_RECRUITMENT;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.MEETIC_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_MEETIC;
         _loc4_ = true;
         _loc3_ = true;
         break;
      case dofus.Constants.ADMIN_CHAT_COLOR:
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ADMIN;
         _loc3_ = true;
         break;
      case dofus.Constants.ALL_CHAT_COLOR:
         bSound = false;
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_ALL;
         _loc3_ = true;
         break;
      default:
         bSound = false;
         _loc2_ = dofus["\x0b\b"].ChatManager.TYPE_UNKNOWN;
         _loc4_ = true;
         _loc3_ = true;
   }
   if(_loc4_)
   {
      sText = this.addLinkWarning(sText);
      sText = this.applyInputCensorship(sText);
   }
   if(_loc3_ && this.api.kernel.NightManager.time.length)
   {
      _loc7_ = "[" + this.api.kernel.NightManager.time + "] ";
   }
   this._aMessages.push({textStyleLeft:"<font color=\"#" + sColor + "\"><br/>",text:sText,textStyleRight:"</font>",type:_loc2_,uniqId:sUniqId,timestamp:_loc7_,lf:false});
   if(this._aMessages.length > dofus["\x0b\b"].ChatManager.MAX_ALL_LENGTH)
   {
      this._aMessages.shift();
   }
   this.refresh();
};
_global.dofus["\x0b\b"].ChatManager.TYPE_ABO = 10;
_global.dofus["\x0b\b"].ChatManager.TYPE_ALL = 11;
_global.dofus["\x0b\b"].ChatManager.TYPE_UNKNOWN = 12;
_loc1._aVisibleTypes = [true,true,true,true,true,true,true,true,true,true,true,true,true];
