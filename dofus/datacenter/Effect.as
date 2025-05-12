var _loc1 = _global.dofus.datacenter["\x0f\r"].prototype;
_loc1.__get__type = function()
{
   return this._nType;
};
_loc1.__set__type = function(nType)
{
   this._nType = nType;
};
_loc1.__set__probability = function(nProbability)
{
   this._nPropability = nProbability;
};
_loc1.__get__probability = function()
{
   return this._nPropability;
};
_loc1.__get__param1 = function()
{
   return this._nParam1;
};
_loc1.__set__param1 = function(value)
{
   this._nParam1 = value;
};
_loc1.__get__param2 = function()
{
   return this._nParam2;
};
_loc1.__set__param2 = function(value)
{
   this._nParam2 = value;
};
_loc1.__get__param3 = function()
{
   return this._nParam3;
};
_loc1.__set__param3 = function(value)
{
   this._nParam3 = value;
};
_loc1.__get__param4 = function()
{
   return this._sParam4;
};
_loc1.__set__param4 = function(value)
{
   this._sParam4 = value;
};
_loc1.__set__remainingTurn = function(nRremainingTurn)
{
   this._nRemainingTurn = nRremainingTurn;
};
_loc1.__get__remainingTurn = function()
{
   return this._nRemainingTurn;
};
_loc1.__get__remainingTurnStr = function()
{
   return this.getTurnCountStr(true);
};
_loc1.__get__spellID = function()
{
   return this._nSpellID;
};
_loc1.__get__isNothing = function()
{
   return this.api.lang.getEffectText(this._nType).d == "NOTHING";
};
_loc1.__get__description = function()
{
   var _loc17_ = this.api.lang.getEffectText(this._nType).d;
   var _loc3_ = [this._nParam1,this._nParam2,this._nParam3,this._sParam4];
   switch(this._nType)
   {
      case 10:
         _loc3_[2] = this.api.lang.getEmoteText(this._nParam3).n;
         break;
      case 724:
         _loc3_[2] = this.api.lang.getTitle(this._nParam3).t;
         break;
      case 165:
         _loc3_[0] = this.api.lang.getItemTypeText(this._nParam1).n;
         break;
      case 293:
      case 294:
      case 787:
      case 301:
      case 302:
      case 303:
      case 304:
      case 305:
      case 305:
      case 306:
      case 307:
      case 308:
      case 309:
         _loc3_[0] = this.api.lang.getSpellText(this._nParam1).n;
         break;
      case 601:
         var _loc8_ = this.api.lang.getMapText(this._nParam2);
         _loc3_[0] = this.api.lang.getMapSubAreaText(_loc8_.sa).n;
         _loc3_[1] = _loc8_.x;
         _loc3_[2] = _loc8_.y;
         break;
      case 614:
         _loc3_[0] = this._nParam3;
         _loc3_[1] = this.api.lang.getJobText(this._nParam2).n;
         break;
      case 615:
         _loc3_[2] = this.api.lang.getJobText(this._nParam3).n;
         break;
      case 420:
      case 616:
      case 624:
      case 604:
         _loc3_[2] = this.api.lang.getSpellText(this._nParam3).n;
         break;
      case 603:
         _loc3_[2] = this.api.lang.getJobText(this._nParam3).n;
         break;
      case 699:
         _loc3_[0] = this.api.lang.getJobText(this._nParam1).n;
         break;
      case 628:
      case 623:
         _loc3_[2] = this.api.lang.getMonstersText(this._nParam3).n;
         break;
      case 621:
         _loc3_[0] = this._nParam1;
         _loc3_[2] = this.api.lang.getMonstersText(this._nParam3).n;
         break;
      case 715:
         _loc3_[0] = this.api.lang.getMonstersSuperRaceText(this._nParam1).n;
         break;
      case 716:
         _loc3_[0] = this.api.lang.getMonstersRaceText(this._nParam1).n;
         break;
      case 717:
         _loc3_[0] = this.api.lang.getMonstersText(this._nParam1).n;
         break;
      case 805:
      case 808:
      case 983:
         this._nParam3 = this._nParam3 != undefined ? this._nParam3 : 0;
         var _loc16_ = String(Math.floor(this._nParam2) / 100).split(".");
         var _loc10_ = Number(_loc16_[0]);
         var _loc15_ = this._nParam2 - _loc10_ * 100;
         var _loc14_ = String(Math.floor(this._nParam3) / 100).split(".");
         var _loc9_ = Number(_loc14_[0]);
         var _loc13_ = this._nParam3 - _loc9_ * 100;
         _loc3_[0] = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.getConfigText("DATE_FORMAT"),[this._nParam1,new _global.palmad.ank.utils.ExtendedString(_loc10_ + 1).addLeftChar("0",2),new _global.palmad.ank.utils.ExtendedString(_loc15_).addLeftChar("0",2),_loc9_,new _global.palmad.ank.utils.ExtendedString(_loc13_).addLeftChar("0",2)]);
         break;
      case 806:
         if(this._nParam2 == undefined && this._nParam3 == undefined)
         {
            _loc3_[0] = this.api.lang.getText("NORMAL");
         }
         else
         {
            _loc3_[0] = this._nParam2 <= 6 ? (this._nParam3 <= 6 ? this.api.lang.getText("NORMAL") : this.api.lang.getText("LEAN")) : this.api.lang.getText("FAT");
         }
         break;
      case 807:
         if(this._nParam3 == undefined)
         {
            _loc3_[0] = this.api.lang.getText("NO_LAST_MEAL");
         }
         else
         {
            _loc3_[0] = this.api.lang.getItemUnicText(this._nParam3).n;
         }
         break;
      case 814:
         _loc3_[0] = this.api.lang.getItemUnicText(this._nParam3).n;
         break;
      case 915:
         _loc3_[0] = this.api.lang.getItemUnicText(this._nParam3).n;
         break;
      case 950:
      case 951:
         _loc3_[2] = this.api.lang.getStateText(this._nParam3);
         break;
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_AP_COST:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_RANGE:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_RANGEABLE:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_DMG:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_HEAL:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_AP_COST:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CAST_INTVL:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_SET_INTVL:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CC:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_CASTOUTLINE:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_NOLINEOFSIGHT:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_MAXPERTURN:
      case dofus["\x0b\b"].SpellsBoostsManager.ACTION_BOOST_SPELL_MAXPERTARGET:
         _loc3_[0] = this.api.lang.getSpellText(Number(_loc3_[0])).n;
         break;
      case 939:
      case 940:
         var _loc12_ = new dofus.datacenter["\f\f"](-1,Number(_loc3_[2]),1,0,"",0);
         _loc3_[2] = _loc12_.name;
         break;
      case 960:
         _loc3_[2] = this.api.lang.getAlignment(this._nParam3).n;
         break;
      case 999:
         break;
      case 1002:
         _loc2_[0] = this.api.lang.getItemUnicText(this._nParam3).n;
         break;
      case 1003:
         _loc2_[0] = this.api.lang.getItemTypeText(this._nParam3).n;
   }
   if(this.api.lang.getEffectText(this._nType).j && this.api.kernel.OptionsManager.getOption("ViewDicesDammages"))
   {
      var _loc4_ = this._sParam4.toLowerCase().split("d");
      _loc4_[1] = _loc4_[1].split("+");
      if(!(_loc4_[0] == undefined || (_loc4_[1] == undefined || (_loc4_[1][0] == undefined || _loc4_[1][0] == undefined))))
      {
         var _loc6_ = "";
         _loc6_ += !(_loc4_[0] != "0" && _loc4_[1][0] != "0") ? "" : _loc4_[0] + "d" + _loc4_[1][0];
         _loc6_ += _loc4_[1][1] == "0" ? "" : (_loc6_ == "" ? "" : "+") + _loc4_[1][1];
         _loc3_[0] = _loc6_;
         _loc3_[4] = _loc0_ = undefined;
         _loc3_[2] = _loc0_;
         _loc3_[1] = _loc0_;
      }
   }
   var _loc5_ = "";
   if(this._nPropability > 0 && this._nPropability != undefined)
   {
      _loc5_ += " - " + this.api.lang.getText("IN_CASE_PERCENT",[this._nPropability]) + ": ";
   }
   if(this._nType == 666)
   {
      _loc5_ += this.api.lang.getText("DO_NOTHING");
   }
   else
   {
      var _loc7_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(_loc17_,_loc3_);
      if(_loc7_ == null || _loc7_ == "null")
      {
         return new String();
      }
      if(_loc7_ != undefined)
      {
         _loc5_ += _loc7_;
      }
   }
   if(this._nModificator > 0 && this.api.kernel.SpellsBoostsManager.isBoostedHealingOrDamagingEffect(this._nType))
   {
      _loc5_ += " " + this.api.lang.getText("BOOSTED_SPELLS_EFFECT_COMPLEMENT",[this._nModificator]);
   }
   var _loc11_ = this.getTurnCountStr(false);
   if(_loc11_.length == 0)
   {
      return _loc5_;
   }
   return _loc5_ + " (" + _loc11_ + ")";
};
_loc1.__get__characteristic = function()
{
   return this.api.lang.getEffectText(this._nType).c;
};
_loc1.__get__operator = function()
{
   if(this._nParam3 != undefined && Number(this._nParam3) == 101211)
   {
      return "!";
   }
   return this.api.lang.getEffectText(this._nType).o;
};
_loc1.__get__element = function()
{
   return this.api.lang.getEffectText(this._nType).e;
};
_loc1.__get__spellName = function()
{
   return this.api.lang.getSpellText(this._nSpellID).n;
};
_loc1.__get__spellDescription = function()
{
   return this.api.lang.getSpellText(this._nSpellID).d;
};
_loc1.__get__showInTooltip = function()
{
   return this.api.lang.getEffectText(this._nType).t;
};
_loc1.initialize = function(sCasterID, mType, mParam1, mParam2, mParam3, mParam4, mRemainingTurn, mSpellID, nModificator)
{
   this.api = _global.API;
   this._nType = Number(mType);
   this._sCasterID = sCasterID;
   this._nParam1 = !_global.isNaN(Number(mParam1)) ? Number(mParam1) : undefined;
   this._nParam2 = !_global.isNaN(Number(mParam2)) ? Number(mParam2) : undefined;
   this._nParam3 = !_global.isNaN(Number(mParam3)) ? Number(mParam3) : undefined;
   this._sParam4 = mParam4;
   this._nRemainingTurn = mRemainingTurn != undefined ? Number(mRemainingTurn) : 0;
   if(this._nRemainingTurn < 0 || this._nRemainingTurn >= 63)
   {
      this._nRemainingTurn = Infinity;
   }
   this._nSpellID = Number(mSpellID);
   this._nModificator = Number(nModificator);
};
_loc1.getParamWithOperator = function(nParamID)
{
   var _loc2_ = this.operator != "-" ? 1 : -1;
   return this["_nParam" + nParamID] * _loc2_;
};
_loc1.getTurnCountStr = function(bShowLast)
{
   var _loc3_ = new String();
   if(this._nRemainingTurn == undefined)
   {
      return "";
   }
   if(_global.isFinite(this._nRemainingTurn))
   {
      if(this._nRemainingTurn > 1)
      {
         return String(this._nRemainingTurn) + " " + this.api.lang.getText("TURNS");
      }
      if(this._nRemainingTurn == 0)
      {
         return "";
      }
      if(bShowLast)
      {
         return this.api.lang.getText("LAST_TURN");
      }
      return String(this._nRemainingTurn) + " " + this.api.lang.getText("TURN");
   }
   return this.api.lang.getText("INFINIT");
};
_loc1.addProperty("element",_loc1.__get__element,function()
{
}
);
_loc1.addProperty("isNothing",_loc1.__get__isNothing,function()
{
}
);
_loc1.addProperty("remainingTurn",_loc1.__get__remainingTurn,_loc1.__set__remainingTurn);
_loc1.addProperty("spellDescription",_loc1.__get__spellDescription,function()
{
}
);
_loc1.addProperty("description",_loc1.__get__description,function()
{
}
);
_loc1.addProperty("characteristic",_loc1.__get__characteristic,function()
{
}
);
_loc1.addProperty("operator",_loc1.__get__operator,function()
{
}
);
_loc1.addProperty("spellName",_loc1.__get__spellName,function()
{
}
);
_loc1.addProperty("probability",_loc1.__get__probability,_loc1.__set__probability);
_loc1.addProperty("showInTooltip",_loc1.__get__showInTooltip,function()
{
}
);
_loc1.addProperty("remainingTurnStr",_loc1.__get__remainingTurnStr,function()
{
}
);
_loc1.addProperty("param1",_loc1.__get__param1,_loc1.__set__param1);
_loc1.addProperty("type",_loc1.__get__type,_loc1.__set__type);
_loc1.addProperty("param2",_loc1.__get__param2,_loc1.__set__param2);
_loc1.addProperty("param3",_loc1.__get__param3,_loc1.__set__param3);
_loc1.addProperty("param4",_loc1.__get__param4,_loc1.__set__param4);
_loc1.addProperty("spellID",_loc1.__get__spellID,function()
{
}
);
ASSetPropFlags(_loc1,null,1);
_loc1._nPropability = 0;
_loc1._nModificator = -1;
