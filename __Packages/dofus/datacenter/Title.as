dofus.datacenter["\x1e\x0b\x01"] = function(id, color, value, selected, param)
{
   this.api = _global.API;
   this._id = id;
   this._selected = selected;
   this._value = value;
   if(value != "")
   {
      this._color = color;
      this._value = value;
   }
   else if(this._id != -1)
   {
      switch(this.api.lang.getTitle(id).pt)
      {
         case 1:
            var _loc5_ = this.api.lang.getTitle(id).t.split("%1").join(this.api.lang.getMonsters()[_global.parseInt(param)].n);
            break;
         case 0:
         default:
            _loc5_ = this.api.lang.getTitle(id).t.split("%1").join(param);
      }
      this._color = color == undefined ? this.api.lang.getTitle(id).c : _global.parseInt(color);
      this._text = "« " + _loc5_ + " »";
   }
   else
   {
      this._color = _global.parseInt(color);
      this._text = param;
   }
};
var _loc1 = dofus.datacenter["\x1e\x0b\x01"].prototype;
_loc1.__get__color = function()
{
   return this._color;
};
_loc1.__set__color = function(sColor)
{
   this._color = sColor;
};
_loc1.__get__text = function()
{
   return this._value == "" ? this._text : this._value;
};
_loc1.__set__text = function(sText)
{
   this._text = sText;
};
_loc1.__get__value = function()
{
   return this._value;
};
_loc1.__set__value = function(sValue)
{
   this._value = sValue;
};
_loc1.__set__id = function(sId)
{
   this._id = sId;
};
_loc1.__get__id = function()
{
   return Number(this._id);
};
_loc1.__set__selected = function(sSelected)
{
   this._selected = sSelected;
};
_loc1.__get__selected = function()
{
   return this._selected;
};
_loc1.addProperty("text",_loc1.__get__text,_loc1.__set__text);
_loc1.addProperty("color",_loc1.__get__color,_loc1.__set__color);
_loc1.addProperty("value",_loc1.__get__value,_loc1.__set__value);
_loc1.addProperty("id",_loc1.__get__id,_loc1.__set__id);
_loc1.addProperty("selected",_loc1.__get__selected,_loc1.__set__selected);
ASSetPropFlags(_loc1,null,1);
