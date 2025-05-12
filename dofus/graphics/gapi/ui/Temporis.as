if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].gapi)
{
   _global.dofus["\r\x14"].gapi = new Object();
}
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
_global.dofus["\r\x14"].gapi.ui.Temporis = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Temporis.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Temporis.prototype;
_loc1.__set__currentTemp = function(sData)
{
   this._cantidadActual = sData;
};
_loc1.__set__exoticChallenge = function(sData)
{
   this._sExotics = sData;
};
_loc1.__set__normalChallenge = function(sData)
{
   this._sChallenge = sData;
};
_loc1.setCurrentTab = function(_loc2_)
{
   if(_loc2_ != undefined)
   {
      var _loc3_ = this["_btnTab" + this._sCurrentTab];
      var _loc4_ = this["_btnTab" + _loc2_];
      _loc3_.selected = true;
      _loc3_.enabled = true;
      _loc4_.selected = false;
      _loc4_.enabled = false;
      this._sCurrentTab = _loc2_;
      this.selectTab(this["_btnTab" + _loc2_]);
   }
   else
   {
      var _loc2_ = this["_btnTab" + this._sCurrentTab];
      _loc2_.selected = false;
      _loc2_.enabled = false;
      this.selectTab(_loc2_);
      this.setIconChallenge();
   }
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Temporis.CLASS_NAME);
};
_loc1.destroy = function()
{
   this.gapi.hideTooltip();
};
_loc1.callClose = function()
{
   this.api.ui.unloadUIComponent("Temporis");
   return true;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.asignarMobs});
   this.addToQueue({object:this,method:this.setCurrentTab,params:[this._sCurrentTab]});
   this.addToQueue({object:this,method:this.initTexts});
   if(this._nCurrentFrame == undefined)
   {
      this._nCurrentFrame = 1;
   }
};
_loc1.asignarMobs = function()
{
   var _loc4_ = this._sChallenge.split("|");
   var _loc5_ = this._sExotics.split("|");
   var _loc9_ = 0;
   for(_loc9_ in _loc4_)
   {
      var _loc3_ = _loc4_[_loc9_].split(",")[0];
      var _loc2_ = _loc4_[_loc9_].split(",")[1];
      var _loc6_ = _loc4_[_loc9_].split(",")[2];
      var _loc7_ = new dofus["\r\x14"].gapi.ui.temporis.TemporisChallengeMonster(_loc3_,_loc2_,_loc6_);
      this._aChallenge.push(_loc7_);
   }
   this._aChallenge.reverse();
   var _loc10_ = 0;
   for(_loc10_ in _loc5_)
   {
      _loc3_ = _loc5_[_loc10_].split(",")[0];
      _loc2_ = _loc5_[_loc10_].split(",")[1];
      _loc6_ = _loc5_[_loc10_].split(",")[2];
      var _loc8_ = new dofus["\r\x14"].gapi.ui.temporis.TemporisChallengeExotic(_loc3_,_loc2_,idNextQuest);
      this._aExotics.push(_loc8_);
   }
   this._aExotics.reverse();
};
_loc1.addListeners = function()
{
   this._btnTabGeneral.addEventListener("click",this);
   this._btnTabGeneral.addEventListener("over",this);
   this._btnTabGeneral.addEventListener("out",this);
   this._btnTabDrop.addEventListener("click",this);
   this._btnTabDrop.addEventListener("over",this);
   this._btnTabDrop.addEventListener("out",this);
   this._btnTabChallenge.addEventListener("click",this);
   this._btnTabChallenge.addEventListener("over",this);
   this._btnTabChallenge.addEventListener("out",this);
   this._btnTabDofus.addEventListener("click",this);
   this._btnTabDofus.addEventListener("over",this);
   this._btnTabDofus.addEventListener("out",this);
   this._btnClose.addEventListener("click",this);
};
_loc1.initData = function()
{
   this._lblMin.text = "" + this._cantidadActual;
   this._lblMax.text = "/ " + this._nTempotonsMax;
   this._lblPassive.text = this.api.lang.getText("TEMPORIS_PASSIVE");
   this._lblNose.text = this.api.lang.getText("TEMPORIS_BIENVENU");
   this._lblBonusContent.text = this.api.lang.getText("TEMPORIS_INFO_BONUS_CONTENT");
   this._lblDiscover.text = this.api.lang.getText("TEMPORIS_INFO_DISCOVER");
   this._lblWelcome.text = this.api.lang.getText("TEMPORIS_INFO_WELCOME");
   this._lblIop.text = this.api.lang.getText("TEMPORIS_INFO_IOP");
   this._lblGlouton.text = this.api.lang.getText("TEMPORIS_INFO_GLOUTON");
   this.objevivos.text = this.api.lang.getText("TEMPORIS_INFO_REWARDS");
   this._lblTempotons.text = this.api.lang.getText("TEMPOTONS") + " :";
   this._lblPassiveInfo.text = this.api.lang.getText("TEMPORIS_INFO_PASSIVE_INFO");
   this._lblDropInfo1.text = this.api.lang.getText("TEMPORIS_INFO_DROP_INFO1");
   this._lblDropInfo2.text = this.api.lang.getText("TEMPORIS_INFO_DROP_INFO2");
   this._lblDropInfo3.text = this.api.lang.getText("TEMPORIS_INFO_DROP_INFO3");
   this._lblDropInfo4.text = this.api.lang.getText("TEMPORIS_INFO_DROP_INFO44");
   this._lblDropInfo5.text = this.api.lang.getText("TEMPORIS_INFO_DROP_INFO5");
   this._lblDropInfo6.text = this.api.lang.getText("TEMPORIS_INFO_DROP_INFO6");
   this._lblStep.text = this.api.lang.getText("STEP");
   this["\x19\x02\x13"].text = this.api.lang.getText("LEVEL_SMALL");
   this._lblChallengeClassic.text = this.api.lang.getText("TEMPORIS_CHALLENGE_CLASSIC");
   this._lblChallengeExotic.text = this.api.lang.getText("TEMPORIS_CHALLENGE_EXOTIC");
   this._btnTabGeneral.label = this.api.lang.getText("TEMPORIS_OPTIONS_GENERAL");
   this._btnTabDrop.label = this.api.lang.getText("TEMPORIS_OPTIONS_DROP");
   this._btnTabChallenge.label = this.api.lang.getText("TEMPORIS_OPTIONS_CHALLENGE");
   this._btnTabDofus.label = this.api.lang.getText("TEMPORIS_OPTIONS_DOFUS");
   this._btnChallengeLevelLow.label = this.api.lang.getText("LEVEL_SMALL") + " 1 - 100";
   this._btnChallengeLevelHigh.label = this.api.lang.getText("LEVEL_SMALL") + " 101 - 160";
   this._btnChallengeLevelUltimate.label = this.api.lang.getText("LEVEL_SMALL") + " 161 - 200";
   this._lblDofusInfo.text = this.api.lang.getText("TEMPORIS_INFO_DOFUS");
   this._lblDofusEma1.text = "• " + this.api.lang.getText("TEMPORIS_EM1");
   this._lblDofusP1.text = "• " + this.api.lang.getText("TEMPORIS_P1");
   this._lblDofusT1.text = "• " + this.api.lang.getText("TEMPORIS_T1");
   this._lblDofusC1.text = "• " + this.api.lang.getText("TEMPORIS_C1");
   this._lblDofusV1.text = "• " + this.api.lang.getText("TEMPORIS_V1");
   this._lblDofusO1.text = "• " + this.api.lang.getText("TEMPORIS_O1");
   this._lblDofusI1.text = "• " + this.api.lang.getText("TEMPORIS_I1");
   this._lblDofusEb1.text = "• " + this.api.lang.getText("TEMPORIS_EB1");
   this._lblDofusEma2.text = "• " + this.api.lang.getText("TEMPORIS_EM2");
   this._lblDofusP2.text = "• " + this.api.lang.getText("TEMPORIS_P2");
   this._lblDofusT2.text = "• " + this.api.lang.getText("TEMPORIS_T2");
   this._lblDofusC2.text = "• " + this.api.lang.getText("TEMPORIS_C2");
   this._lblDofusV2.text = "• " + this.api.lang.getText("TEMPORIS_V2");
   this._lblDofusO2.text = "• " + this.api.lang.getText("TEMPORIS_O2");
   this._lblDofusI2.text = "• " + this.api.lang.getText("TEMPORIS_I2");
   this._lblDofusEb2.text = "• " + this.api.lang.getText("TEMPORIS_EB2");
   this._lblDofusEma3.text = "• " + this.api.lang.getText("TEMPORIS_EM3");
   this._lblDofusP3.text = "• " + this.api.lang.getText("TEMPORIS_P3");
   this._lblDofusT3.text = "• " + this.api.lang.getText("TEMPORIS_T3");
   this._lblDofusC3.text = "• " + this.api.lang.getText("TEMPORIS_C3");
   this._lblDofusV3.text = "• " + this.api.lang.getText("TEMPORIS_V3");
   this._lblDofusO3.text = "• " + this.api.lang.getText("TEMPORIS_O3");
   this._lblDofusI3.text = "• " + this.api.lang.getText("TEMPORIS_I3");
   this._lblDofusEb3.text = "• " + this.api.lang.getText("TEMPORIS_EB3");
};
_loc1.initTexts = function()
{
   this.api.network.Quests.getList();
   this._pbTempotons.minimum = 0;
   this._pbTempotons.maximum = this._nTempotonsMax;
   this._pbTempotons.value = this._cantidadActual;
};
_loc1.selectTab = function(_loc2_, _loc3_)
{
   this.gotoAndStop("challengeLow");
   this._mcExoticChallenge.gotoAndStop(this._nCurrentFrame);
   this.addToQueue({object:this,method:this.switchToChallengeTab});
};
_loc1.switchToGeneralTab = function()
{
   this.initData();
   this._pbTempotons.minimum = 0;
   this._pbTempotons.maximum = this._nTempotonsMax;
   this._pbTempotons.value = this._cantidadActual;
   this._mcPassiveMask._visible = false;
   var nTempotonsPourcent = Math.floor(this._pbTempotons.value * 100 / this._nTempotonsMax);
   this._mcTempotons.onRollOver = function()
   {
      this._parent.gapi.showTooltip(nTempotonsPourcent + "%",this,-10);
   };
   this._mcTempotons.onRollOut = function()
   {
      this._parent.gapi.hideTooltip();
   };
   this._ldrFeca.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "1.swf";
   this._ldrOsamodas.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "2.swf";
   this._ldrEnutrof.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "3.swf";
   this._ldrSram.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "4.swf";
   this._ldrXelor.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "5.swf";
   this._ldrEcaflip.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "6.swf";
   this._ldrEniripsa.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "7.swf";
   this._ldrIop.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "8.swf";
   this._ldrCra.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "9.swf";
   this._ldrSadida.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "10.swf";
   this._ldrSacrieur.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "11.swf";
   this._ldrPandawa.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + "12.swf";
   this._ldrFeca.addEventListener("over",this);
   this._ldrFeca.addEventListener("out",this);
   this._ldrOsamodas.addEventListener("over",this);
   this._ldrOsamodas.addEventListener("out",this);
   this._ldrEnutrof.addEventListener("over",this);
   this._ldrEnutrof.addEventListener("out",this);
   this._ldrSram.addEventListener("over",this);
   this._ldrSram.addEventListener("out",this);
   this._ldrEcaflip.addEventListener("over",this);
   this._ldrEcaflip.addEventListener("out",this);
   this._ldrXelor.addEventListener("over",this);
   this._ldrXelor.addEventListener("out",this);
   this._ldrEniripsa.addEventListener("over",this);
   this._ldrEniripsa.addEventListener("out",this);
   this._ldrIop.addEventListener("over",this);
   this._ldrIop.addEventListener("out",this);
   this._ldrCra.addEventListener("over",this);
   this._ldrCra.addEventListener("out",this);
   this._ldrSadida.addEventListener("over",this);
   this._ldrSadida.addEventListener("out",this);
   this._ldrSacrieur.addEventListener("over",this);
   this._ldrSacrieur.addEventListener("out",this);
   this._ldrPandawa.addEventListener("over",this);
   this._ldrPandawa.addEventListener("out",this);
   this._ldrObvijevan.contentPath = dofus.Constants.ITEMS_PATH + "117/15.swf";
   this._ldrGlouton.contentPath = dofus.Constants.ITEMS_PATH + "18/66.swf";
   this._ldrTempoton.contentPath = dofus.Constants.ITEMS_PATH + "24/823.swf";
   this._ldrDieuIop.contentPath = dofus.Constants.GUILDS_BIG_PATH + "9276.swf";
};
_loc1.switchToDropTab = function()
{
   if(this._currentStateListener)
   {
      this.removeListenersPassive();
   }
   this.initData();
   this._btnNextStep.addEventListener("click",this);
   this._btnPreviousStep.addEventListener("click",this);
};
_loc1.switchToChallengeTab = function()
{
   if(this._currentStateListener)
   {
      this.removeListenersPassive();
   }
   this.initData();
   this._btnChallengeLevelLow.addEventListener("click",this);
   this._btnChallengeLevelLow.addEventListener("over",this);
   this._btnChallengeLevelLow.addEventListener("out",this);
   this._btnChallengeLevelHigh.addEventListener("click",this);
   this._btnChallengeLevelHigh.addEventListener("over",this);
   this._btnChallengeLevelHigh.addEventListener("out",this);
   this._btnChallengeLevelUltimate.addEventListener("click",this);
   this._btnChallengeLevelUltimate.addEventListener("over",this);
   this._btnChallengeLevelUltimate.addEventListener("out",this);
   this._btnChallengeLevelLow.selected = false;
   this._btnChallengeLevelHigh.selected = true;
   this._btnChallengeLevelUltimate.selected = true;
   this._btnNextStep.addEventListener("click",this);
   this._btnPreviousStep.addEventListener("click",this);
   this.setIconChallenge();
};
_loc1.switchToChallengeLowTab = function()
{
   this.setIconChallenge();
};
_loc1.switchToChallengeHighTab = function()
{
   this.setIconChallenge();
};
_loc1.switchToDofusTab = function()
{
   if(this._currentStateListener)
   {
      this.removeListenersPassive();
   }
   this._btnNextStep.addEventListener("click",this);
   this._btnPreviousStep.addEventListener("click",this);
   this.initData();
   this.updateLabelsAlpha();
   this.updateDofusColors();
};
_loc1.removeListenersPassive = function()
{
   this._ldrFeca.addEventListener("over",this);
   this._ldrFeca.addEventListener("out",this);
   this._ldrOsamodas.addEventListener("over",this);
   this._ldrOsamodas.addEventListener("out",this);
   this._ldrEnutrof.addEventListener("over",this);
   this._ldrEnutrof.addEventListener("out",this);
   this._ldrSram.addEventListener("over",this);
   this._ldrSram.addEventListener("out",this);
   this._ldrEcaflip.addEventListener("over",this);
   this._ldrEcaflip.addEventListener("out",this);
   this._ldrXelor.addEventListener("over",this);
   this._ldrXelor.addEventListener("out",this);
   this._ldrEniripsa.addEventListener("over",this);
   this._ldrEniripsa.addEventListener("out",this);
   this._ldrIop.addEventListener("over",this);
   this._ldrIop.addEventListener("out",this);
   this._ldrCra.addEventListener("over",this);
   this._ldrCra.addEventListener("out",this);
   this._ldrSadida.addEventListener("over",this);
   this._ldrSadida.addEventListener("out",this);
   this._ldrSacrieur.addEventListener("over",this);
   this._ldrSacrieur.addEventListener("out",this);
   this._ldrPandawa.addEventListener("over",this);
   this._ldrPandawa.addEventListener("out",this);
   this._currentStateListener = true;
};
_loc1.setClass = function(_loc2_)
{
   this._mcPassiveMask._visible = true;
   this._mcPassiveMask._ldrPassiveClassIcon.contentPath = dofus.Constants.BREEDS_BACK_PATH + _loc2_ + ".swf";
   var _loc2_ = this.api.lang.getClassText(_loc2_);
   this._mcPassiveMask._lblPassiveClass.text = this.api.lang.getText("PASSIVE_BREED_" + _loc2_);
   this._mcPassiveMask._lblPassiveName.text = _loc2_.pt;
   this._mcPassiveMask._lblPassiveInfo.text = _loc2_.pd;
};
_loc1.setIconChallenge = function()
{
   var _loc5_ = 0;
   while(_loc5_ < this._aExotics.length)
   {
      var _loc6_ = this._aExotics[_loc5_];
      var _loc2_ = this._mcExoticChallenge["_mcExotic" + (_loc5_ + 1)];
      if(_loc2_ != undefined)
      {
         var _loc15_ = _loc2_._ldrChallenge;
         var _loc10_ = _loc2_._mcWhite;
         _loc10_._visible = false;
         _loc15_.contentPath = dofus.Constants.ITEMS_PATH + 118 + "/" + _loc6_.objectGfxId + ".swf";
         var _loc11_ = this.getQuestById(_loc6_.questId);
         if(!this.isQuestFinished(_loc6_.previousQuestId))
         {
            _loc10_._visible = true;
         }
         _loc2_.challengeIsValid._visible = _loc11_ != undefined && _loc11_.isFinished;
         var oApi = this.api;
         var _loc14_ = oApi.lang.getQuestText(_loc6_.questId);
         if(_loc14_ == undefined)
         {
            _loc2_.onRollOver = function()
            {
               oApi.ui.showTooltip("UNDEFINED",this,-20);
            };
            _loc2_.onRollOut = function()
            {
               oApi.ui.hideTooltip();
            };
         }
         else
         {
            _loc2_.questName = _loc14_;
            _loc2_.onRollOver = function()
            {
               oApi.ui.showTooltip(this.questName,this,-20);
            };
            _loc2_.onRollOut = function()
            {
               oApi.ui.hideTooltip();
            };
         }
      }
      _loc5_ += 1;
   }
   var _loc4_ = 0;
   while(_loc4_ < this._aChallenge.length)
   {
      var _loc7_ = this._aChallenge[_loc4_];
      var _loc3_ = this["_mcClassic" + (_loc4_ + 1)];
      if(_loc3_ != undefined)
      {
         var _loc12_ = _loc3_._ldrChallengeMonsterArtwork;
         var _loc13_ = _loc3_._mcWhite;
         _loc12_.addEventListener("initialization",this);
         _loc13_._visible = false;
         _loc12_.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + _loc7_.monsterId + ".swf";
         if(!this.isQuestFinished(_loc7_.previousQuestId))
         {
            _loc13_._visible = true;
         }
         var _loc8_ = this.getQuestById(_loc7_.questId);
         _loc3_.challengeIsValid._visible = _loc8_ != undefined && _loc8_.isFinished;
         var oApi = this.api;
         var _loc9_ = oApi.lang.getQuestText(_loc7_.questId);
         if(_loc9_ == undefined)
         {
            _loc3_.onRollOver = function()
            {
               this._parent.gapi.showTooltip("UNDEFINED",this,-20);
            };
            _loc3_.onRollOut = function()
            {
               this._parent.gapi.hideTooltip();
            };
         }
         else
         {
            _loc3_.questName = _loc9_;
            _loc3_.onRollOver = function()
            {
               oApi.ui.showTooltip(this.questName,this,-20);
            };
            _loc3_.onRollOut = function()
            {
               oApi.ui.hideTooltip();
            };
         }
      }
      _loc4_ += 1;
   }
};
_loc1.initialization = function(_loc2_)
{
   var _loc3_ = _loc2_.target;
   var _loc1_ = _loc3_.content;
   var _loc2_ = _loc1_._mcMask;
   _loc1_._x = - _loc2_._x;
   _loc1_._y = - _loc2_._y;
   _loc1_._y += 60;
   _loc3_._xscale = 4000 / _loc2_._xscale;
   _loc3_._yscale = 4000 / _loc2_._yscale;
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._ldrFeca:
         this.setClass(1);
         break;
      case this._ldrOsamodas:
         this.setClass(2);
         break;
      case this._ldrEnutrof:
         this.setClass(3);
         break;
      case this._ldrSram:
         this.setClass(4);
         break;
      case this._ldrXelor:
         this.setClass(5);
         break;
      case this._ldrEcaflip:
         this.setClass(6);
         break;
      case this._ldrEniripsa:
         this.setClass(7);
         break;
      case this._ldrIop:
         this.setClass(8);
         break;
      case this._ldrCra:
         this.setClass(9);
         break;
      case this._ldrSadida:
         this.setClass(10);
         break;
      case this._ldrSacrieur:
         this.setClass(11);
         break;
      case this._ldrPandawa:
         this.setClass(12);
   }
};
_loc1.switchToChallengeUltimateTab = function()
{
   this.setIconChallenge();
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnChallengeLevelLow:
         this.gotoAndStop("challengeLow");
         this.addToQueue({object:this,method:this.switchToChallengeLowTab});
         this._mcExoticChallenge.gotoAndStop(this._nCurrentFrame);
         this._btnChallengeLevelLow.selected = false;
         this._btnChallengeLevelHigh.selected = true;
         this._btnChallengeLevelUltimate.selected = true;
         break;
      case this._btnChallengeLevelHigh:
         this.gotoAndStop("challengeHigh");
         this.addToQueue({object:this,method:this.switchToChallengeHighTab});
         this._btnChallengeLevelHigh.selected = false;
         this._btnChallengeLevelLow.selected = true;
         this._btnChallengeLevelUltimate.selected = true;
         break;
      case this._btnChallengeLevelUltimate:
         this.gotoAndStop("challengeUltimate");
         this.addToQueue({object:this,method:this.switchToChallengeUltimateTab});
         this._btnChallengeLevelHigh.selected = true;
         this._btnChallengeLevelLow.selected = true;
         this._btnChallengeLevelUltimate.selected = false;
         break;
      case this._btnClose:
         this.callClose();
         break;
      case this._btnTabDrop:
      case this._btnTabChallenge:
         this.setCurrentTab(_loc2_.target._name.substr(7));
         break;
      case this._btnPreviousStep:
         if(this._nCurrentFrame > 1)
         {
            this._nCurrentFrame -= 1;
            this._mcExoticChallenge.gotoAndStop(this._nCurrentFrame);
            this.addToQueue({object:this,method:this.setIconChallenge});
         }
         break;
      case this._btnNextStep:
         if(this._nCurrentFrame < 8)
         {
            this._nCurrentFrame += 1;
            this._mcExoticChallenge.gotoAndStop(this._nCurrentFrame);
            this.addToQueue({object:this,method:this.setIconChallenge});
         }
         break;
      case this._btnTabGeneral:
      case this._btnTabDofus:
         this.setCurrentTab(_loc2_.target._name.substr(7));
   }
};
_loc1.out = function(_loc2_)
{
   this._mcPassiveMask._visible = false;
   this.gapi.hideTooltip();
   var _loc2_ = _loc2_.target;
};
_loc1.setQuestTemporis = function(aQuests)
{
   this._aQuests = aQuests;
};
_loc1.updateLabelsAlpha = function()
{
   this.updateLabelAlpha(this._lblDofusC1,620);
   this.updateLabelAlpha(this._lblDofusEma1,623);
   this.updateLabelAlpha(this._lblDofusP1,637);
   this.updateLabelAlpha(this._lblDofusT1,625);
   this.updateLabelAlpha(this._lblDofusEb1,650);
   this.updateLabelAlpha(this._lblDofusI1,649);
   this.updateLabelAlpha(this._lblDofusV1,635);
   this.updateLabelAlpha(this._lblDofusO1,648);
   this.updateLabelAlpha(this._lblDofusC2,718);
   this.updateLabelAlpha(this._lblDofusEma2,721);
   this.updateLabelAlpha(this._lblDofusP2,735);
   this.updateLabelAlpha(this._lblDofusT2,723);
   this.updateLabelAlpha(this._lblDofusEb2,747);
   this.updateLabelAlpha(this._lblDofusI2,746);
   this.updateLabelAlpha(this._lblDofusV2,733);
   this.updateLabelAlpha(this._lblDofusO2,748);
   this.updateLabelAlpha(this._lblDofusC3,758);
   this.updateLabelAlpha(this._lblDofusEma3,761);
   this.updateLabelAlpha(this._lblDofusP3,767);
   this.updateLabelAlpha(this._lblDofusT3,765);
   this.updateLabelAlpha(this._lblDofusEb3,771);
   this.updateLabelAlpha(this._lblDofusI3,772);
   this.updateLabelAlpha(this._lblDofusV3,768);
   this.updateLabelAlpha(this._lblDofusO3,773);
};
_loc1.updateDofusColors = function()
{
   this.updateDofusColor(this._ldrCawotte,758);
   this.updateDofusColor(this._ldrEmeraude,761);
   this.updateDofusColor(this._ldrPourpre,767);
   this.updateDofusColor(this._ldrTurquoise,765);
   this.updateDofusColor(this._ldrEbene,771);
   this.updateDofusColor(this._ldrIvoire,772);
   this.updateDofusColor(this._ldrVulbis,768);
   this.updateDofusColor(this._ldrOcre,773);
};
_loc1.updateLabelAlpha = function(label, nQuestId)
{
   if(this.isQuestFinished(nQuestId))
   {
      label._alpha = dofus["\r\x14"].gapi.ui.Temporis.ALPHA_QUEST_FINISHED;
   }
};
_loc1.updateDofusColor = function(loader, nQuestId)
{
   if(!this.isQuestFinished(nQuestId))
   {
      loader.contentPath += "Gray";
   }
};
_loc1.getQuestById = function(nQuestId)
{
   var _loc4_ = this._aQuests;
   if(_loc4_ == undefined)
   {
      return undefined;
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      var _loc3_ = _loc4_[_loc2_];
      if(_loc3_.id == nQuestId)
      {
         return _loc3_;
      }
      _loc2_ += 1;
   }
   return undefined;
};
_loc1.isQuestFinished = function(nQuestId)
{
   var _loc2_ = this.getQuestById(nQuestId);
   if(_loc2_ == undefined)
   {
      return false;
   }
   return _loc2_.isFinished;
};
_loc1.itemRollOver = function(_loc2_)
{
   var _loc1_ = _loc2_.target;
};
_loc1.itemRollOut = function(_loc2_)
{
   this.out();
};
_loc1.addProperty("temporichas",function()
{
}
,_loc1.__set__currentTemp);
_loc1.addProperty("exoticchallenge",function()
{
}
,_loc1.__set__exoticChallenge);
_loc1.addProperty("normalchallenge",function()
{
}
,_loc1.__set__normalChallenge);
_global.dofus["\r\x14"].gapi.ui.Temporis.CLASS_NAME = "Quests";
_global.dofus["\r\x14"].gapi.ui.Tempori.ALPHA_QUEST_FINISHED = 50;
_global.dofus["\r\x14"].gapi.ui.Temporis.ALPHA_QUEST_TO_DO = 100;
_loc1._aChallenge = new Array();
_loc1._aExotics = new Array();
_loc1._sChallenge = "";
_loc1._sExotics = "";
_loc1._nTempotonsMax = 9370;
_loc1._nTempotonsID = 12001;
_loc1._cantidadActual = 0;
_loc1._sCurrentTab = "Challenge";
_loc1._currentStateListener = false;
ASSetPropFlags(_loc1,null,1);
