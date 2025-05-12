if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.datacenter)
{
   _global.dofus.datacenter = new Object();
}
_global.dofus.datacenter.InventoryShortcutItem = function(nGenericID, _loc4_, _loc5_)
{
   super();
   this.api = _global.API;
   this._nGenericID = nGenericID;
   this._nPosition = _loc4_;
   this._sEffects = _loc5_;
   this._oUnicInfos = this.api.lang.getItemUnicText(nGenericID);
};
var _loc1 = dofus.datacenter.InventoryShortcutItem.prototype;
_loc1.__get__isShortcut = function()
{
   return true;
};
_loc1.__get__label = function()
{
   if(this.isRealItemEquiped)
   {
      return "Eq";
   }
   var _loc2_ = this.Quantity;
   if(_loc2_ > 1)
   {
      return String(_loc2_);
   }
   return undefined;
};
_loc1.findEquipedRealItem = function()
{
   var _loc3_ = this.api.datacenter.Player.InventoryByItemPositions.getItems();
   for(var _loc4_ in _loc3_)
   {
      var _loc2_ = _loc3_[_loc4_];
      if(_loc2_.unicID == this._nGenericID)
      {
         if(_loc2_.compressedEffects == this._sEffects)
         {
            return _loc2_;
         }
      }
   }
   return undefined;
};
_loc1.findRealItem = function()
{
   if(this._oRealItem != undefined)
   {
      if(!this._oRealItem.isEquiped)
      {
         var _loc6_ = this.findEquipedRealItem();
         if(_loc6_ != undefined)
         {
            this._oRealItem = _loc6_;
            return true;
         }
      }
      if(!this._oRealItem.isRemovedFromInventory)
      {
         return true;
      }
   }
   var _loc4_ = this.api.datacenter.Player.Inventory;
   for(var _loc5_ in _loc4_)
   {
      var _loc2_ = _loc4_[_loc5_];
      if(_loc2_.unicID == this._nGenericID)
      {
         if(_loc2_.compressedEffects == this._sEffects)
         {
            var _loc3_ = _loc2_;
            if(_loc2_.isEquiped)
            {
               break;
            }
         }
      }
   }
   var _loc7_ = _loc3_ != undefined;
   this._oRealItem = _loc3_;
   return _loc7_;
};
_loc1.__get__realLinkedItem = function()
{
   return !!this.findRealItem() ? this._oRealItem : undefined;
};
_loc1.__get__genericID = function()
{
   return this._nGenericID;
};
_loc1.__get__position = function()
{
   return this._nPosition;
};
_loc1.__get__effects = function()
{
   return this._sEffects;
};
_loc1.__get__type = function()
{
   return !!this.findRealItem() ? this._oRealItem.type : Number(this._oUnicInfos.t);
};
_loc1.__get__gfx = function()
{
   return !!this.findRealItem() ? this._oRealItem.gfx : this._oUnicInfos.g;
};
_loc1.__get__iconFile = function()
{
   return dofus.Constants.ITEMS_PATH + this.type + "/" + this.gfx + ".swf";
};
_loc1.__get__paramas = function()
{
   if(this.findRealItem())
   {
      return this._oRealItem.params;
   }
   return {frame:dofus.datacenter.InventoryShortcutItem.OBJI_DEFAULT_FRAME};
};
_loc1.__get__isRealItemEquiped = function()
{
   return !!this.findRealItem() ? this._oRealItem.isEquiped : false;
};
_loc1.__get__id = function()
{
   return !!this.findRealItem() ? this._oRealItem.ID : -1;
};
_loc1.__get__quantity = function()
{
   if(!this.findRealItem())
   {
      return 0;
   }
   return this._oRealItem.Quantity;
};
_loc1.__get__canUse = function()
{
   return this._oUnicInfos.u != undefined && this.findRealItem();
};
_loc1.__get__canTarget = function()
{
   return this._oUnicInfos.ut != undefined && this.findRealItem();
};
_loc1.__get__name = function()
{
   return ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.fetchString(this._oUnicInfos.n),this.api.lang.getItemUnicStringText());
};
_loc1.addProperty("params",_loc1.__get__paramas,function()
{
}
);
_loc1.addProperty("label",_loc1.__get__label,function()
{
}
);
_loc1.addProperty("ID",_loc1.__get__id,function()
{
}
);
_loc1.addProperty("Quantity",_loc1.__get__quantity,function()
{
}
);
_loc1.addProperty("iconFile",_loc1.__get__iconFile,function()
{
}
);
_loc1.addProperty("canUse",_loc1.__get__canUse,function()
{
}
);
_loc1.addProperty("gfx",_loc1.__get__gfx,function()
{
}
);
_loc1.addProperty("canTarget",_loc1.__get__canTarget,function()
{
}
);
_loc1.addProperty("isShortcut",_loc1.__get__isShortcut,function()
{
}
);
_loc1.addProperty("genericID",_loc1.__get__genericID,function()
{
}
);
_loc1.addProperty("isRealItemEquiped",_loc1.__get__isRealItemEquiped,function()
{
}
);
_loc1.addProperty("position",_loc1.__get__position,function()
{
}
);
_loc1.addProperty("compressedEffects",_loc1.__get__effects,function()
{
}
);
_loc1.addProperty("realLinkedItem",_loc1.__get__realLinkedItem,function()
{
}
);
_loc1.addProperty("name",_loc1.__get__name,function()
{
}
);
_loc1.addProperty("type",_loc1.__get__type,function()
{
}
);
ASSetPropFlags(_loc1,null,1);
dofus.datacenter.InventoryShortcutItem.OBJI_DEFAULT_FRAME = "H0";
