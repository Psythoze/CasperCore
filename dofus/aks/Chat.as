var _loc1 = _global.dofus.aks.Chat.prototype;
_loc1.subscribeChannels = function(_loc2_, _loc3_)
{
   var _loc2_ = "";
   switch(_loc2_)
   {
      case 0:
         _loc2_ = "i";
         break;
      case 2:
         _loc2_ = "*";
         break;
      case 3:
         _loc2_ = "#$p";
         break;
      case 4:
         _loc2_ = "%";
         break;
      case 5:
         _loc2_ = "!";
         break;
      case 6:
         _loc2_ = "?";
         break;
      case 7:
         _loc2_ = ":";
         break;
      case 8:
         _loc2_ = "^";
         break;
      case 11:
         _loc2_ = "~";
   }
   this.aks.send("cC" + (!!_loc3_ ? "+" : "-") + _loc2_,true);
};
_loc1.onSubscribeChannel = function(sExtraData)
{
   var _loc4_ = sExtraData.charAt(0) == "+";
   var _loc5_ = sExtraData.substr(1).split("");
   var _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      var _loc2_ = 0;
      switch(_loc5_[_loc3_])
      {
         case "i":
            _loc2_ = 0;
            break;
         case "*":
            _loc2_ = 2;
            break;
         case "#":
            _loc2_ = 3;
            break;
         case "$":
            _loc2_ = 3;
            break;
         case "p":
            _loc2_ = 3;
            break;
         case "%":
            _loc2_ = 4;
            break;
         case "!":
            _loc2_ = 5;
            break;
         case "?":
            _loc2_ = 6;
            break;
         case ":":
            _loc2_ = 7;
            break;
         case "^":
            _loc2_ = 8;
            break;
         case "@":
            _loc2_ = 9;
            break;
         case "¡":
            _loc2_ = 10;
            break;
         case "~":
            _loc2_ = 11;
            break;
         case "¬":
            _loc2_ = 12;
      }
      _loc3_ = _loc3_ + 1;
   }
};
_loc1.onMessage = function(bSuccess, sExtraData)
{
   if(!bSuccess)
   {
      switch(sExtraData.charAt(0))
      {
         case "S":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SYNTAX_ERROR",[" /w <" + this.api.lang.getText("NAME") + "> <" + this.api.lang.getText("MSG") + ">"]),"ERROR_CHAT");
            break;
         case "f":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED",[sExtraData.substr(1)]),"ERROR_CHAT");
            break;
         case "e":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED_BUT_TRY_SEND_EXTERNAL",[sExtraData.substr(1)]),"ERROR_CHAT");
            break;
         case "n":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED_EXTERNAL_NACK",[sExtraData.substr(1)]),"ERROR_CHAT");
      }
      return undefined;
   }
   var _loc14_ = sExtraData.charAt(0);
   sExtraData = _loc14_ != "|" ? sExtraData.substr(2) : sExtraData.substr(1);
   var _loc7_ = sExtraData.split("|");
   var _loc3_ = _loc7_[2];
   var _loc5_ = _loc7_[1];
   var _loc9_ = _loc7_[0];
   var _loc13_ = _loc7_[3];
   var _loc4_ = !(_loc7_[4] != undefined && (_loc7_[4].length > 0 && _loc7_[4] != "")) ? null : _loc7_[4];
   if(this.api.kernel.ChatManager.isBlacklisted(_loc5_))
   {
      return undefined;
   }
   if(_loc13_.length > 0)
   {
      var _loc16_ = _loc13_.split("!");
      _loc3_ = this.api.kernel.ChatManager.parseInlineItems(_loc3_,_loc16_);
   }
   _loc3_ = this.api.kernel.ChatManager.parseInlinePos(_loc3_);
   switch(_loc14_)
   {
      case "~":
         this.api.kernel.ChatManager.addText("(Monde) " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_,dofus.Constants.ALL_CHAT_COLOR,true,undefined,_loc4_);
         return undefined;
      case "¬":
         this.api.kernel.ChatManager.addText("(" + this.api.lang.getText("UNKNOWN_CHANNEL") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_,dofus.Constants.UNKNOWN_CHAT_COLOR,true,undefined,_loc4_);
         return undefined;
      case "¿":
         this.api.kernel.ChatManager.addText("(" + this.api.lang.getText("KOLISEO_CHANNEL") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_,dofus.Constants.KOLISEO_CHAT_COLOR,true,undefined,_loc4_);
         return undefined;
      case "¡":
         this.api.kernel.ChatManager.addText("(" + this.api.lang.getText("ABO_CHANNEL") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_,dofus.Constants.ABO_CHAT_COLOR,true,undefined,_loc4_);
         return undefined;
      case "F":
         var _loc6_ = "WHISP_CHAT";
         _loc3_ = this.api.kernel.ChatManager.parseSecretsEmotes(_loc3_);
         if(!_loc3_.length)
         {
            return undefined;
         }
         _loc3_ = this.api.lang.getText("FROM") + " <i>" + this.getLinkName(_loc5_,_loc4_) + "</i> : " + _loc3_;
         this.api.kernel.Console.pushWhisper("/w " + _loc5_ + " ");
         break;
      case "T":
         _loc6_ = "WHISP_CHAT";
         _loc3_ = this.api.lang.getText("TO_DESTINATION") + " " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      case "#":
         if(this.api.datacenter.Game.isFight)
         {
            _loc6_ = "WHISP_CHAT";
            if(this.api.datacenter.Game.isSpectator)
            {
               var _loc12_ = "(" + this.api.lang.getText("SPECTATOR") + ")";
            }
            else
            {
               _loc12_ = "(" + this.api.lang.getText("TEAM") + ")";
            }
            _loc3_ = _loc12_ + " " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         }
         break;
      case "p":
         if(this.api.datacenter.Game.isFight)
         {
            _loc6_ = "WHISP_CHAT";
            _loc3_ = "(" + this.api.lang.getText("SPECTATOR") + ")" + " " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         }
         break;
      case "%":
         _loc6_ = "GUILD_CHAT_SOUND";
         _loc3_ = "(" + this.api.lang.getText("GUILD") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      case "$":
         _loc6_ = "PARTY_CHAT";
         _loc3_ = "(" + this.api.lang.getText("PARTY") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      case "!":
         _loc6_ = "PVP_CHAT";
         _loc3_ = "(" + this.api.lang.getText("ALIGNMENT") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      case "?":
         _loc6_ = "RECRUITMENT_CHAT";
         _loc3_ = "(" + this.api.lang.getText("RECRUITMENT") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      case ":":
         _loc6_ = "TRADE_CHAT";
         _loc3_ = "(" + this.api.lang.getText("TRADE") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      case "^":
         _loc6_ = "MEETIC_CHAT";
         _loc3_ = "(" + this.api.lang.getText("MEETIC") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      case "@":
         _loc6_ = "ADMIN_CHAT";
         _loc3_ = "(" + this.api.lang.getText("PRIVATE_CHANNEL") + ") " + this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      case "+":
         _loc6_ = "ERROR_CHAT";
         _loc3_ = this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         break;
      default:
         var _loc11_ = _loc3_.charAt(0) == dofus.Constants.EMOTE_CHAR && (_loc3_.charAt(1) == dofus.Constants.EMOTE_CHAR && (_loc3_.charAt(_loc3_.length - 1) == dofus.Constants.EMOTE_CHAR && _loc3_.charAt(_loc3_.length - 2) == dofus.Constants.EMOTE_CHAR));
         if(this.api.lang.getConfigText("EMOTES_ENABLED") && (!_loc11_ && (_loc3_.charAt(0) == dofus.Constants.EMOTE_CHAR && _loc3_.charAt(_loc3_.length - 1) == dofus.Constants.EMOTE_CHAR)))
         {
            if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
            {
               var _loc10_ = !(_loc3_.charAt(_loc3_.length - 2) == "." && _loc3_.charAt(_loc3_.length - 3) != ".") ? _loc3_ : _loc3_.substr(0,_loc3_.length - 2) + dofus.Constants.EMOTE_CHAR;
               _loc10_ = dofus.Constants.EMOTE_CHAR + _loc10_.charAt(1).toUpperCase() + _loc10_.substr(2);
               this.api.gfx.addSpriteBubble(_loc9_,this.api.kernel.ChatManager.applyInputCensorship(_loc10_));
            }
            _loc6_ = "EMOTE_CHAT";
            _loc3_ = _loc3_.substr(1,_loc3_.length - 2);
            if(!dofus.managers.ChatManager.isPonctuation(_loc3_.charAt(_loc3_.length - 1)))
            {
               _loc3_ += ".";
            }
            _loc3_ = "<i>" + this.getLinkName(_loc5_,_loc4_) + " " + _loc3_.charAt(0).toLowerCase() + _loc3_.substr(1) + "</i>";
         }
         else if(_loc3_.substr(0,7) == "!THINK!")
         {
            _loc3_ = _loc3_.substr(7);
            if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
            {
               this.api.gfx.addSpriteBubble(_loc9_,this.api.kernel.ChatManager.applyInputCensorship(_loc3_),ank.battlefield["\x1e\x0b\t"].BUBBLE_TYPE_THINK);
            }
            _loc6_ = "THINK_CHAT";
            _loc3_ = "<i>" + this.getLinkName(_loc5_,_loc4_) + " " + this.api.lang.getText("THINKS_WORD") + " : " + _loc3_ + "</i>";
         }
         else if(_loc11_ && !_global.isNaN(_loc3_.substr(2,_loc3_.length - 4)))
         {
            if(!this.api.kernel.OptionsManager.getOption("UseSpeakingItems"))
            {
               return undefined;
            }
            var _loc17_ = _global.parseInt(_loc3_.substr(2,_loc3_.length - 4));
            var _loc15_ = this.api.lang.getSpeakingItemsText(_loc17_ - Number(_loc9_));
            if(!_loc15_.m)
            {
               return undefined;
            }
            _loc6_ = "MESSAGE_CHAT";
            _loc3_ = _loc15_.m;
            if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
            {
               this.api.gfx.addSpriteBubble(_loc9_,this.api.kernel.ChatManager.applyInputCensorship(_loc3_));
            }
            _loc3_ = this.getLinkName(_loc5_,_loc4_,true) + " : " + _loc3_;
         }
         else
         {
            if(!this.api.datacenter.Game.isRunning && this.api.kernel.ChatManager.isTypeVisible(2))
            {
               this.api.gfx.addSpriteBubble(_loc9_,this.api.kernel.ChatManager.applyInputCensorship(_loc3_));
            }
            _loc6_ = "MESSAGE_CHAT";
            _loc3_ = this.getLinkName(_loc5_,_loc4_) + " : " + _loc3_;
         }
   }
   this.api.kernel.showMessage(undefined,_loc3_,_loc6_,undefined,_loc4_);
};
