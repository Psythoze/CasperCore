var _loc1 = _global.dofus.datacenter["\t\x1d"].prototype;
_loc1.__set__name = function(value)
{
   this._aNamesList = new Array();
   var _loc4_ = value.split(",");
   var _loc3_ = -1;
   var _loc5_ = this._archis.split(",");
   while(true)
   {
      _loc3_ = _loc3_ + 1;
      if(_loc3_ >= _loc4_.length)
      {
         break;
      }
      var _loc2_ = this.api.lang.getMonstersText(_loc4_[_loc3_]);
      if(_loc5_[_loc3_] == 1)
      {
         this._aNamesList.push(_loc2_.n + " [Archi]");
         this.sArchi = true;
      }
      else
      {
         this._aNamesList.push(_loc2_.n);
      }
      if(_loc2_.a != -1)
      {
         this._nAlignmentIndex = _loc2_.a;
      }
   }
};
_loc1.__get__name = function()
{
   return this.getName();
};
_loc1.getName = function(sEndChar)
{
   sEndChar = sEndChar != undefined ? sEndChar : "\n";
   var _loc4_ = new Array();
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= this._aLevelsList.length)
      {
         break;
      }
      _loc4_.push({level:Number(this._aLevelsList[_loc2_]),name:this._aNamesList[_loc2_]});
   }
   _loc4_.sortOn(["level"],Array.DESCENDING | Array.NUMERIC);
   var _loc6_ = new String();
   var _loc5_ = -1;
   while(true)
   {
      _loc5_ = _loc5_ + 1;
      if(_loc5_ >= _loc4_.length)
      {
         break;
      }
      var _loc3_ = _loc4_[_loc5_];
      _loc6_ += _loc3_.name + " (" + _loc3_.level + ")" + sEndChar;
   }
   return _loc6_;
};
_loc1.alertChatText = function()
{
   var _loc2_ = this.api.datacenter.Map;
   return "Groupe niveau " + this.totalLevel + " en " + _loc2_.x + "," + _loc2_.y + " : <br/>" + this.getName("<br/>");
};
_loc1.__set__Level = function(value)
{
   this._aLevelsList = value.split(",");
};
_loc1.__get__totalLevel = function()
{
   var _loc3_ = 0;
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= this._aLevelsList.length)
      {
         break;
      }
      _loc3_ += Number(this._aLevelsList[_loc2_]);
   }
   return _loc3_;
};
_loc1.__get__bonusValue = function()
{
   return this._nBonusValue;
};
_loc1.__get__totalExp = function()
{
   return this._nTotalExp;
};
_loc1.__get__ArchiMob = function()
{
   return this._archis;
};
_loc1.__set__totalExp = function(nValue)
{
   this._nTotalExp = nValue;
};
_loc1.__get__alignment = function()
{
   return new dofus.datacenter["\x1e\f"](this._nAlignmentIndex,0);
};
_loc1.__set__ArchiMob = function(sValue)
{
   this._archis = sValue;
};
_loc1.addProperty("alignment",_loc1.__get__alignment,function()
{
}
);
_loc1.addProperty("name",_loc1.__get__name,_loc1.__set__name);
_loc1.addProperty("bonusValue",_loc1.__get__bonusValue,function()
{
}
);
_loc1.addProperty("totalLevel",_loc1.__get__totalLevel,function()
{
}
);
_loc1.addProperty("Level",function()
{
}
,_loc1.__set__Level);
_loc1.addProperty("archimob",function()
{
}
,_loc1.__set__ArchiMob);
_loc1.addProperty("totalExp",_loc1.__get__totalExp,_loc1.__set__totalExp);
ASSetPropFlags(_loc1,null,1);
_loc1._archis = "";
_loc1._sDefaultAnimation = "static";
_loc1._bAllDirections = false;
_loc1.sArchi = false;
_loc1._bForceWalk = true;
_loc1._nAlignmentIndex = -1;
