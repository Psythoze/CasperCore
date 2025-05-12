var _loc1 = _global.dofus.aks.GameActions.prototype;
_loc1.onModoCriatura = function()
{
   var _loc3_ = this.api.datacenter.Sprites.getItems();
   for(var _loc4_ in _loc3_)
   {
      var _loc2_ = _loc3_[_loc4_];
      if(!(_loc2_ == undefined || _loc2_.isClear))
      {
         _loc2_.CharacteristicsManager.modoCriaturas();
      }
   }
};
_loc1.onModoSinMontura = function()
{
   var _loc3_ = this.api.datacenter.Sprites.getItems();
   for(var _loc4_ in _loc3_)
   {
      var _loc2_ = _loc3_[_loc4_];
      if(!(_loc2_ == undefined || _loc2_.isClear))
      {
         _loc2_.CharacteristicsManager.modoSinMontura();
      }
   }
};
_loc1.onActionsFinish = function(sExtraData)
{
   var _loc5_ = sExtraData.split("|");
   var _loc6_ = Number(_loc5_[0]);
   var _loc3_ = _loc5_[1];
   var _loc4_ = this.api.datacenter.Player.data;
   var _loc2_ = _loc4_.sequencer;
   _loc4_.GameActionsManager.m_bNextAction = false;
   if(this.api.datacenter.Game.isFight)
   {
      _loc2_.addAction(32,false,this.api.kernel.GameManager,this.api.kernel.GameManager.setEnabledInteractionIfICan,[ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT]);
      if(_loc3_ != undefined)
      {
         _loc2_.addAction(33,false,this,this.actionAck,[_loc3_]);
      }
      _loc2_.addAction(34,false,this.api.kernel.GameManager,this.api.kernel.GameManager.cleanPlayer,[_loc6_]);
      this.api.gfx.mapHandler.resetEmptyCells();
      this.api.gfx.clearZoneLayer("spell");
      this.api.gfx.clearPointer();
      _loc2_.execute();
      if(_loc3_ == 2)
      {
         this.api.kernel.TipsManager.showNewTip(dofus["\x0b\b"].TipsManager.TIP_FIGHT_ENDMOVE);
      }
   }
};
