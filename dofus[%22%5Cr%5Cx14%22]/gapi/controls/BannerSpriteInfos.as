var _loc1 = dofus["\r\x14"].gapi.controls.BannerSpriteInfos.prototype;
_loc1.addListeners = function()
{
   this._ldrSprite.addEventListener("initialization",this);
   var _loc2_ = 1;
   while(_loc2_ <= 9)
   {
      var _loc3_ = this["_ldrState" + _loc2_];
      _loc3_.addEventListener("initialization",this);
      _loc2_ += 1;
   }
   this._ldrSprite.addEventListener("complete",this);
};
_loc1.initTexts = function()
{
   this._lblRes.text = this.api.lang.getText("RESISTANCES");
   this._lblStates.text = this.api.lang.getText("STATES");
};
_loc1.updateStates = function()
{
   var _loc2_ = 1;
   while(_loc2_ <= 9)
   {
      var _loc4_ = this["_ldrState" + _loc2_];
      _loc4_.content._mcState.removeMovieClip();
      _loc2_ += 1;
   }
   var _loc6_ = this._oSprite.states;
   if(_loc6_ != undefined)
   {
      var _loc3_ = 0;
      for(var _loc7_ in _loc6_)
      {
         if(_loc6_[_loc7_] == true)
         {
            _loc3_ += 1;
            var _loc5_ = this["_ldrState" + _loc3_];
            this.setStateOnLoader(_loc5_,Number(_loc7_));
         }
      }
   }
};
_loc1.initialization = function(_loc2_)
{
   var _loc2_ = _loc2_.target;
   var _loc4_ = _loc2_.content;
   if(_loc2_ == this._ldrSprite)
   {
      var _loc3_ = _loc4_._mcMask;
      _loc4_._x = - _loc3_._x;
      _loc4_._y = - _loc3_._y;
      this._ldrSprite._xscale = 10000 / _loc3_._xscale;
      this._ldrSprite._yscale = 10000 / _loc3_._yscale;
   }
   else if(_loc2_.tempVars)
   {
      this.setStateOnLoader(_loc2_,_loc2_.tempVars.fightStateToPut);
   }
};
_loc1.setStateOnLoader = function(_loc2_, _loc3_)
{
   if(_loc2_.loaded)
   {
      delete register2.tempVars;
      var _loc2_ = "State_" + _loc3_;
      var _loc4_ = _loc2_.content.attachMovie(_loc2_,_mcState,_loc2_.content.getNextHighestDepth());
   }
   else
   {
      _loc2_.tempVars = {fightStateToPut:_loc3_};
   }
};
_loc1.initData = function()
{
   this._lblName.text = this._oSprite.name;
   this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + this._oSprite.Level;
   this._lblLP.text = !_global.isNaN(this._oSprite.LP) ? this._oSprite.LP : "";
   this._lblAP.text = !_global.isNaN(this._oSprite.AP) ? String(Math.max(0,this._oSprite.AP)) : "";
   this._lblMP.text = !_global.isNaN(this._oSprite.MP) ? String(Math.max(0,this._oSprite.MP)) : "";
   this._lblAverageDamages.text = this._oSprite.averageDamages;
   this._ldrSprite.contentPath = this._oSprite.artworkFile;
   var _loc5_ = this._oSprite.Resistencias;
   this._lblNeutral.text = _loc5_[0] != undefined ? _loc5_[0] + "%" : "0%";
   this._lblEarth.text = _loc5_[1] != undefined ? _loc5_[1] + "%" : "0%";
   this._lblFire.text = _loc5_[2] != undefined ? _loc5_[2] + "%" : "0%";
   this._lblWater.text = _loc5_[3] != undefined ? _loc5_[3] + "%" : "0%";
   this._lblAir.text = _loc5_[4] != undefined ? _loc5_[4] + "%" : "0%";
   this._lblDodgeAP.text = _loc5_[5] != undefined ? _loc5_[5] + "%" : "0%";
   this._lblDodgeMP.text = _loc5_[6] != undefined ? _loc5_[6] + "%" : "0%";
   var _loc3_ = 1;
   while(_loc3_ <= 9)
   {
      var _loc4_ = this["_ldrState" + _loc3_];
      _loc4_.contentPath = dofus.Constants.STATESICON_FILE;
      _loc3_ += 1;
   }
   this.updateStates();
};
