_global.dofus["\r\x14"].battlefield["\x1e\x0b\x05"] = function(sText, sFile, nColor, nFrame, sTitle, nColorTitle, nStarsValue, nExperiencia)
{
   super();
   this.initialize(nStarsValue,nExperiencia);
   this.draw(sText,sFile,nColor,nFrame,sTitle,nColorTitle);
};
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x05"].prototype = new dofus["\r\x14"].battlefield["\x14"]();
var _loc1 = _global.dofus["\r\x14"].battlefield["\x1e\x0b\x05"].prototype;
_loc1.initialize = function(nStarsValue, nExperiencia)
{
   super.initialize();
   if(nStarsValue == undefined || _global.isNaN(nStarsValue))
   {
      nStarsValue = -1;
   }
   if(_global.isNaN(nExperiencia))
   {
      nExperiencia = undefined;
   }
   this._sExperiencia = nExperiencia;
   this._nStarsValue = nStarsValue;
   this.createTextField("_txtTitle",1000,0,_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
   if(this._sExperiencia != undefined)
   {
      var _loc4_ = _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
      _loc4_ += dofus["\r\x14"].battlefield["\x1e\x0b\x05"].HEIGHT_LINE + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
      if(this._nStarsValue > 0)
      {
         _loc4_ += dofus["\r\x14"].battlefield["\x1e\x0b\x05"].HEIGHT_LINE + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
      }
      this.createTextField("_txtExperiencia",1010,0,_loc4_,0,0);
   }
   _loc4_ = _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
   _loc4_ += dofus["\r\x14"].battlefield["\x1e\x0b\x05"].HEIGHT_LINE + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
   if(this._sExperiencia)
   {
      _loc4_ += dofus["\r\x14"].battlefield["\x1e\x0b\x05"].HEIGHT_LINE + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
   }
   if(this._nStarsValue > 0)
   {
      _loc4_ += dofus["\r\x14"].battlefield["\x1e\x0b\x05"].HEIGHT_LINE + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
   }
   this.createTextField("_txtText",30,0,_loc4_,0,0);
   this._txtExperiencia.embedFonts = true;
   this._txtText.embedFonts = true;
   this._txtTitle.embedFonts = true;
   this._aStars = new Array();
};
_loc1.draw = function(sText, sFile, nColor, nFrame, sTitle, nColorTitle)
{
   var _loc14_ = sFile != undefined && nFrame != undefined;
   this._txtText.autoSize = "center";
   this._txtText.text = sText;
   this._txtText.selectable = false;
   this._txtText.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
   if(nColor != undefined)
   {
      this._txtText.textColor = nColor;
   }
   this._txtTitle.autoSize = "center";
   this._txtTitle.text = sTitle;
   this._txtTitle.selectable = false;
   this._txtTitle.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
   if(nColorTitle != undefined)
   {
      this._txtTitle.textColor = nColorTitle;
   }
   if(this._sExperiencia != undefined)
   {
      this._txtExperiencia.autoSize = "center";
      var _loc6_ = "";
      var _loc7_ = 0;
      var _loc4_ = this._sExperiencia.length - 1;
      while(_loc4_ >= 0)
      {
         if(_loc7_ > 0 && _loc7_ % 3 == 0)
         {
            _loc6_ = "," + _loc6_;
         }
         _loc6_ = this._sExperiencia.substring(_loc4_,_loc4_ + 1) + _loc6_;
         _loc7_ += 1;
         _loc4_ -= 1;
      }
      this._txtExperiencia.text = _loc6_ + " EXP ESTIMÉ";
      this._txtExperiencia.selectable = false;
      this._txtExperiencia.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
      this._txtExperiencia.textColor = 3797055;
   }
   this._nFullWidth = dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT * dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_WIDTH + (dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT - 1) * dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_MARGIN;
   var _loc13_ = Math.ceil(Math.max(this._sExperiencia != undefined ? this._txtExperiencia.textWidth : 0,Math.max(Math.max(this._txtText.textWidth,this._txtTitle.textWidth),this._nStarsValue > 0 ? this._nFullWidth : 0)) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2);
   var _loc12_ = this._height + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
   this.drawBackground(_loc13_,_loc12_,_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.BACKGROUND_COLOR);
   if(this._nStarsValue > 0)
   {
      var _loc10_ = this.getStarsColor();
      var _loc3_ = 0;
      var _loc11_ = _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
      _loc11_ += dofus["\r\x14"].battlefield["\x1e\x0b\x05"].HEIGHT_LINE + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER;
      _loc11_ += (_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + dofus["\r\x14"].battlefield["\x1e\x0b\x05"].HEIGHT_LINE) / 2;
      while(_loc3_ < dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT)
      {
         var _loc5_ = new Object();
         _loc5_._x = _loc3_ * (dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_WIDTH + dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_MARGIN) - this._nFullWidth / 2 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER;
         _loc5_._y = _loc11_;
         this._aStars[_loc3_] = this.createEmptyMovieClip("star" + _loc3_,50 + _loc3_);
         this._aStars[_loc3_].attachMovie("StarBorder","star",1,_loc5_);
         var _loc8_ = this._aStars[_loc3_].star.fill;
         if(_loc10_[_loc3_] > -1)
         {
            var _loc9_ = new Color(_loc8_);
            _loc9_.setRGB(_loc10_[_loc3_]);
            _loc3_ += 1;
         }
         else
         {
            _loc8_._alpha = 0;
            _loc3_ += 1;
         }
      }
   }
   if(_loc14_)
   {
      this.drawGfx(sFile,nFrame);
   }
};
_loc1.getStarsColor = function()
{
   var _loc4_ = new Array();
   var _loc2_ = 0;
   while(_loc2_ < dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT)
   {
      var _loc3_ = Math.floor(this._nStarsValue / 100) + (this._nStarsValue - Math.floor(this._nStarsValue / 100) * 100 > _loc2_ * (100 / dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT) ? 1 : 0);
      _loc4_[_loc2_] = dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COLORS[Math.min(_loc3_,dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COLORS.length - 1)];
      _loc2_ += 1;
   }
   return _loc4_;
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x05"].HEIGHT_LINE = 12;
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COUNT = 5;
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_WIDTH = 10;
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_MARGIN = 2;
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x05"].STARS_COLORS = [-1,16777011,16750848,39168,39372,6697728,2236962,16711680,65280,5987161,16711935];
