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
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
_global.dofus["\r\x14"].gapi.ui.PopupQuantityWithDescription = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.PopupQuantityWithDescription.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.ui.PopupQuantityWithDescription.prototype;
_loc1.__set__value = function(_loc2_)
{
   this._nValue = _loc2_;
};
_loc1.__set__max = function(_loc2_)
{
   this._nMax = _loc2_;
};
_loc1.__set__min = function(_loc2_)
{
   this._nMin = _loc2_;
};
_loc1.__set__useAllStage = function(_loc2_)
{
   this._bUseAllStage = _loc2_;
};
_loc1.__set__isMaxButtonValidationEnabled = function(bMaxButtonValidationEnabled)
{
   this._bMaxButtonValidationEnabled = bMaxButtonValidationEnabled;
};
_loc1.__set__descriptionLangKey = function(sDescriptionLangKey)
{
   this._sDescriptionLangKey = sDescriptionLangKey;
};
_loc1.__set__descriptionLangKeyParams = function(aDescriptionLangKeyParams)
{
   this._aDescriptionLangKeyParams = aDescriptionLangKeyParams;
};
_loc1.refreshDescription = function()
{
   if(this._sDescriptionLangKey == undefined)
   {
      return undefined;
   }
   var _loc7_ = this._winBackground.content;
   if(this._aDescriptionLangKeyParams == undefined)
   {
      var _loc4_ = undefined;
   }
   else
   {
      _loc4_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < this._aDescriptionLangKeyParams.length)
      {
         var _loc2_ = this._aDescriptionLangKeyParams[_loc3_];
         if(_loc2_ instanceof Function)
         {
            var _loc5_ = _loc2_;
            _loc4_.push(_loc5_.apply(this,[this._nMin,this._nMax,this._nValue]));
         }
         else
         {
            switch(_loc2_)
            {
               case "value":
                  _loc4_.push(this._nValue);
                  break;
               case "min":
                  _loc4_.push(this._nMin);
                  break;
               case "max":
                  _loc4_.push(this._nMax);
                  break;
               default:
                  _loc4_.push(_loc2_);
            }
         }
         _loc3_ += 1;
      }
   }
   var _loc6_ = this.api.lang.getText(this._sDescriptionLangKey,_loc4_);
   return _loc6_;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.PopupQuantityWithDescription.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._winBackground.addEventListener("complete",this);
   this._bgHidder.addEventListener("click",this);
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
};
_loc1.initWindowContent = function()
{
   var _loc2_ = this._winBackground.content;
   _loc2_._btnOk.addEventListener("click",this);
   _loc2_._btnMax.addEventListener("click",this);
   _loc2_._btnMin.addEventListener("click",this);
   _loc2_._tiInput.addEventListener("change",this);
   _loc2_._btnMax.label = this.api.lang.getText("MAX_WORD");
   _loc2_._btnMin.label = this.api.lang.getText("MIN_WORD");
   _loc2_._tiInput.restrict = "0-9";
   _loc2_._tiInput.text = this._nValue;
   _loc2_._lblDescription.text = this.refreshDescription();
   _loc2_._tiInput.setFocus();
};
_loc1.placeWindow = function()
{
   var _loc3_ = this._xmouse - this._winBackground.width;
   var _loc2_ = this._ymouse - this._winBackground._height;
   var _loc5_ = Stage.width;
   var _loc4_ = Stage.height;
   if(_loc3_ < 0)
   {
      _loc3_ = 0;
   }
   if(_loc2_ < 0)
   {
      _loc2_ = 0;
   }
   if(_loc3_ > _loc5_ - this._winBackground.width)
   {
      _loc3_ = _loc5_ - this._winBackground.width;
   }
   if(_loc2_ > _loc4_ - this._winBackground.height)
   {
      _loc2_ = _loc4_ - this._winBackground.height;
   }
   else
   {
      _loc2_ = (_loc2_ - this._ymouse) / 1.5 * -1;
   }
   this._winBackground._x = _loc3_;
   this._winBackground._y = _loc2_;
};
_loc1.validate = function()
{
   this.api.kernel.KeyManager.removeShortcutsListener(this);
   this.dispatchEvent({type:"validate",value:_global.parseInt(this._winBackground.content._tiInput.text,10),params:this._oParams});
};
_loc1.complete = function(_loc2_)
{
   this.placeWindow();
   this.addToQueue({object:this,method:this.initWindowContent});
   this.refreshDescription();
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_btnOk":
         this.validate();
         this.unloadThis();
         break;
      case "_btnMax":
         if(this._nValue == this._nMax)
         {
            this.validate();
            this.unloadThis();
            break;
         }
         this._winBackground.content._tiInput.text = this._nMax;
         this._winBackground.content._tiInput.setFocus();
         break;
      case "_btnMin":
         this._winBackground.content._tiInput.text = this._nMin;
         this._winBackground.content._tiInput.setFocus();
         break;
      case "_bgHidder":
         this.unloadThis();
   }
};
_loc1.onShortcut = function(_loc2_)
{
   if(_loc2_ == "ACCEPT_CURRENT_DIALOG")
   {
      this.validate();
      this.unloadThis();
      return false;
   }
   return true;
};
_loc1.change = function(_loc3_)
{
   super.change(_loc3_);
   var _loc3_ = this._winBackground.content;
   if(_loc3_._tiInput.text > this._nMax)
   {
      _loc3_._tiInput.text = this._nMax;
   }
   this._nValue = _loc3_._tiInput.text;
   _loc3_._lblDescription.text = this.refreshDescription();
};
_loc1.addProperty("descriptionLangKey",function()
{
}
,_loc1.__set__descriptionLangKey);
_loc1.addProperty("descriptionLangKeyParams",function()
{
}
,_loc1.__set__descriptionLangKeyParams);
_loc1.addProperty("value",function()
{
}
,_loc1.__set__value);
_loc1.addProperty("max",function()
{
}
,_loc1.__set__max);
_loc1.addProperty("useAllStage",function()
{
}
,_loc1.__set__useAllStage);
_loc1.addProperty("min",function()
{
}
,_loc1.__set__min);
_loc1_.addProperty("isMaxButtonValidationEnabled",function()
{
}
,_loc1.__set__isMaxButtonValidationEnabled);
_loc1._sDescriptionLangKey = "";
_loc1._aDescriptionLangKeyParams = "";
_loc1._nValue = 0;
_loc1._bUseAllStage = false;
_loc1._nMax = 1;
_loc1._nMin = 1;
_loc1._bMaxButtonValidationEnabled = false;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.PopupQuantityWithDescription.CLASS_NAME = "PopupQuantityWithDescription";
