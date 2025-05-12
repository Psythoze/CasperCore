var _loc1 = dofus["\x0b\b"].OptionsManager.prototype;
dofus["\x0b\b"].OptionsManager.DEFAULT_VALUES = {loaded:true,Grid:false,Transparency:false,SpriteInfos:true,SpriteMove:true,MapInfos:true,AutoHideSmileys:false,StringCourse:true,PointsOverHead:true,ChatEffects:true,CreaturesMode:50,Buff:true,GuildMessageSound:false,BannerShortcuts:true,StartTurnSound:true,TipsOnStart:true,DisplayStyle:"normal",DebugSizeIndex:0,ServerPortIndex:0,MovableBar:false,ViewAllMonsterInGroup:true,MovableBarSize:5,ShortcutSet:1,ShortcutSetDefault:1,CharacterPreview:true,MapFilters:[0,1,1,1,1,1,1],Aura:true,AudioMusicVol:20,AudioEffectVol:15,AudioEnvVol:15,AudioMusicMute:false,AudioEffectMute:false,AudioEnvMute:false,FloatingTipsCoord:new com.ankamagames.types["\x1e\x16\x0e"](415,30),DisplayingFreshTips:true,CensorshipFilter:true,BigStoreSellFilter:false,RememberAccountName:false,LastAccountNameUsed:"",DefaultQuality:"low",ConquestFilter:-2,FightGroupAutoLock:false,BannerIllustrationMode:"artwork",BannerGaugeMode:"xp",AskForWrongCraft:true,AdvancedLineOfSight:false,RemindTurnTime:true,HideSpellBar:false,SeeAllSpell:true,UseSpeakingItems:true,ConfirmDropItem:true,TimestampInChat:true,ViewDicesDammages:false,SeeDamagesColor:true,RemasteredSpellIconsPack:3,SkipFightAnimations:false,SkipLootPanel:false,colorfulTactic:true,NightMode:true,ornamento:false,tactico:false,UseLightEndFightUI:false,Follower:false,ViewHPAsBar:true,AnimateHPBar:true};
_loc1.applyOption = function(_loc2_, _loc3_)
{
   switch(_loc2_)
   {
      case "PointsOverHead":
      case "ChatEffects":
      case "GuildMessageSound":
      case "StartTurnSound":
      case "BannerShortcuts":
      case "TipsOnStart":
      case "DebugSizeIndex":
      case "ServerPortIndex":
      case "ViewAllMonsterInGroup":
      case "RegroupDamage":
      case "AutoHideSmiley":
         break;
      case "Grid":
         if(_loc3_ == true)
         {
            this.api.gfx.drawGrid();
         }
         else
         {
            this.api.gfx.removeGrid();
         }
         break;
      case "colorfulTactic":
         if(this.api.datacenter.Game.isTacticMode && this.api.datacenter.Game.isFight)
         {
            this.api.gfx.activateTacticMode(false);
            this.api.gfx.activateTacticMode(true);
         }
         break;
      case "Transparency":
         this.api.gfx.setSpriteGhostView(_loc3_);
         break;
      case "SpriteInfos":
         if(_loc3_ == false)
         {
            this.api.ui.unloadUIComponent("SpriteInfos");
            this.setOption("SpriteMove",false);
         }
         break;
      case "SpriteMove":
         if(_loc3_ == false)
         {
            this.api.gfx.clearZoneLayer("move");
         }
         else if(this.loadValue("SpriteInfos") == false)
         {
            this.setOption("SpriteInfos",true);
         }
         break;
      case "MapInfos":
         if(_loc3_ == true)
         {
            this.api.ui.loadUIComponent("MapInfos","MapInfos",undefined,{bForceLoad:true});
         }
         else
         {
            this.api.ui.unloadUIComponent("MapInfos");
         }
         break;
      case "StringCourse":
         if(_loc3_ == false)
         {
            this.api.ui.unloadUIComponent("StringCourse");
         }
         break;
      case "CreaturesMode":
         this.api.kernel.GameManager.applyCreatureMode();
         break;
      case "Buff":
         if(_loc3_)
         {
            this.api.ui.loadUIComponent("Buff","Buff");
         }
         else
         {
            this.api.ui.unloadUIComponent("Buff");
         }
         break;
      case "DisplayStyle":
         this.api.kernel.setDisplayStyle(_loc3_);
         break;
      case "DefaultQuality":
         this.api.kernel.setQuality(_loc3_);
         break;
      case "NightMode":
         this.api.kernel.NightManager.clear();
         this.api.kernel.NightManager.setState();
         break;
      case "MovableBar":
         this.api.ui.getUIComponent("Banner").displayMovableBar(_loc3_ && (this.api.datacenter.Game.isFight || !this.getOption("HideSpellBar")));
         break;
      case "HideSpellBar":
         this.api.ui.getUIComponent("Banner").displayMovableBar(this.getOption("MovableBar") && (this.api.datacenter.Game.isFight || !_loc3_));
         break;
      case "MovableBarSize":
         this.api.ui.getUIComponent("Banner").setMovableBarSize(_loc3_);
         break;
      case "ShortcutSet":
         this.api.kernel.KeyManager.onSetChange(_loc3_);
         break;
      case "CharacterPreview":
         this.api.ui.getUIComponent("Inventory").showCharacterPreview(_loc3_);
         break;
      case "AudioMusicVol":
         this.api.kernel.AudioManager.musicVolume = _loc3_;
         break;
      case "AudioEffectVol":
         this.api.kernel.AudioManager.effectVolume = _loc3_;
         break;
      case "AudioEnvVol":
         this.api.kernel.AudioManager.environmentVolume = _loc3_;
         break;
      case "AudioMusicMute":
         this.api.kernel.AudioManager.musicMute = _loc3_;
         break;
      case "hideReset":
         this.api.network.Game.ReturnResetOptions();
         break;
      case "hidePrestige":
         this.api.network.Game.ReturnPrestigeOptions();
         break;
      case "AudioEffectMute":
         this.api.kernel.AudioManager.effectMute = _loc3_;
         break;
      case "AudioEnvMute":
         this.api.kernel.AudioManager.environmentMute = _loc3_;
         break;
      case "tactico":
         this.api.datacenter.Game.isTacticMode = _loc3_;
         break;
      case "TimestampInChat":
         this.api.kernel.ChatManager.refresh();
         break;
      case "SkipFightAnimations":
         this.api.datacenter.Player.isSkippingFightAnimations = _loc3_;
         break;
      case "SkipLootPanel":
         this.api.datacenter.Player.isSkippingLootPanel = _loc3_;
   }
};
