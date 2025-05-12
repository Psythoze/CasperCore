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
_global.dofus["\r\x14"].gapi.ui.GameResultLight = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.GameResultLight.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.ui.GameResultLight.prototype;
_loc1.__set__data = function(_loc2_)
{
   this._oData = _loc2_;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.GameResultLight.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initText});
};
_loc1.addListeners = function()
{
   this._sdStars.addEventListener("over",this);
   this._sdStars.addEventListener("out",this);
   this._btnMaximize.addEventListener("click",this);
   this._btnCross.addEventListener("click",this);
   this._mcRollOver.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._mcRollOver.onRollOut = function()
   {
      this._parent.out({target:this});
   };
};
_loc1.initText = function()
{
   this._winBackground.title = this.api.lang.getText("GAME_RESULTS");
   this._lblBonus.text = this.api.lang.getText("GAME_RESULTS_BONUS") + " :";
   this._sdStars.value = this.api.datacenter.Basics.aks_game_end_bonus;
   if(this._oData.challenges && this._oData.challenges.length)
   {
      this._lblChallenges._visible = true;
      this._lblChallenges.text = this.api.lang.getText("FIGHT_CHALLENGE_BONUS") + " :";
   }
};
_loc1.initData = function()
{
   switch(this._oData.fightType)
   {
      case 0:
         var _loc6_ = "UI_GameResultTeamLight";
         break;
      case 1:
         _loc6_ = "UI_GameResultTeamLightPVP";
   }
   this.attachMovie(_loc6_,"_tCurrentPlayer",10,{dataProvider:this._oData.currentPlayerInfos});
   if(this._oData.challenges && this._oData.challenges.length)
   {
      this._lblChallenges._y = this._lblBonus._y + 17;
      this._mcChallengesPlacer._y = this._lblBonus._y + 18;
      var _loc2_ = 0;
      while(_loc2_ < this._oData.challenges.length)
      {
         var _loc3_ = this.attachMovie("FightChallengeIcon","fci" + _loc2_,this.getNextHighestDepth(),{challenge:this._oData.challenges[_loc2_],displayUiOnClick:false});
         _loc0_ = _loc0_ = 17;
         _loc3_._height = _loc0_;
         _loc3_._width = _loc0_;
         _loc3_._x = _loc2_ * (_loc3_._width + 5) + this._mcChallengesPlacer._x - _loc2_ * 43;
         _loc3_._y = this._mcChallengesPlacer._y;
         _loc2_ += 1;
      }
   }
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnCross:
         this.callClose();
         break;
      case this._btnMaximize:
         this.api.ui.loadUIComponent("GameResult","GameResult",{data:this._oData},{bAlwaysOnTop:true});
         this.api.kernel.OptionsManager.setOption("UseLightEndFightUI",false);
         this.callClose();
   }
};
_loc1.over = function(_loc2_)
{
   if(_loc2_.target == this._sdStars)
   {
      this.gapi.showTooltip(this.api.lang.getText("GAME_RESULTS_BONUS_TOOLTIP",[this._sdStars.value]),this._sdStars,-20);
   }
   else
   {
      this.gapi.showTooltip(this.api.lang.getText("TURNS_NUMBER") + " : " + this._oData.currentTableTurn + "\n" + this.api.lang.getText("DURATION") + " : " + this.api.kernel.GameManager.getDurationString(this._oData.duration,true),this._mcRollOver,-20);
   }
};
_loc1.out = function(_loc2_)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
ASSetPropFlags(_loc1,null,1);
_loc1._oData = "";
_global.dofus["\r\x14"].gapi.ui.GameResultLight.CLASS_NAME = "GameResultLight";
