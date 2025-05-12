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
_global.dofus["\r\x14"].battlefield["\r\f"] = function(sText, sSpriteName, oEmblem, sFile, nFrame, nPvpGain, title, sFile2, nOrnamento)
{
   super();
   this.initialize(title != undefined,title2 != undefined);
   this.draw(sText,sSpriteName,oEmblem,sFile,nFrame,nPvpGain,title,sFile2,nOrnamento);
};
_global.dofus["\r\x14"].battlefield["\r\f"].prototype = new dofus["\r\x14"].battlefield["\x14"]();
var _loc1 = _global.dofus["\r\x14"].battlefield["\r\f"].prototype;
_loc1.initialize = function(displayTitle)
{
   super.initialize();
   this.createTextField("_txtGuildName",30,0,-2 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
   this.createTextField("_txtSpriteName",33,0,13 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
   if(displayTitle)
   {
      this.createTextField("_txtTitle",31,0,-2 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
      this._txtTitle.embedFonts = true;
   }
};
_loc1.draw = function(sGuildName, sSpriteName, oEmblem, sFile, nFrame, nPvpGain, title, sFile2, nOrnamento)
{
   var _loc16_ = sFile != undefined && nFrame != undefined;
   if(nPvpGain == undefined)
   {
      nPvpGain = 0;
   }
   this._txtGuildName.embedFonts = true;
   this._txtGuildName.autoSize = "left";
   this._txtGuildName.text = sGuildName;
   this._txtGuildName.selectable = false;
   this._txtGuildName.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_SMALL_FORMAT);
   this._txtSpriteName.embedFonts = true;
   this._txtSpriteName.autoSize = "left";
   this._txtSpriteName.text = sSpriteName;
   this._txtSpriteName.selectable = false;
   this._txtSpriteName.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
   var _loc9_ = 0;
   if(esVIP == 1)
   {
      var _loc7_ = 0.4;
      var _loc3_ = 3;
      var _loc10_ = 3;
      var _loc15_ = 5;
      var _loc14_ = false;
      var _loc11_ = false;
      var _loc12_ = new flash.filters.GlowFilter(15063833,_loc7_,_loc3_,_loc3_,_loc10_,_loc15_,_loc14_,_loc11_);
      this._txtSpriteName.filters = new Array(_loc12_);
   }
   _loc4 = Math.ceil(27 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2);
   _loc3_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 50;
   this._txtGuildName._x = this._txtSpriteName._x = (- _loc3_) / 2 + 30 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2;
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
      _loc4 = Math.ceil(27 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 3 + this._txtTitle.textHeight);
      if(!_global.isNaN(nOrnamento) && nOrnamento > 0)
      {
         _loc3_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 50;
      }
      else
      {
         _loc3_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 55;
      }
      _loc3_ = Math.ceil(Math.max(_loc3_,this._txtTitle.textWidth + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 3));
      _loc9_ = _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + this._txtTitle.textHeight;
      this._txtGuildName._x = this._txtSpriteName._x = (- _loc3_) / 2 + 30 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2;
      this._txtTitle._y = 23 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2;
   }
   if(!_global.isNaN(nOrnamento) && nOrnamento > 0)
   {
      var _loc6_ = 0;
      if(_loc3_ < 120)
      {
         _loc3_ = 120;
      }
      if(_loc4 < 30)
      {
         _loc6_ = (30 - _loc4) / 2;
         _loc4 = 30;
      }
      this.drawOrnamentos(sFile2,nOrnamento,{ancho:_loc3_,alto:_loc4,medio:_loc6_});
   }
   else
   {
      this.drawBackground(_loc3_,_loc4,_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.BACKGROUND_COLOR);
   }
   this.attachMovie("Emblem","_eEmblem",100,{_x:Math.ceil((- _loc3_) / 2) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER + 5,_y:_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + 3,_height:25,_width:25,data:oEmblem,shadow:true});
   if(_loc16_)
   {
      this.drawGfx(sFile,nFrame);
      this.addPvpGfxEffect(nPvpGain,nFrame);
   }
};
ASSetPropFlags(_loc1,null,1);
