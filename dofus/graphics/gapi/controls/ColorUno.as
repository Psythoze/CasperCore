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
if(!dofus["\r\x14"].gapi.controls)
{
   _global.dofus["\r\x14"].gapi.controls = new Object();
}
_global.dofus["\r\x14"].gapi.controls.ColorUno = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.controls.ColorUno.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.ColorUno.prototype;
_loc1.__set__colors = function(aColors)
{
   this.addToQueue({object:this,method:this.applyColor,params:[aColors[0],1]});
   this.addToQueue({object:this,method:this.applyColor,params:[aColors[1],2]});
   this.addToQueue({object:this,method:this.applyColor,params:[aColors[2],3]});
};
_loc1.__set__breed = function(nBreed)
{
   this._nBreed = nBreed;
};
_loc1.__set__sex = function(nSex)
{
   this._nSex = nSex;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.ColorUno.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.initData = function()
{
   this._oColors = {color1:-1};
   this._oBakColors = {color1:-1};
};
_loc1.addListeners = function()
{
   this._btnColor1.addEventListener("click",this);
   this._cpColorPicker.addEventListener("change",this);
   var ref = this;
   this._mcRandomColor1.onPress = function()
   {
      ref.click({target:this});
   };
};
_loc1.setColorIndex = function(nIndex)
{
   var _loc3_ = this["_btnColor" + this._nSelectedColorIndex];
   var _loc2_ = this["_btnColor" + nIndex];
   _loc3_.selected = false;
   _loc2_.selected = true;
   this._nSelectedColorIndex = nIndex;
};
_loc1.applyColor = function(nColor, nIndex)
{
   if(nIndex == undefined)
   {
      nIndex = this._nSelectedColorIndex;
   }
   var _loc4_ = {ColoredButton:{bgcolor:(nColor != -1 ? nColor : 16711680),highlightcolor:(nColor != -1 ? nColor : 5987161),bgdowncolor:(nColor != -1 ? nColor : 16711680),highlightdowncolor:(nColor != -1 ? nColor : 5987161)}};
   ank.gapi.core["\x1e\n\f"].loadStylePackage(_loc4_);
   this["_btnColor" + nIndex].styleName = "ColoredButton";
   this._oColors["color" + nIndex] = nColor;
   this._oBakColors["color" + nIndex] = nColor;
};
_loc1.selectColor = function(nIndex)
{
   var _loc2_ = this._oBakColors["color" + nIndex];
   if(_loc2_ != -1)
   {
      this._cpColorPicker.setColor(_loc2_);
   }
   this.setColorIndex(nIndex);
};
_global.dofus["\r\x14"].gapi.controls.ColorUno.d2h = function(d)
{
   if(d > 255)
   {
      d = 255;
   }
   return dofus["\r\x14"].gapi.controls.ColorUno.HEX_CHARS[Math.floor(d / 16)] + dofus["\r\x14"].gapi.controls.ColorUno.HEX_CHARS[d % 16];
};
_loc1.displayColorCode = function(nIndex)
{
   this.selectColor(nIndex);
   var _loc7_ = (this._oColors["color" + nIndex] & 16711680) >> 16;
   var _loc6_ = (this._oColors["color" + nIndex] & 65280) >> 8;
   var _loc5_ = this._oColors["color" + nIndex] & 255;
   var _loc3_ = dofus["\r\x14"].gapi.controls.ColorUno.d2h(_loc7_) + dofus["\r\x14"].gapi.controls.ColorUno.d2h(_loc6_) + dofus["\r\x14"].gapi.controls.ColorUno.d2h(_loc5_);
   if(this._oColors["color" + nIndex] == undefined || this._oColors["color" + nIndex] == -1)
   {
      _loc3_ = "";
   }
   var _loc4_ = this.gapi.loadUIComponent("PopupHexa","PopupHexa",{value:_loc3_,params:{targetType:"colorCode",colorIndex:nIndex}});
   _loc4_.addEventListener("validate",this);
};
_loc1.setColor = function(nIndex, nValue)
{
   this.setColorIndex(nIndex);
   this.change({target:this._cpColorPicker,value:nValue});
   this.click({target:this["_btnColor" + nIndex]});
};
_loc1.hueVariation = function(nColor, nVariation, bNoBalance)
{
   var _loc2_ = this.rgb2hsl(nColor);
   if(_loc2_.h < 0.5 && !bNoBalance)
   {
      nVariation = - nVariation;
   }
   _loc2_.h += nVariation;
   if(_loc2_.h > 1)
   {
      _loc2_.h = _loc2_.h - 1;
   }
   if(_loc2_.h < 0)
   {
      _loc2_.h = _loc2_.h + 1;
   }
   return this.hsl2rgb(_loc2_.h,_loc2_.s,_loc2_.l);
};
_loc1.lightVariation = function(nColor, nVariation)
{
   var _loc2_ = this.rgb2hsl(nColor);
   _loc2_.l += nVariation;
   if(_loc2_.l > 1)
   {
      _loc2_.l = 1;
   }
   if(_loc2_.l < 0)
   {
      _loc2_.l = 0;
   }
   return this.hsl2rgb(_loc2_.h,_loc2_.s,_loc2_.l);
};
_loc1.complementaryColor = function(nColor)
{
   var _loc3_ = this.rgb2hsl(nColor);
   var _loc2_ = _loc3_.h + 0.5;
   if(_loc2_ > 1)
   {
      _loc2_ = _loc2_ - 1;
   }
   return this.hsl2rgb(_loc2_,_loc3_.s,_loc3_.l);
};
_loc1.hsl2rgb = function(h, s, l)
{
   if(s == 0)
   {
      var _loc8_ = l * 255;
      var _loc7_ = l * 255;
      var _loc6_ = l * 255;
   }
   else
   {
      if(l < 0.5)
      {
         var _loc3_ = l * (1 + s);
      }
      else
      {
         _loc3_ = l + s - s * l;
      }
      var _loc4_ = 2 * l - _loc3_;
      _loc8_ = 255 * this.h2rgb(_loc4_,_loc3_,h + 0.333333);
      _loc7_ = 255 * this.h2rgb(_loc4_,_loc3_,h);
      _loc6_ = 255 * this.h2rgb(_loc4_,_loc3_,h - 0.333333);
   }
   return Number("0x" + dofus["\r\x14"].gapi.controls.ColorUno.d2h(Math.round(_loc8_)) + dofus["\r\x14"].gapi.controls.ColorUno.d2h(Math.round(_loc7_)) + dofus["\r\x14"].gapi.controls.ColorUno.d2h(Math.round(_loc6_)));
};
_loc1.rgb2hsl = function(nColor)
{
   var _loc8_ = ((nColor & 16711680) >> 16) / 255;
   var _loc7_ = ((nColor & 65280) >> 8) / 255;
   var _loc6_ = (nColor & 255) / 255;
   var _loc5_ = this.min(_loc8_,_loc7_,_loc6_);
   var _loc2_ = this.max(_loc8_,_loc7_,_loc6_);
   var _loc3_ = _loc2_ - _loc5_;
   var _loc13_ = (_loc2_ + _loc5_) / 2;
   if(_loc3_ == 0)
   {
      var _loc4_ = 0;
      var _loc9_ = 0;
   }
   else
   {
      if(_loc13_ < 0.5)
      {
         _loc9_ = _loc3_ / (_loc2_ + _loc5_);
      }
      else
      {
         _loc9_ = _loc3_ / (2 - _loc2_ - _loc5_);
      }
      var _loc12_ = ((_loc2_ - _loc8_) / 6 + _loc3_ / 2) / _loc3_;
      var _loc11_ = ((_loc2_ - _loc7_) / 6 + _loc3_ / 2) / _loc3_;
      var _loc10_ = ((_loc2_ - _loc6_) / 6 + _loc3_ / 2) / _loc3_;
      if(_loc8_ == _loc2_)
      {
         _loc4_ = _loc10_ - _loc11_;
      }
      else if(_loc7_ == _loc2_)
      {
         _loc4_ = 0.333333 + _loc12_ - _loc10_;
      }
      else if(_loc6_ == _loc2_)
      {
         _loc4_ = 0.666667 + _loc11_ - _loc12_;
      }
      if(_loc4_ < 0)
      {
         _loc4_ = _loc4_ + 1;
      }
      if(_loc4_ > 1)
      {
         _loc4_ = _loc4_ - 1;
      }
   }
   return {h:_loc4_,s:_loc9_,l:_loc13_};
};
_loc1.h2rgb = function(v1, v2, h)
{
   if(h < 0)
   {
      h = h + 1;
   }
   if(h > 1)
   {
      h = h - 1;
   }
   if(6 * h < 1)
   {
      return v1 + (v2 - v1) * 6 * h;
   }
   if(2 * h < 1)
   {
      return v2;
   }
   if(3 * h < 2)
   {
      return v1 + (v2 - v1) * ((0.666667 - h) * 6);
   }
   return v1;
};
_loc1.min = function()
{
   var _loc4_ = Infinity;
   var _loc3_ = -1;
   while(true)
   {
      _loc3_ = _loc3_ + 1;
      if(_loc3_ >= arguments.length)
      {
         break;
      }
      if(!_global.isNaN(Number(arguments[_loc3_])) && _loc4_ > Number(arguments[_loc3_]))
      {
         _loc4_ = Number(arguments[_loc3_]);
      }
   }
   return _loc4_;
};
_loc1.max = function()
{
   var _loc4_ = -Infinity;
   var _loc3_ = -1;
   while(true)
   {
      _loc3_ = _loc3_ + 1;
      if(_loc3_ >= arguments.length)
      {
         break;
      }
      if(!_global.isNaN(Number(arguments[_loc3_])) && _loc4_ < Number(arguments[_loc3_]))
      {
         _loc4_ = Number(arguments[_loc3_]);
      }
   }
   return _loc4_;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnColor1:
         var _loc2_ = Number(oEvent.target._name.substr(9));
         if(Key.isDown(16))
         {
            this.displayColorCode(_loc2_);
         }
         else if(Key.isDown(17))
         {
            this.applyColor(-1,_loc2_);
         }
         else
         {
            this.selectColor(_loc2_);
         }
         break;
      case this._mcRandomColor1:
         var _loc4_ = Number(oEvent.target._name.substr(14));
         this.setColor(_loc4_,Math.round(Math.random() * 5987161));
   }
};
_loc1.change = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target) === this._cpColorPicker)
   {
      this.applyColor(oEvent.value);
      this.dispatchEvent({type:"change",value:this._oColors});
   }
};
_loc1.validate = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.params.targetType) === "colorCode")
   {
      if(!(_global.isNaN(oEvent.value) || (oEvent.value > 5987161 || oEvent.value == undefined)))
      {
         this.setColor(oEvent.params.colorIndex,oEvent.value);
      }
   }
};
_loc1.addProperty("colors",function()
{
}
,_loc1.__set__colors);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.controls.ColorUno.CLASS_NAME = "ColorUno";
_global.dofus["\r\x14"].gapi.controls.ColorUno.MAXIMUM_COLOR_INDEX = 1;
_loc1._nSelectedColorIndex = 1;
_global.dofus["\r\x14"].gapi.controls.ColorUno.HEX_CHARS = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];
