var _loc1 = dofus["\r\x14"].gapi.ui.Options.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Options.CLASS_NAME);
   var _loc3_ = System.capabilities.playerType == "StandAlone" && System.capabilities.os.indexOf("Windows") != -1;
   this._eaDisplayStyles = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaDisplayStyles.push({label:this.api.lang.getText("DISPLAYSTYLE_NORMAL"),style:"normal"});
   if(System.capabilities.screenResolutionY > 950 || _loc3_)
   {
      this._eaDisplayStyles.push({label:this.api.lang.getText("DISPLAYSTYLE_MEDIUM" + (!!_loc3_ ? "_RES" : "")),style:"medium"});
   }
   this._eaDisplayStyles.push({label:this.api.lang.getText("DISPLAYSTYLE_MAXIMIZED" + (!!_loc3_ ? "_RES" : "")),style:"maximized"});
   this._eaFlashQualities = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaFlashQualities.push({label:this.api.lang.getText("QUALITY_LOW"),quality:"low"});
   this._eaFlashQualities.push({label:this.api.lang.getText("QUALITY_MEDIUM"),quality:"medium"});
   this._eaFlashQualities.push({label:this.api.lang.getText("QUALITY_HIGH"),quality:"high"});
   this._eaFlashQualities.push({label:this.api.lang.getText("QUALITY_BEST"),quality:"best"});
   this._eaSpellIconsPacks = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaSpellIconsPacks.push({label:this.api.lang.getText("UI_OPTION_SPELLCOLOR_CLASSIC"),frame:3});
   this._eaSpellIconsPacks.push({label:this.api.lang.getText("UI_OPTION_SPELLCOLOR_REMASTERED"),frame:1});
   this._eaSpellIconsPacks.push({label:this.api.lang.getText("UI_OPTION_SPELLCOLOR_CONTRAST"),frame:2});
   this._eaRemasteredClipsHD = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaRemasteredClipsHD.push({label:this.api.lang.getText("UI_OPTION_CLIPSHD_REMASTERED"),value:"remastered"});
   this._eaRemasteredClipsHD.push({label:this.api.lang.getText("UI_OPTION_CLIPSHD_CLASSIC"),value:"classic"});
};
_loc1.initTabTexts = function()
{
   this._mcTabViewer._lblMusic.text = this.api.lang.getText("MUSICS");
   this._mcTabViewer._lblSounds.text = this.api.lang.getText("SOUNDS");
   this._mcTabViewer._lblEnvironment.text = this.api.lang.getText("ENVIRONMENT");
   this._btnClose2.label = this.api.lang.getText("CLOSE");
   this._mcTabViewer._lblTacticColor.text = this.api.lang.getText("OPTION_COLORFULTACTIC");
   this._btnDefault.label = this.api.lang.getText("DEFAUT");
   this._mcTabViewer._btnShortcuts.label = this.api.lang.getText("KEYBORD_SHORTCUT");
   this._mcTabViewer._btnClearCache.label = this.api.lang.getText("CLEAR_CACHE");
   this._mcTabViewer._btnResetTips.label = this.api.lang.getText("REINIT_WORD");
   this._mcTabViewer._lblTitleMap.text = this.api.lang.getText("MAP");
   this._mcTabViewer._lblTitleFight.text = this.api.lang.getText("FIGHT");
   this._mcTabViewer._lblTitleSecurity.text = this.api.lang.getText("SECURITY_SHORTCUT");
   this._mcTabViewer._lblTitleUI.text = this.api.lang.getText("INTERFACE_WORD");
   this._mcTabViewer._lblNoche.text = this.api.lang.getText("OPTION_NIGHT_MODE");
   this._mcTabViewer._lblTitleMisc.text = this.api.lang.getText("MISC_WORD");
   this._mcTabViewer._lblTitleOptimiz.text = this.api.lang.getText("OPTIONS_OPTIMIZE");
   this._mcTabViewer._lblTitleScreen.text = this.api.lang.getText("OPTION_TITLE_SCREEN");
   this._mcTabViewer._lblGrid.text = this.api.lang.getText("OPTION_GRID");
   this._mcTabViewer._lblTransparency.text = this.api.lang.getText("OPTION_TRANSPARENCY");
   this._mcTabViewer._lblSpriteInfos.text = this.api.lang.getText("OPTION_SPRITEINFOS");
   this._mcTabViewer._lblSpriteMove.text = this.api.lang.getText("OPTION_SPRITEMOVE");
   this._mcTabViewer._lblMapInfos.text = this.api.lang.getText("OPTION_MAPINFOS");
   this._mcTabViewer._lblViewHPAsBar.text = this.api.lang.getText("OPTION_VIEW_HP_AS_BAR");
   this._mcTabViewer._lblAnimateHPBar.text = this.api.lang.getText("OPTION_ANIMATE_HP_BAR");
   this._mcTabViewer._lblAutoHideSmileys.text = this.api.lang.getText("OPTION_AUTOHIDESMILEYS");
   this._mcTabViewer._lblStringCourse.text = this.api.lang.getText("OPTION_STRINGCOURSE");
   this._mcTabViewer._lblPointsOverHead.text = this.api.lang.getText("OPTION_POINTSOVERHEAD");
   this._mcTabViewer._lblChatEffects.text = this.api.lang.getText("OPTION_CHATEFFECTS");
   this._mcTabViewer._lblBuff.text = this.api.lang.getText("OPTION_BUFF");
   this._mcTabViewer._lblAdvancedLineOfSight.text = this.api.lang.getText("OPTION_LINEOFSIGHT");
   this._mcTabViewer._lblRemindTurnTime.text = this.api.lang.getText("OPTION_REMINDTURN");
   this._mcTabViewer._lblHideSpellBar.text = this.api.lang.getText("OPTION_SPELLBAR");
   this._mcTabViewer._lblReset.text = this.api.lang.getText("HIDEMY_RESET");
   this._mcTabViewer._lblCraftWrongConfirm.text = this.api.lang.getText("OPTION_WRONG_CRAFT_CONFIRM");
   this._mcTabViewer._lblGuildMessageSound.text = this.api.lang.getText("OPTION_GUILDMESSAGESOUND");
   this._mcTabViewer._lblStartTurnSound.text = this.api.lang.getText("OPTION_STARTTURNSOUND");
   this._mcTabViewer._lblBannerShortcuts.text = this.api.lang.getText("OPTION_BANNERSHORTCUTS");
   this._mcTabViewer._lblTipsOnStart.text = this.api.lang.getText("OPTION_TIPSONSTART");
   this._mcTabViewer._lblCreaturesMode.text = this.api.lang.getText("OPTION_CREATURESMODE");
   this._mcTabViewer._lblDisplayStyle.text = this.api.lang.getText("OPTION_DISPLAYSTYLE");
   this._mcTabViewer._lblMovableBar.text = this.api.lang.getText("OPTION_MOVABLEBAR");
   this._mcTabViewer._lblMovableBarSize.text = this.api.lang.getText("OPTION_MOVABLEBARSIZE");
   this._mcTabViewer._lblSpellBar.text = this.api.lang.getText("OPTION_SPELLBAR");
   this._mcTabViewer._lblViewAllMonsterInGroup.text = this.api.lang.getText("OPTION_VIEWALLMONSTERINGROUP");
   this._mcTabViewer._lblCharacterPreview.text = this.api.lang.getText("OPTION_CHARACTERPREVIEW");
   this._mcTabViewer._lblFollower.text = this.api.lang.getText("OPTION_FOLLOWER");
   this._mcTabViewer._lblSeeAllSpell.text = this.api.lang.getText("UI_OPTION_SEEALLSPELL");
   this._mcTabViewer._lblAura.text = this.api.lang.getText("OPTION_AURA");
   this._mcTabViewer._lblOrnamentos.text = this.api.lang.getText("HIDE_ORNAMENTS");
   this._mcTabViewer._lblListonOmega.text = this.api.lang.getText("HIDE_OMEGA");
   this._mcTabViewer._lblTactico.text = this.api.lang.getText("FORCE_TACTIC");
   this._mcTabViewer._lblTutorialTips.text = this.api.lang.getText("OPTION_TUTORIALTIPS");
   this._mcTabViewer._lblCensorshipFilter.text = this.api.lang.getText("OPTION_CENSORSHIP_FILTER");
   this._mcTabViewer._lblDefaultQuality.text = this.api.lang.getText("OPTION_DEFAULTQUALITY");
   this._mcTabViewer._lblSpeakingItems.text = this.api.lang.getText("OPTION_USE_SPEAKINGITEMS");
   this._mcTabViewer._lblConfirmDropItem.text = this.api.lang.getText("OPTION_CONFIRM_DROPITEM");
   this._mcTabViewer._lblChatTimestamp.text = this.api.lang.getText("OPTION_USE_CHATTIMESTAMP");
   this._mcTabViewer._lblViewDicesDammages.text = this.api.lang.getText("OPTION_VIEW_DICES_DAMMAGES");
   this._mcTabViewer._lblSeeDamagesColor.text = this.api.lang.getText("UI_OPTION_SEEDAMAGESCOLOR");
   this._mcTabViewer._lblSkipFightAnimations.text = this.api.lang.getText("UI_OPTION_HIDEVISUALSPELLEFFECT");
   this._mcTabViewer._lblRemasteredClipsHD.text = this.api.lang.getText("REMASTERED_CLIPS_HD_FRAME_RATE");
   this._mcTabViewer._lblRemasteredSpellIcons.text = this.api.lang.getText("DOFUS_REMASTERED_SPELL_ICONS");
   this._mcTabViewer._lblSkipLootPanel.text = this.api.lang.getText("OPTION_SKIP_LOOT_PANEL");
};
_loc1.addTabListeners = function()
{
   this._mcTabViewer._btnShortcuts.addEventListener("click",this);
   this._mcTabViewer._btnClearCache.addEventListener("click",this);
   this._mcTabViewer._btnGrid.addEventListener("click",this);
   this._mcTabViewer._btnTransparency.addEventListener("click",this);
   this._mcTabViewer._btnSpriteInfos.addEventListener("click",this);
   this._mcTabViewer._btnSpriteMove.addEventListener("click",this);
   this._mcTabViewer._btnTacticColor.addEventListener("click",this);
   this._mcTabViewer._btnNoche.addEventListener("click",this);
   this._mcTabViewer._btnMapInfos.addEventListener("click",this);
   this._mcTabViewer._btnTactico.addEventListener("click",this);
   this._mcTabViewer._btnListonOmega.addEventListener("click",this);
   this._mcTabViewer._btnOrnamentos.addEventListener("click",this);
   this._mcTabViewer._btnAutoHideSmileys.addEventListener("click",this);
   this._mcTabViewer._btnStringCourse.addEventListener("click",this);
   this._mcTabViewer._btnPointsOverHead.addEventListener("click",this);
   this._mcTabViewer._btnChatEffects.addEventListener("click",this);
   this._mcTabViewer._btnBuff.addEventListener("click",this);
   this._mcTabViewer._btnGuildMessageSound.addEventListener("click",this);
   this._mcTabViewer._btnStartTurnSound.addEventListener("click",this);
   this._mcTabViewer._btnBannerShortcuts.addEventListener("click",this);
   this._mcTabViewer._btnTipsOnStart.addEventListener("click",this);
   this._mcTabViewer._btnMovableBar.addEventListener("click",this);
   this._mcTabViewer._btnViewHPAsBar.addEventListener("click",this);
   this._mcTabViewer._btnAnimateHPBar.addEventListener("click",this);
   this._mcTabViewer._btnViewAllMonsterInGroup.addEventListener("click",this);
   this._mcTabViewer._btnCharacterPreview.addEventListener("click",this);
   this._mcTabViewer._btnFollower.addEventListener("click",this);
   this._mcTabViewer._btnAura.addEventListener("click",this);
   this._mcTabViewer._btnReset.addEventListener("click",this);
   this._mcTabViewer._btnTutorialTips.addEventListener("click",this);
   this._mcTabViewer._btnResetTips.addEventListener("click",this);
   this._mcTabViewer._btnCensorshipFilter.addEventListener("click",this);
   this._mcTabViewer._btnCraftWrongConfirm.addEventListener("click",this);
   this._mcTabViewer._btnAdvancedLineOfSight.addEventListener("click",this);
   this._mcTabViewer._btnRemindTurnTime.addEventListener("click",this);
   this._mcTabViewer._btnHideSpellBar.addEventListener("click",this);
   this._mcTabViewer._btnSeeAllSpell.addEventListener("click",this);
   this._mcTabViewer._btnSpeakingItems.addEventListener("click",this);
   this._mcTabViewer._btnConfirmDropItem.addEventListener("click",this);
   this._mcTabViewer._btnChatTimestamp.addEventListener("click",this);
   this._mcTabViewer._btnViewDicesDammages.addEventListener("click",this);
   this._mcTabViewer._btnSeeDamagesColor.addEventListener("click",this);
   this._mcTabViewer._btnSkipFightAnimations.addEventListener("click",this);
   this._mcTabViewer._cbDisplayStyle.addEventListener("itemSelected",this);
   this._mcTabViewer._cbDefaultQuality.addEventListener("itemSelected",this);
   this._mcTabViewer._cbSpellIconsPack.addEventListener("itemSelected",this);
   this._mcTabViewer._cbRemasteredClipsHD.addEventListener("itemSelected",this);
   this._mcTabViewer._vsMusic.addEventListener("change",this);
   this._mcTabViewer._vsSounds.addEventListener("change",this);
   this._mcTabViewer._vsEnvironment.addEventListener("change",this);
   this._mcTabViewer._vsCreaturesMode.addEventListener("change",this);
   this._mcTabViewer._vsMovableBarSize.addEventListener("change",this);
   this._mcTabViewer._btnMuteMusic.addEventListener("click",this);
   this._mcTabViewer._btnMuteSounds.addEventListener("click",this);
   this._mcTabViewer._btnMuteEnvironment.addEventListener("click",this);
   this._mcTabViewer._btnSkipLootPanel.addEventListener("click",this);
   this._sbOptions.addEventListener("scroll",this);
};
_loc1.initData = function()
{
   this._mcTabViewer._btnShortcuts.enabled = this.api.kernel.XTRA_LANG_FILES_LOADED;
   var _loc3_ = this.api.kernel.OptionsManager;
   this._mcTabViewer._vsMusic.value = _loc3_.getOption("AudioMusicVol");
   this._mcTabViewer._vsSounds.value = _loc3_.getOption("AudioEffectVol");
   this._mcTabViewer._vsEnvironment.value = _loc3_.getOption("AudioEnvVol");
   this._mcTabViewer._btnMuteMusic.selected = _loc3_.getOption("AudioMusicMute");
   this._mcTabViewer._btnMuteSounds.selected = _loc3_.getOption("AudioEffectMute");
   this._mcTabViewer._btnMuteEnvironment.selected = _loc3_.getOption("AudioEnvMute");
   this._mcTabViewer._btnGrid.selected = _loc3_.getOption("Grid");
   this._mcTabViewer._btnTransparency.selected = _loc3_.getOption("Transparency");
   this._mcTabViewer._btnSpriteInfos.selected = _loc3_.getOption("SpriteInfos");
   this._mcTabViewer._btnSpriteMove.selected = _loc3_.getOption("SpriteMove");
   this._mcTabViewer._btnMapInfos.selected = _loc3_.getOption("MapInfos");
   this._mcTabViewer._btnAutoHideSmileys.selected = _loc3_.getOption("AutoHideSmileys");
   this._mcTabViewer._btnStringCourse.selected = _loc3_.getOption("StringCourse");
   this._mcTabViewer._btnPointsOverHead.selected = _loc3_.getOption("PointsOverHead");
   this._mcTabViewer._btnChatEffects.selected = _loc3_.getOption("ChatEffects");
   this._mcTabViewer._btnBuff.selected = _loc3_.getOption("Buff");
   this._mcTabViewer._btnNoche.selected = _loc3_.getOption("NightMode");
   this._mcTabViewer._btnFollower.selected = _loc3_.getOption("Follower");
   this._mcTabViewer._btnViewHPAsBar.selected = _loc3_.getOption("ViewHPAsBar");
   this._mcTabViewer._btnAnimateHPBar.selected = _loc3_.getOption("AnimateHPBar");
   this._mcTabViewer._btnTacticColor.selected = _loc3_.getOption("colorfulTactic");
   this._mcTabViewer._btnOrnamentos.selected = _loc3_.getOption("ornamento");
   this._mcTabViewer._btnReset.selected = _loc3_.getOption("hideReset");
   this._mcTabViewer._btnGuildMessageSound.selected = _loc3_.getOption("GuildMessageSound");
   this._mcTabViewer._btnStartTurnSound.selected = _loc3_.getOption("StartTurnSound");
   this._mcTabViewer._btnBannerShortcuts.selected = _loc3_.getOption("BannerShortcuts");
   this._mcTabViewer._btnTipsOnStart.selected = _loc3_.getOption("TipsOnStart");
   this._mcTabViewer._btnViewAllMonsterInGroup.selected = _loc3_.getOption("ViewAllMonsterInGroup");
   this._mcTabViewer._btnCharacterPreview.selected = _loc3_.getOption("CharacterPreview");
   this._mcTabViewer._btnAura.selected = _loc3_.getOption("Aura");
   this._mcTabViewer._btnTactico.selected = _loc3_.getOption("tactico");
   this._mcTabViewer._btnListonOmega.selected = _loc3_.getOption("omega");
   this._mcTabViewer._btnTutorialTips.selected = _loc3_.getOption("DisplayingFreshTips");
   this._mcTabViewer._btnCensorshipFilter.selected = _loc3_.getOption("CensorshipFilter");
   this._mcTabViewer._btnCraftWrongConfirm.selected = _loc3_.getOption("AskForWrongCraft");
   this._mcTabViewer._btnAdvancedLineOfSight.selected = _loc3_.getOption("AdvancedLineOfSight");
   this._mcTabViewer._btnRemindTurnTime.selected = _loc3_.getOption("RemindTurnTime");
   this._mcTabViewer._btnHideSpellBar.selected = _loc3_.getOption("HideSpellBar");
   this._mcTabViewer._btnSeeAllSpell.selected = !_loc3_.getOption("SeeAllSpell");
   this._mcTabViewer._btnSpeakingItems.selected = _loc3_.getOption("UseSpeakingItems");
   this._mcTabViewer._btnConfirmDropItem.selected = _loc3_.getOption("ConfirmDropItem");
   this._mcTabViewer._btnChatTimestamp.selected = _loc3_.getOption("TimestampInChat");
   this._mcTabViewer._btnViewDicesDammages.selected = _loc3_.getOption("ViewDicesDammages");
   this._mcTabViewer._btnSeeDamagesColor.selected = _loc3_.getOption("SeeDamagesColor");
   this._mcTabViewer._btnMovableBar.selected = _loc3_.getOption("MovableBar");
   this._mcTabViewer._vsMovableBarSize.value = _loc3_.getOption("MovableBarSize");
   this._mcTabViewer._lblMovableBarSizeValue.text = _loc3_.getOption("MovableBarSize");
   this._mcTabViewer._vsCreaturesMode.value = _loc3_.getOption("CreaturesMode");
   this._mcTabViewer._btnSkipFightAnimations.selected = _loc3_.getOption("SkipFightAnimations");
   this._mcTabViewer._lblCreaturesModeValue.text = !_global.isFinite(_loc3_.getOption("CreaturesMode")) ? this.api.lang.getText("INFINIT") : _loc3_.getOption("CreaturesMode");
   this._mcTabViewer._cbDefaultQuality.dataProvider = this._eaFlashQualities;
   this.selectQuality(_loc3_.getOption("DefaultQuality"));
   this.selectRemasteredSpellIconsPack(_loc3_.getOption("RemasteredSpellIconsPack"));
   selectRemasteredClipsHD(_loc3_.getOption("RemasteredClipsHD"));
   this._mcTabViewer._cbRemasteredClipsHD.dataProvider = this._eaRemasteredClipsHD;
   this._mcTabViewer._cbSpellIconsPack.dataProvider = this._eaSpellIconsPacks;
   this._mcTabViewer._cbDisplayStyle.dataProvider = this._eaDisplayStyles;
   this._mcTabViewer._btnSkipLootPanel.selected = _loc3_.getOption("SkipLootPanel");
   var _loc4_ = System.capabilities.playerType == "PlugIn" || (System.capabilities.playerType == "ActiveX" || System.capabilities.playerType == "StandAlone" && System.capabilities.os.indexOf("Windows") != -1);
   this.selectDisplayStyle(!_loc4_ ? "normal" : _loc3_.getOption("DisplayStyle"));
   this._mcTabViewer._cbDisplayStyle.enabled = _loc4_;
   var _loc5_ = new Color(this._mcTabViewer._cbDisplayStyle);
   _loc5_.setTransform(!!_loc4_ ? {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0} : {ra:30,rb:149,ga:30,gb:145,ba:30,bb:119});
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_btnMuteMusic":
         this.api.kernel.OptionsManager.setOption("AudioMusicMute",_loc2_.target.selected);
         break;
      case "_btnMuteSounds":
         this.api.kernel.OptionsManager.setOption("AudioEffectMute",_loc2_.target.selected);
         break;
      case "_btnMuteEnvironment":
         this.api.kernel.OptionsManager.setOption("AudioEnvMute",_loc2_.target.selected);
         break;
      case "_btnOrnamentos":
         this.api.kernel.OptionsManager.setOption("ornamento",_loc2_.target.selected);
         break;
      case "_btnNoche":
         this.api.kernel.OptionsManager.setOption("NightMode",_loc2_.target.selected);
         break;
      case "_btnFollower":
         this.api.kernel.OptionsManager.setOption("Follower",_loc2_.target.selected);
         break;
      case "_btnTactico":
         this.api.kernel.OptionsManager.setOption("tactico",_loc2_.target.selected);
         break;
      case "_btnListonOmega":
         this.api.kernel.OptionsManager.setOption("omega",_loc2_.target.selected);
         break;
      case "_btnDefault":
         this.api.kernel.OptionsManager.loadDefault();
         break;
      case "_btnShortcuts":
         this.api.ui.loadUIComponent("Shortcuts","Shortcuts",undefined,{bAlwaysOnTop:true});
         break;
      case "_btnClearCache":
         this.api.kernel.askClearCache();
         break;
      case "_btnGrid":
         this.api.kernel.OptionsManager.setOption("Grid",_loc2_.target.selected);
         break;
      case "_btnTransparency":
         this.api.kernel.OptionsManager.setOption("Transparency",_loc2_.target.selected);
         break;
      case "_btnViewHPAsBar":
         this.api.kernel.OptionsManager.setOption("ViewHPAsBar",_loc2_.target.selected);
         break;
      case "_btnAnimateHPBar":
         this.api.kernel.OptionsManager.setOption("AnimateHPBar",_loc2_.target.selected);
         break;
      case "_btnSpriteInfos":
         this.api.kernel.OptionsManager.setOption("SpriteInfos",_loc2_.target.selected);
         break;
      case "_btnSpriteMove":
         this.api.kernel.OptionsManager.setOption("SpriteMove",_loc2_.target.selected);
         break;
      case "_btnTacticColor":
         this.api.kernel.OptionsManager.setOption("colorfulTactic",_loc2_.target.selected);
         break;
      case "_btnMapInfos":
         this.api.kernel.OptionsManager.setOption("MapInfos",_loc2_.target.selected);
         break;
      case "_btnCraftWrongConfirm":
         this.api.kernel.OptionsManager.setOption("AskForWrongCraft",_loc2_.target.selected);
         break;
      case "_btnAutoHideSmileys":
         this.api.kernel.OptionsManager.setOption("AutoHideSmileys",_loc2_.target.selected);
         break;
      case "_btnStringCourse":
         this.api.kernel.OptionsManager.setOption("StringCourse",_loc2_.target.selected);
         break;
      case "_btnPointsOverHead":
         this.api.kernel.OptionsManager.setOption("PointsOverHead",_loc2_.target.selected);
         break;
      case "_btnChatEffects":
         this.api.kernel.OptionsManager.setOption("ChatEffects",_loc2_.target.selected);
         break;
      case "_btnBuff":
         this.api.kernel.OptionsManager.setOption("Buff",_loc2_.target.selected);
         break;
      case "_btnGuildMessageSound":
         this.api.kernel.OptionsManager.setOption("GuildMessageSound",_loc2_.target.selected);
         break;
      case "_btnStartTurnSound":
         this.api.kernel.OptionsManager.setOption("StartTurnSound",_loc2_.target.selected);
         break;
      case "_btnBannerShortcuts":
         this.api.kernel.OptionsManager.setOption("BannerShortcuts",_loc2_.target.selected);
         break;
      case "_btnTipsOnStart":
         this.api.kernel.OptionsManager.setOption("TipsOnStart",_loc2_.target.selected);
         break;
      case "_btnMovableBar":
         this.api.kernel.OptionsManager.setOption("MovableBar",_loc2_.target.selected);
         break;
      case "_btnViewAllMonsterInGroup":
         this.api.kernel.OptionsManager.setOption("ViewAllMonsterInGroup",_loc2_.target.selected);
         break;
      case "_btnCharacterPreview":
         this.api.kernel.OptionsManager.setOption("CharacterPreview",_loc2_.target.selected);
         break;
      case "_btnAura":
         this.api.kernel.OptionsManager.setOption("Aura",_loc2_.target.selected);
         break;
      case "_btnReset":
         this.api.kernel.OptionsManager.setOption("hideReset",_loc2_.target.selected);
         break;
      case "_btnTutorialTips":
         this.api.kernel.OptionsManager.setOption("DisplayingFreshTips",_loc2_.target.selected);
         break;
      case "_btnResetTips":
         this.api.kernel.showMessage(undefined,this.api.lang.getText("DO_U_RESET_TIPS"),"CAUTION_YESNO",{name:"ResetTips",listener:this});
         break;
      case "_btnCensorshipFilter":
         this.api.kernel.OptionsManager.setOption("CensorshipFilter",_loc2_.target.selected);
         break;
      case "_btnAdvancedLineOfSight":
         this.api.kernel.OptionsManager.setOption("AdvancedLineOfSight",_loc2_.target.selected);
         break;
      case "_btnRemindTurnTime":
         this.api.kernel.OptionsManager.setOption("RemindTurnTime",_loc2_.target.selected);
         break;
      case "_btnHideSpellBar":
         this.api.kernel.OptionsManager.setOption("HideSpellBar",_loc2_.target.selected);
         break;
      case "_btnSeeAllSpell":
         this.api.kernel.OptionsManager.setOption("SeeAllSpell",!_loc2_.target.selected);
         break;
      case "_btnSpeakingItems":
         this.api.kernel.OptionsManager.setOption("UseSpeakingItems",_loc2_.target.selected);
         break;
      case "_btnConfirmDropItem":
         this.api.kernel.OptionsManager.setOption("ConfirmDropItem",_loc2_.target.selected);
         break;
      case "_btnChatTimestamp":
         this.api.kernel.OptionsManager.setOption("TimestampInChat",_loc2_.target.selected);
         this.api.kernel.ChatManager.refresh();
         break;
      case "_btnViewDicesDammages":
         this.api.kernel.OptionsManager.setOption("ViewDicesDammages",_loc2_.target.selected);
         break;
      case "_btnSkipFightAnimations":
         this.api.kernel.OptionsManager.setOption("SkipFightAnimations",_loc2_.target.selected);
         break;
      case "_btnSeeDamagesColor":
         this.api.kernel.OptionsManager.setOption("SeeDamagesColor",_loc2_.target.selected);
         break;
      case "_btnSkipLootPanel":
         this.api.kernel.OptionsManager.setOption("SkipLootPanel",_loc2_.target.selected);
         break;
      case "_btnClose":
      case "_btnClose2":
         this.callClose();
         break;
      case "_btnTabGeneral":
      case "_btnTabSound":
      case "_btnTabDisplay":
         this.setCurrentTab(_loc2_.target._name.substr(7));
   }
};
_loc1.optionChanged = function(_loc2_)
{
   switch(_loc2_.key)
   {
      case "Grid":
         this._mcTabViewer._btnGrid.selected = _loc2_.value;
         break;
      case "colorfulTactic":
         this._mcTabViewer._btnTacticColor.selected = _loc2_.value;
         break;
      case "Follower":
         this._mcTabViewer._btnFollower.selected = _loc2_.value;
         break;
      case "Transparency":
         this._mcTabViewer._btnTransparency.selected = _loc2_.value;
         break;
      case "NightMode":
         this._mcTabViewer._btnNoche.selected = _loc2_.value;
      case "SpriteInfos":
         this._mcTabViewer._btnSpriteInfos.selected = _loc2_.value;
         break;
      case "tactico":
         this._mcTabViewer._btnTactico.selected = _loc2_.value;
         break;
      case "omega":
         this._mcTabViewer._btnListonOmega.selected = _loc2_.value;
         break;
      case "SpriteMove":
         this._mcTabViewer._btnSpriteMove.selected = _loc2_.value;
         break;
      case "MapInfos":
         this._mcTabViewer._btnMapInfos.selected = _loc2_.value;
         break;
      case "AutoHideSmileys":
         this._mcTabViewer._btnAutoHideSmileys.selected = _loc2_.value;
         break;
      case "StringCourse":
         this._mcTabViewer._btnStringCourse.selected = _loc2_.value;
         break;
      case "PointsOverHead":
         this._mcTabViewer._btnPointsOverHead.selected = _loc2_.value;
         break;
      case "ChatEffects":
         this._mcTabViewer._btnChatEffects.selected = _loc2_.value;
         break;
      case "hideReset":
         this._mcTabViewer._btnReset.selected = _loc2_.value;
         break;
      case "ornamento":
         this._mcTabViewer._btnOrnamentos.selected = _loc2_.value;
         break;
      case "CreaturesMode":
         this._mcTabViewer._vsCreaturesMode.value = _loc2_.value;
         this._mcTabViewer._lblCreaturesModeValue.text = !!_global.isFinite(_loc2_.value) ? _loc2_.value : this.api.lang.getText("INFINIT");
         break;
      case "Buff":
         this._mcTabViewer._btnBuff.selected = _loc2_.value;
         break;
      case "GuildMessageSound":
         this._mcTabViewer._btnGuildMessageSound.selected = _loc2_.value;
         break;
      case "StartTurnSound":
         this._mcTabViewer._btnStartTurnSound.selected = _loc2_.value;
         break;
      case "BannerShortcuts":
         this._mcTabViewer._btnBannerShortcuts.selected = _loc2_.value;
         break;
      case "TipsOnStart":
         this._mcTabViewer._btnTipsOnStart.selected = _loc2_.value;
         break;
      case "DisplayStyle":
         this._mcTabViewer.selectDisplayStyle(_loc2_.value);
         break;
      case "RemasteredSpellIconsPack":
         var _loc4_ = 0;
         if(_loc2_.value == 3)
         {
            _loc4_ = 0;
         }
         else if(_loc2_.value == 2)
         {
            _loc4_ = 3;
         }
         this._mcTabViewer._cbSpellIconsPack.selectedIndex = _loc4_;
         var _loc8_ = this.gapi.getUIComponent("Banner");
         if(_loc8_ != undefined)
         {
            _loc8_.shortcuts.updateSpells();
         }
         var _loc5_ = this.gapi.getUIComponent("Spells");
         if(_loc5_ != undefined)
         {
            _loc5_.updateSpells();
            var _loc6_ = _loc5_.spellFullInfosViewer;
            if(_loc6_ != undefined)
            {
               _loc6_.updateData();
            }
         }
         var _loc7_ = this.gapi.getUIComponent("SpellViewerOnCreate");
         if(_loc7_ != undefined)
         {
            _loc7_.refreshSpellsPack();
            break;
         }
         break;
      case "MovableBar":
         this._mcTabViewer._btnMovableBar.selected = _loc2_.value;
         break;
      case "MovableBarSize":
         this._mcTabViewer._vsMovableBarSize.value = _loc2_.value;
         this._mcTabViewer._lblMovableBarSizeValue.text = _loc2_.value;
         break;
      case "ViewAllMonsterInGroup":
         this._mcTabViewer._btnViewAllMonsterInGroup.selected = _loc2_.value;
         break;
      case "CharacterPreview":
         this._mcTabViewer._btnCharacterPreview.selected = _loc2_.value;
         break;
      case "Aura":
         this._mcTabViewer._btnAura.selected = _loc2_.value;
         break;
      case "DisplayingFreshTips":
         this._mcTabViewer._btnTutorialTips.selected = _loc2_.value;
         break;
      case "CensorshipFilter":
         this._mcTabViewer._btnCensorshipFilter.selected = _loc2_.value;
         break;
      case "AskForWrongCraft":
         this._mcTabViewer._btnCraftWrongConfirm.selected = _loc2_.value;
         break;
      case "AdvancedLineOfSight":
         this._mcTabViewer._btnAdvancedLineOfSight.selected = _loc2_.value;
         break;
      case "RemindTurnTime":
         this._mcTabViewer._btnRemindTurnTime.selected = _loc2_.value;
         break;
      case "HideSpellBar":
         this._mcTabViewer._btnHideSpellBar.selected = _loc2_.value;
         break;
      case "SeeAllSpell":
         this._mcTabViewer._btnSeeAllSpell.selected = !_loc2_.value;
         break;
      case "UseSpeakingItems":
         this._mcTabViewer._btnSpeakingItems.selected = _loc2_.value;
         break;
      case "ConfirmDropItem":
         this._mcTabViewer._btnConfirmDropItem.selected = _loc2_.value;
         break;
      case "TimestampInChat":
         this._mcTabViewer._btnChatTimestamp.selected = _loc2_.value;
         this.api.kernel.ChatManager.refresh();
         break;
      case "AudioMusicVol":
         this._mcTabViewer._vsMusic.value = _loc2_.value;
         break;
      case "AudioEffectVol":
         this._mcTabViewer._vsSounds.value = _loc2_.value;
         break;
      case "AudioEnvVol":
         this._mcTabViewer._vsEnvironment.value = _loc2_.value;
         break;
      case "AudioMusicMute":
         this._mcTabViewer._btnMuteMusic.selected = _loc2_.value;
         break;
      case "AudioEffectMute":
         this._mcTabViewer._btnMuteSounds.selected = _loc2_.value;
         break;
      case "AudioEnvMute":
         this._mcTabViewer._btnMuteEnvironment.selected = _loc2_.value;
         break;
      case "SkipFightAnimations":
         this._mcTabViewer._btnSkipFightAnimations.selected = _loc2_.value;
         break;
      case "SkipLootPanel":
         this._mcTabViewer._btnSkipLootPanel.selected = _loc2_.value;
   }
};
_loc1.itemSelected = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_cbDisplayStyle":
         var _loc6_ = _loc2_.target.selectedItem;
         if(_loc6_.style == "normal")
         {
            this.api.kernel.OptionsManager.setOption("DisplayStyle",_loc6_.style);
         }
         else
         {
            this.api.kernel.showMessage(this.api.lang.getText("OPTIONS_DISPLAY"),this.api.lang.getText("DO_U_CHANGE_DISPLAYSTYLE"),"CAUTION_YESNO",{name:"Display",listener:this,params:{style:_loc6_.style}});
         }
         break;
      case "_cbDefaultQuality":
         var _loc8_ = _loc2_.target.selectedItem;
         this.api.kernel.showMessage(this.api.lang.getText("OPTIONS_DISPLAY"),this.api.lang.getText("DO_U_CHANGE_QUALITY_" + String(_loc8_.quality).toUpperCase()),"CAUTION_YESNO",{name:"Quality",listener:this,params:{quality:_loc8_.quality}});
         break;
      case "_cbSpellIconsPack":
         var _loc4_ = _loc2_.target.selectedItem;
         var _loc2_ = _loc4_.frame;
         var _loc3_ = this.api.kernel.OptionsManager.getOption("RemasteredSpellIconsPack");
         if(_loc3_ == _loc2_)
         {
            break;
         }
         this.api.kernel.OptionsManager.setOption("RemasteredSpellIconsPack",_loc2_);
         this.selectRemasteredSpellIconsPack(_loc2_);
         var _loc11_ = this.gapi.getUIComponent("Banner");
         if(_loc11_ != undefined)
         {
            _loc11_.shortcuts.updateSpells();
         }
         var _loc5_ = this.gapi.getUIComponent("Spells");
         if(_loc5_ != undefined)
         {
            _loc5_.updateSpells();
            var _loc9_ = _loc5_.spellFullInfosViewer;
            if(_loc9_ != undefined)
            {
               _loc9_.updateData();
            }
         }
         var _loc10_ = this.gapi.getUIComponent("SpellViewerOnCreate");
         if(_loc10_ != undefined)
         {
            _loc10_.refreshSpellsPack();
            break;
         }
         break;
      case "_cbRemasteredClipsHD":
         _loc4_ = _loc2_.target.selectedItem;
         _loc2_ = _loc4_.value;
         _loc3_ = this.api.kernel.OptionsManager.getOption("RemasteredClipsHD");
         if(_loc3_ == _loc2_)
         {
            break;
         }
         this.api.kernel.OptionsManager.setOption("RemasteredClipsHD",_loc2_);
         selectRemasteredClipsHD(_loc2_);
         break;
   }
};
_loc1.selectRemasteredClipsHD = function(_loc2_)
{
   this.api.kernel.showMessage(undefined,"test","INFO_CHAT");
   switch(_loc2_)
   {
      case "classic":
         dofus.Constants.GFX_ROOT_PATH = dofus.Constants.CLIPS_PATH + "gfx/";
         break;
      case "remastered":
         dofus.Constants.GFX_ROOT_PATH = dofus.Constants.CLIPS_PATH + "gfx_remastered/";
   }
   this._mcTabViewer._cbRemasteredClipsHD.selectedIndex = _loc2_ != "classic" ? 2 : 1;
};
