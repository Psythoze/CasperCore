if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].battlefield)
{
   _global.dofus["\r\x14"].battlefield = new Object();
}
_global.dofus["\r\x14"].battlefield.HealthBarOverHead = function(_loc3_, nBarWidth, _loc5_, _loc6_)
{
   super();
   this._oSprite = _loc3_;
   this.initialize();
   this.drawClip(this._oSprite.name,this._oSprite.LP,0,this._oSprite.LPmax,nBarWidth,_loc5_,_loc6_,this._oSprite.pvpGain);
};
_global.dofus["\r\x14"].battlefield.HealthBarOverHead.prototype = new dofus["\r\x14"].battlefield["\x14"]();
var _loc1 = _global.dofus["\r\x14"].battlefield.HealthBarOverHead.prototype;
_loc1.initialize = function()
{
   super.initialize();
   this.createTextField("_txtSpriteName",40,0,-2 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
};
_loc1.drawClip = function(_loc2_, nCurrentValue, nMinValue, _loc5_, nBarWidth, _loc7_, _loc8_, _loc9_)
{
   var _loc6_ = _loc7_ != undefined && _loc8_ != undefined;
   if(_loc9_ == undefined)
   {
      _loc9_ = 0;
   }
   this._txtSpriteName.embedFonts = true;
   this._txtSpriteName.autoSize = "center";
   this._txtSpriteName.text = _loc2_;
   this._txtSpriteName.selectable = false;
   this._txtSpriteName.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
   var _loc5_ = Math.ceil(32 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2);
   var _loc7_ = Math.ceil(Math.max(this._txtSpriteName.textWidth,nBarWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 3);
   this.drawBackground(_loc7_,_loc5_,_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.BACKGROUND_COLOR);
   _global.API.kernel.debug("Summon Bar: " + nBarWidth);
   this.attachMovie("SpriteHealthBar","_mcSpriteHealthBar",100,{realWidth:nBarWidth,_x:(- nBarWidth) / 2,_y:16 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,lifeCurrentValue:nCurrentValue,lifeMinValue:nMinValue,lifeMaxValue:_loc5_});
   if(_loc6_)
   {
      this.drawGfx(_loc7_,_loc8_);
      this.addPvpGfxEffect(_loc9_,_loc8_);
   }
};
ASSetPropFlags(_loc1,null,1);
