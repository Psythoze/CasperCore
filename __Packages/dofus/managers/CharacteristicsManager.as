var _loc1 = dofus["\x0b\b"].CharacteristicsManager.prototype;
_loc1.initialize = function(oSprite, oAPI)
{
   super.initialize(oAPI);
   this._oSprite = oSprite;
   var _loc5_ = this._oSprite.gfxFile.split("/");
   var _loc7_ = _loc5_[_loc5_.length - 1];
   var _loc6_ = _loc7_.split(".")[0];
   this._oSprite.gfxOriginal = _loc6_;
   this._aEffects = new Array();
   this._aModerators = new Array(40);
   var _loc4_ = 0;
   while(true)
   {
      _loc4_ = _loc4_ + 1;
      if(_loc4_ >= this._aModerators.length)
      {
         break;
      }
      this._aModerators[_loc4_] = 0;
   }
   this.initO();
   if(_global.CRIATURA && this.api.datacenter.Game.isFight)
   {
      this.activarModoCriatura();
   }
   if(_global.SIN_MONTURA && this.api.datacenter.Game.isFight)
   {
      this.activarModoSinMontura();
   }
};
_loc1.modoSinMontura = function()
{
   if(_global.SIN_MONTURA)
   {
      this.activarModoSinMontura();
   }
   else
   {
      this.desactivarModoSinMontura();
   }
};
_loc1.activarModoSinMontura = function()
{
   if(this._oSprite.mount != undefined)
   {
      this._oSprite.tmpMount = this._oSprite.mount;
      this._oSprite.mount = undefined;
   }
   this._oSprite.mc.draw();
};
_loc1.desactivarModoSinMontura = function()
{
   this._oSprite.mount = this._oSprite.tmpMount;
   delete register_oSprite.tmpMount;
   this._oSprite.mc.draw();
};
_loc1.modoCriaturas = function()
{
   if(_global.CRIATURA)
   {
      this.activarModoCriatura();
   }
   else
   {
      this.desactivarModoCriatura();
   }
};
_loc1.activarModoCriatura = function()
{
   var _loc3_ = "202";
   var _loc5_ = this._oSprite.gfxOriginal;
   var _loc4_ = _loc5_.substr(0,_loc5_.length - 1);
   if(_global.parseInt(_loc4_) < 16)
   {
      _loc3_ = _loc4_ + "2";
   }
   if(this._oSprite.mount != undefined)
   {
      this._oSprite.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _loc3_ + ".swf";
      this._oSprite.tmpMount = this._oSprite.mount;
      this._oSprite.mount = undefined;
   }
   else
   {
      this._oSprite.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _loc3_ + ".swf";
   }
   this._oSprite.mc.draw();
};
_loc1.desactivarModoCriatura = function()
{
   this._oSprite.mount = this._oSprite.tmpMount;
   delete register_oSprite.tmpMount;
   this._oSprite.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + this._oSprite.gfxOriginal + ".swf";
   this._oSprite.mc.draw();
};
_loc1.onEffectStart = function(oEffect)
{
   var _loc3_ = oEffect.characteristic;
   switch(_loc3_)
   {
      case dofus["\x0b\b"].CharacteristicsManager.GFX:
         if(_global.CRIATURA)
         {
            this._oSprite.gfxOriginal = oEffect.param2;
         }
         else
         {
            if(this._oSprite.mount != undefined)
            {
               this._oSprite.mount.chevauchorGfxID = oEffect.param2;
            }
            else
            {
               this._oSprite.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + oEffect.param2 + ".swf";
            }
            this._oSprite.mc.draw();
         }
         break;
      case dofus["\x0b\b"].CharacteristicsManager.INVISIBILITY:
         if(this._oSprite.id == this.api.datacenter.Player.ID)
         {
            this._oSprite.mc.setAlpha(40);
         }
         else
         {
            this._oSprite.mc.setVisible(false);
         }
         break;
      default:
         if(this._aModerators[_loc3_] == undefined)
         {
            this._aModerators[_loc3_] = 0;
         }
         this._aModerators[_loc3_] += Number(oEffect.getParamWithOperator(1));
   }
};
_loc1.modoCriatura = false;
_loc1.addProperty("modocriatura",function()
{
}
,_loc1.__set__modocriatura);
