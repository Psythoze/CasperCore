if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.datacenter)
{
   _global.dofus.datacenter = new Object();
}
_global.dofus.datacenter.MonsterInBidHouse = function(_loc2_, nBidHouseType)
{
   this["\x18\x02\x18"] = _loc2_;
   this._nBidHouseType = nBidHouseType;
   this.name = this.api.lang.getMonstersText(this["\x18\x02\x18"]).n;
   _global.API.kernel.showMessage(undefined,this.name + " ?? " + this["\x18\x02\x18"],"INFO_CHAT");
};
var _loc1 = dofus.datacenter.MonsterInBidHouse.prototype;
_loc1["\x17\n\x18"] = function()
{
   return _global["\x18\x1a"];
};
_loc1["\x16\x10\b"] = function()
{
   return this["\x18\x02\x18"];
};
_loc1["\x16\x10\x10"] = function()
{
   return this.getAssociatedSoulStoneCategoryID();
};
_loc1["\x16\x1b\b"] = function()
{
   return this.name;
};
_loc1["\x17\x06\x07"] = function()
{
   return dofus.Constants.CLIPS_PERSOS_PATH + String(this.gfx) + ".swf";
};
_loc1["\x17\x01\x1c"] = function()
{
   return this.api.lang.getMonstersText(this["\x18\x02\x18"]).g;
};
_loc1["\x16\x1e\x1a"] = function()
{
   return "MonsterListItem";
};
_loc1["\x16\x16\x1b"] = function()
{
   return {contentPath:this.contentPath};
};
_loc1.__get__isMonsterInBidHouse = function()
{
   return true;
};
_loc1["\x16\x12\x10"] = function()
{
   return "";
};
_loc1.getAssociatedSoulStoneCategoryID = function()
{
   if(this._nBidHouseType == undefined)
   {
      var _loc2_ = this.api.lang.getMonstersText(this["\x18\x02\x18"]);
      if(_loc2_.b == 78)
      {
         return dofus.datacenter["\f\f"].FULL_SOUL_STONE_ARCHI;
      }
      if(_loc2_.d)
      {
         return dofus.datacenter["\f\f"].FULL_SOUL_STONE_BOSS;
      }
      return dofus.datacenter["\f\f"].FULL_SOUL_STONE_NORMAL;
   }
   return this._nBidHouseType;
};
_loc1.addProperty("iconFile",_loc1["\x16\x1e\x1a"],function()
{
}
);
_loc1.addProperty("label",_loc1["\x16\x1b\b"],function()
{
}
);
_loc1.addProperty("unicID",_loc1["\x16\x10\b"],function()
{
}
);
_loc1.addProperty("params",_loc1["\x16\x16\x1b"],function()
{
}
);
_loc1.addProperty("contentPath",_loc1["\x17\x06\x07"],function()
{
}
);
_loc1.addProperty("type",_loc1["\x16\x10\x10"],function()
{
}
);
_loc1.addProperty("api",_loc1["\x17\n\x18"],function()
{
}
);
_loc1.addProperty("style",_loc1["\x16\x12\x10"],function()
{
}
);
_loc1.addProperty("gfx",_loc1["\x17\x01\x1c"],function()
{
}
);
_loc1.addProperty("isMonsterInBidHouse",_loc1.__get__isMonsterInBidHouse,function()
{
}
);
ASSetPropFlags(_loc1,null,1);
