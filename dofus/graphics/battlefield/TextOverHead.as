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
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x06"] = function(sText, sFile, nColor, nFrame, nPvpGain, title, sFile2, nOrnamento)
{
   super();
   this.initialize(title != undefined);
   this.draw(sText,sFile,nColor,nFrame,nPvpGain,title,sFile2,nOrnamento);
};
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x06"].prototype = new dofus["\r\x14"].battlefield["\x14"]();
var _loc1 = _global.dofus["\r\x14"].battlefield["\x1e\x0b\x06"].prototype;
_loc1.initialize = function(displayTitle)
{
   super.initialize();
   this.createTextField("_txtText",30,0,-3 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
   if(displayTitle)
   {
      this.createTextField("_txtTitle",31,0,-3 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
      this._txtTitle.embedFonts = true;
   }
   this._txtText.embedFonts = true;
};
_loc1.draw = function(sText, sFile, nColor, nFrame, nPvpGain, title, sFile2, nOrnamento)
{
   var _loc15_ = sFile != undefined && nFrame != undefined;
   if(nPvpGain == undefined)
   {
      nPvpGain = 0;
   }
   this._txtText.autoSize = "center";
   this._txtText.text = sText;
   this._txtText.selectable = false;
   this._txtText.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
   if(nColor != undefined)
   {
      this._txtText.textColor = nColor;
   }
   if(esVIP == 1)
   {
      var _loc14_ = 0.4;
      var _loc3_ = 3;
      var _loc11_ = 3;
      var _loc13_ = 5;
      var _loc6_ = false;
      var _loc7_ = false;
      var _loc9_ = new flash.filters.GlowFilter(15063833,_loc14_,_loc3_,_loc3_,_loc11_,_loc13_,_loc6_,_loc7_);
      this._txtText.filters = new Array(_loc9_);
   }
   _loc3_ = Math.ceil(this._txtText.textHeight + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2);
   _loc3 = Math.ceil(this._txtText.textWidth + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2);
   if(title)
   {
      this._txtTitle.autoSize = "center";
      this._txtTitle.text = title.text;
      this._txtTitle.selectable = false;
      this._txtTitle.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT2);
      if(title.color != undefined)
      {
         this._txtTitle.textColor = title.color;
      }
      this._txtTitle._y = this._txtText._y + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + this._txtText.textHeight;
      _loc3_ = Math.ceil(this._txtText.textHeight + this._txtTitle.textHeight + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 3);
      _loc3 = Math.ceil(Math.max(this._txtText.textWidth,this._txtTitle.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2);
   }
   if(!_global.isNaN(nOrnamento) && nOrnamento > 0)
   {
      var _loc5_ = 0;
      if(_loc3 < 80)
      {
         _loc3 = 80;
      }
      if(_loc3_ < 30)
      {
         _loc5_ = (30 - _loc3_) / 2;
         _loc3_ = 30;
      }
      this.drawOrnamentos(sFile2,nOrnamento,{ancho:_loc3,alto:_loc3_,medio:_loc5_},false);
   }
   else
   {
      this.drawBackground(_loc3,_loc3_,_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.BACKGROUND_COLOR);
   }
   if(_loc15_)
   {
      this.drawGfx(sFile,nFrame);
      this.addPvpGfxEffect(nPvpGain,nFrame);
   }
};
ASSetPropFlags(_loc1,null,1);
