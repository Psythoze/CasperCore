if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.datacenter)
{
   _global.dofus.datacenter = new Object();
}
_global.dofus.datacenter["\x13\x01"] = function(sID, clipClass, sGfxFile, cellNum, dir, gfxID, title, title2, nOrnamento)
{
   super();
   this._title = title;
   this._title2 = title2;
   this._nOrnamento = nOrnamento;
   this.initialize(sID,clipClass,sGfxFile,cellNum,dir,gfxID);
};
dofus.datacenter["\x13\x01"].prototype = new dofus.datacenter["\x1e\x16\x13"]();
var _loc1 = dofus.datacenter["\x13\x01"].prototype;
_loc1.__get__speedModerator = function()
{
   if(this.isSlow)
   {
      return 0.5;
   }
   return this.agilidad + this._nSpeedModerator;
};
_loc1.__get__agilidad = function()
{
   return this._nAgilidad;
};
_loc1.__set__agilidad = function(value)
{
   this._nAgilidad = Number(value);
};
_loc1.__get__Ornamento = function()
{
   return this._nOrnamento;
};
_loc1.__set__Ornamento = function(value)
{
   this._nOrnamento = Number(value);
};
_loc1.__get__Guild = function()
{
   return this._nGuild;
};
_loc1.__set__Guild = function(value)
{
   this._nGuild = Number(value);
};
_loc1.__get__Sex = function()
{
   return this._nSex;
};
_loc1.__set__Sex = function(value)
{
   this._nSex = Number(value);
};
_loc1.__get__Aura = function()
{
   return this._nAura;
};
_loc1.__set__Aura = function(value)
{
   this._nAura = Number(value);
};
_loc1.__get__alignment = function()
{
   return this._oAlignment;
};
_loc1.__set__alignment = function(value)
{
   this._oAlignment = value;
};
_loc1.__get__Merchant = function()
{
   return this._bMerchant;
};
_loc1.__set__Merchant = function(value)
{
   this._bMerchant = value;
};
_loc1.__get__serverID = function()
{
   return this._nServerID;
};
_loc1.__set__serverID = function(value)
{
   this._nServerID = value;
};
_loc1.__get__Died = function()
{
   return this._bDied;
};
_loc1.__get__resets = function()
{
   return this._nResets;
};
_loc1.__set__resets = function(value)
{
   this._nResets = Number(value);
};
_loc1.__get__vipes = function()
{
   return this._nvipes;
};
_loc1.__set__vipes = function(value)
{
   this._nvipes = Number(value);
};
_loc1.__set__Died = function(value)
{
   this._bDied = value;
};
_loc1.__get__rank = function()
{
   return this._oRank;
};
_loc1.__set__rank = function(value)
{
   this._oRank = value;
};
_loc1.__get__multiCraftSkillsID = function()
{
   return this._aMultiCraftSkillsID;
};
_loc1.__set__multiCraftSkillsID = function(value)
{
   this._aMultiCraftSkillsID = value;
};
_loc1.__set__guildName = function(sGuildName)
{
   this._sGuildName = sGuildName;
};
_loc1.__get__guildName = function()
{
   return this._sGuildName;
};
_loc1.__get__title = function()
{
   return this._title;
};
_loc1.__get__title2 = function()
{
   return this._title2;
};
_loc1.__set__title2 = function(title2)
{
   this._title2 = title2;
};
_loc1.__set__emblem = function(oEmblem)
{
   this._oEmblem = oEmblem;
};
_loc1.__get__emblem = function()
{
   return this._oEmblem;
};
_loc1.__set__restrictions = function(nRestrictions)
{
   this._nRestrictions = Number(nRestrictions);
};
_loc1.__get__canBeAssault = function()
{
   return (this._nRestrictions & 1) != 1;
};
_loc1.__get__canBeChallenge = function()
{
   return (this._nRestrictions & 2) != 2;
};
_loc1.__get__canExchange = function()
{
   return (this._nRestrictions & 4) != 4;
};
_loc1.__get__canBeAttack = function()
{
   return (this._nRestrictions & 8) != 8;
};
_loc1.__get__forceWalk = function()
{
   return (this._nRestrictions & 16) == 16;
};
_loc1.__get__isSlow = function()
{
   return (this._nRestrictions & 32) == 32;
};
_loc1.__get__canSwitchInCreaturesMode = function()
{
   return (this._nRestrictions & 64) != 64;
};
_loc1.__get__isTomb = function()
{
   return (this._nRestrictions & 128) == 128;
};
_loc1.__set__resistances = function(aResistances)
{
   this._aResistances = aResistances;
};
_loc1.__get__resistances = function()
{
   var _loc3_ = new Array();
   var _loc2_ = 0;
   while(_loc2_ < this._aResistances.length)
   {
      _loc3_[_loc2_] = this._aResistances[_loc2_];
      _loc2_ += 1;
   }
   _loc3_[5] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PA_LOST_PROBABILITY);
   _loc3_[6] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PM_LOST_PROBABILITY);
   return _loc3_;
};
_loc1.addProperty("alignment",_loc1.__get__alignment,_loc1.__set__alignment);
_loc1.addProperty("Aura",_loc1.__get__Aura,_loc1.__set__Aura);
_loc1.addProperty("ornamento",_loc1.__get__Ornamento,_loc1.__set__Ornamento);
_loc1.addProperty("isTomb",_loc1.__get__isTomb,function()
{
}
);
_loc1.addProperty("emblem",_loc1.__get__emblem,_loc1.__set__emblem);
_loc1.addProperty("resistances",_loc1.__get__resistances,_loc1.__set__resistances);
_loc1.addProperty("canBeChallenge",_loc1.__get__canBeChallenge,function()
{
}
);
_loc1.addProperty("Died",_loc1.__get__Died,_loc1.__set__Died);
_loc1.addProperty("canBeAttack",_loc1.__get__canBeAttack,function()
{
}
);
_loc1.addProperty("title",_loc1.__get__title,function()
{
}
);
_loc1.addProperty("title2",_loc1.__get__title2,function()
{
}
);
_loc1.addProperty("serverID",_loc1.__get__serverID,_loc1.__set__serverID);
_loc1.addProperty("guildName",_loc1.__get__guildName,_loc1.__set__guildName);
_loc1.addProperty("canExchange",_loc1.__get__canExchange,function()
{
}
);
_loc1.addProperty("canBeAssault",_loc1.__get__canBeAssault,function()
{
}
);
_loc1.addProperty("forceWalk",_loc1.__get__forceWalk,function()
{
}
);
_loc1.addProperty("Sex",_loc1.__get__Sex,_loc1.__set__Sex);
_loc1.addProperty("Guild",_loc1.__get__Guild,_loc1.__set__Guild);
_loc1.addProperty("multiCraftSkillsID",_loc1.__get__multiCraftSkillsID,_loc1.__set__multiCraftSkillsID);
_loc1.addProperty("Merchant",_loc1.__get__Merchant,_loc1.__set__Merchant);
_loc1.addProperty("rank",_loc1.__get__rank,_loc1.__set__rank);
_loc1.addProperty("speedModerator",_loc1.__get__speedModerator,function()
{
}
);
_loc1.addProperty("resets",_loc1.__get__resets,_loc1.__set__resets);
_loc1.addProperty("vipes",_loc1.__get__vipes,_loc1.__set__vipes);
_loc1.addProperty("canSwitchInCreaturesMode",_loc1.__get__canSwitchInCreaturesMode,function()
{
}
);
_loc1.addProperty("restrictions",function()
{
}
,_loc1.__set__restrictions);
_loc1.addProperty("isSlow",_loc1.__get__isSlow,function()
{
}
);
_loc1.addProperty("agilidad",_loc1.__get__agilidad,_loc1.__set__agilidad);
ASSetPropFlags(_loc1,null,1);
_loc1._nAgilidad = Number(0);
_loc1.xtraClipTopAnimations = {staticF:true};
