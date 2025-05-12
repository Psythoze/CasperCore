var _loc1 = dofus["\r\x14"].gapi.controls.ItemViewer.prototype;
_loc1.__set__displayPrice = function(bDisplayPrice)
{
   this._bPrice = bDisplayPrice;
   this._lblPrice._visible = bDisplayPrice;
   this._ldrPago._visible = bDisplayPrice;
};
_loc1.__get__displayPrice = function()
{
   return this._bPrice;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this._btnTabCharacteristics._visible = false;
   this._pbEthereal._visible = false;
   this._ldrTwoHanded._visible = false;
   if(dofus.Constants.DEBUG || _global.CONFIG.skipLanguageVerification)
   {
      this._btnAgregar._visible = true;
      this._btnModificar._visible = true;
   }
   else
   {
      this._btnAgregar._visible = false;
      this._btnModificar._visible = false;
   }
};
_loc1.addListeners = function()
{
   this._btnAction.addEventListener("click",this);
   this._btnAction.addEventListener("over",this);
   this._btnAction.addEventListener("out",this);
   this._btnAgregar.addEventListener("click",this);
   this._btnUnlink.addEventListener("click",this);
   this._btnModificar.addEventListener("click",this);
   this._btnTabEffects.addEventListener("click",this);
   this._btnTabCharacteristics.addEventListener("click",this);
   this._btnTabConditions.addEventListener("click",this);
   this._pbEthereal.addEventListener("over",this);
   this._pbEthereal.addEventListener("out",this);
   this._ldrTwoHanded.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._ldrTwoHanded.onRollOut = function()
   {
      this._parent.out({target:this});
   };
   this._ldrPago.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._ldrPago.onRollOut = function()
   {
      this._parent.out({target:this});
   };
};
_loc1.showItemData = function(oItem)
{
   if(oItem != undefined)
   {
      this._lblName.text = oItem.name;
      if(dofus.Constants.DEBUG)
      {
         this._lblName.text += " (" + oItem.unicID + ")";
      }
      if(oItem.style == "")
      {
         this._lblName.styleName = "WhiteLeftMediumBoldLabel";
      }
      else
      {
         this._lblName.styleName = oItem.style + "LeftMediumBoldLabel";
      }
      var _loc7_ = "";
      if(this._ldrPago._visible)
      {
         if(oItem.itemPago > 0)
         {
            this._sPago = this.api.lang.getText("OGRINAS");
            this._ldrPago.contentPath = "OgrinaSymbol";
         }
         else if(oItem.chapa > 0)
         {
            var _loc4_ = this.api.lang.getItemUnicText(oItem.chapa);
            this._sPago = _loc4_.n;
            var _loc2_ = _loc4_.g;
            var _loc6_ = _loc4_.t;
            _loc7_ = "x " + _loc4_.n;
            if(_loc2_.length > 3)
            {
               _loc6_ = _loc2_.substr(0,_loc2_.length - 3);
               _loc2_ = _loc2_.substr(_loc2_.length - 3);
               while(_loc2_.charAt(0) == "0")
               {
                  _loc2_ = _loc2_.substr(1);
               }
            }
            this._ldrPago.contentPath = dofus.Constants.ITEMS_PATH + _loc6_ + "/" + _loc2_ + ".swf";
         }
         else
         {
            this._sPago = this.api.lang.getText("KAMAS");
            this._ldrPago.contentPath = "KamaSymbol";
         }
      }
      this._lblLevel.text = this.api.lang.getText("LEVEL_SMALL") + oItem.level;
      this._txtDescription.text = oItem.description;
      this._ldrIcon.contentParams = oItem.params;
      this._ldrIcon.contentPath = oItem.iconFile;
      if(this._bPrice)
      {
         this._mcDoplonSymbol.contentPath = "clips/items/" + oItem.priceType.t + "/" + oItem.priceType.g + ".swf";
         if(oItem.priceType == undefined)
         {
            this._mcKamaSymbol._visible = true;
            this._mcDoplonSymbol._visible = false;
         }
         else
         {
            this._mcKamaSymbol._visible = false;
            this._mcDoplonSymbol._visible = true;
            if(!this._mcDoplonSymbol.loaded)
            {
               this._mcDoplonSymbol.load();
            }
         }
      }
      this.bShowBaseEffects = false;
      this.updateCurrentTabInformations();
      if(oItem.superType == 2)
      {
         this._btnTabCharacteristics._visible = true;
      }
      else
      {
         if(this._sCurrentTab == "Characteristics")
         {
            this.setCurrentTab("Effects");
         }
         this._btnTabCharacteristics._visible = false;
      }
      if(oItem.price == undefined || oItem.price == -1)
      {
         this._ldrPago._visible = false;
      }
      this._lblPrice.text = oItem.price != undefined ? this.api.lang.getText("UNIT_PRICE") + " : " + new ank["\x1e\n\x07"]["\x0e\x1c"](oItem.price).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + _loc7_ : "";
      this._lblWeight.text = oItem.weight + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this._parent.api.lang.getText("PODS"),"m",oItem.weight < 2);
      if(oItem.isEthereal)
      {
         var _loc5_ = oItem.etherealResistance;
         this._pbEthereal.maximum = _loc5_.param3;
         this._pbEthereal.value = _loc5_.param2;
         this._pbEthereal._visible = true;
         if(_loc5_.param2 < 4)
         {
            this._pbEthereal.styleName = "EtherealCriticalProgressBar";
         }
         else
         {
            this._pbEthereal.styleName = "EtherealNormalProgressBar";
         }
      }
      else
      {
         this._pbEthereal._visible = false;
      }
      this._ldrTwoHanded._visible = oItem.needTwoHands;
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblLevel.text = "";
      this._txtDescription.text = "";
      this._ldrIcon.contentPath = "";
      this._lstInfos.removeAll();
      this._lblPrice.text = "";
      this._lblWeight.text = "";
      this._pbEthereal._visible = false;
      this._ldrTwoHanded._visible = false;
      this._ldrPago._visible = false;
   }
   if(this._oItem.compressedEffects.indexOf("3f8") != -1)
   {
      this._lblName.styleName = "LeftMediumBoldLabelLeg";
   }
   if(this._oItem.compressedEffects.indexOf("3f7") != -1)
   {
      this._lblName.styleName = "LeftMediumBoldLabelRare";
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnAgregar":
         var _loc10_ = this._oItem.compressedEffects;
         if(_loc10_ == undefined)
         {
            _loc10_ = "";
         }
         if(_loc10_.length > 0)
         {
            _loc10_ += ",";
         }
         _loc10_ += "6f#1#0#0#0d0+1";
         this._oItem.setEffects(_loc10_);
         this.updateCurrentTabInformations();
         break;
      case "_btnModificar":
         this.actualizarStats();
         break;
      case "_btnTabEffects":
         if(this._sCurrentTab == "Effects")
         {
            var _loc16_ = this["_btnTab" + this._sCurrentTab];
            _loc16_.selected = false;
            if(this._bShowBaseEffects)
            {
               this.updateCurrentTabInformations();
            }
            else
            {
               var _loc15_ = this.api.lang.getItemStats(this._oItem.unicID);
               if(_loc15_ != undefined)
               {
                  var _loc11_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
                  var _loc12_ = new Array();
                  var _loc9_ = _loc15_.split(",");
                  var _loc5_ = 0;
                  while(_loc5_ < _loc9_.length)
                  {
                     var _loc4_ = _loc9_[_loc5_].split("#");
                     _loc4_[0] = _global.parseInt(_loc4_[0],16);
                     _loc4_[1] = _loc4_[1] == "0" ? undefined : _global.parseInt(_loc4_[1],16);
                     _loc4_[2] = _loc4_[2] == "0" ? undefined : _global.parseInt(_loc4_[2],16);
                     _loc4_[3] = _loc4_[3] == "0" ? undefined : _global.parseInt(_loc4_[3],16);
                     _loc12_.push(_loc4_);
                     _loc5_ += 1;
                  }
                  var _loc6_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc12_);
                  for(var _loc13_ in _loc6_)
                  {
                     if(_loc6_[_loc13_].description.length > 0)
                     {
                        _loc11_.push(_loc6_[_loc13_]);
                     }
                  }
                  _loc11_.reverse();
                  this._lstInfos.dataProvider = _loc11_;
               }
            }
            this._bShowBaseEffects = !this._bShowBaseEffects;
         }
         else
         {
            this.setCurrentTab("Effects");
         }
         break;
      case "_btnTabCharacteristics":
         this.setCurrentTab("Characteristics");
         break;
      case "_btnTabConditions":
         this.setCurrentTab("Conditions");
         break;
      case "_btnUnlink":
         if(this.gapi.getUIComponent("Inventory") == undefined)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_BECAUSE_BUSY"),"ERROR_CHAT");
            break;
         }
         if(this._oItem.compressedEffects.indexOf("3cf") != -1 && this._parent._name == "Inventory")
         {
            this.dispatchEvent({type:"linkearItem",item:this._oItem});
         }
         break;
      case "_btnAction":
         var _loc7_ = this.api.ui.createPopupMenu();
         _loc7_.addStaticItem(this._oItem.name);
         if(this._oItem.compressedEffects.indexOf("7d012312312off") != -1)
         {
            _loc7_.addItem("Contenu",this.api.ui,this.api.ui.loadUIComponent,["Contenido","Contenido",{datos:this._oItem.unicID}]);
         }
         var _loc19_ = false;
         for(var _loc14_ in this._aFiltersType)
         {
            var _loc8_ = this._aFiltersType[_loc14_];
            if(_loc8_ == this._oItem.type)
            {
               _loc7_.addItem("Preview",this.api.ui,this.api.ui.loadUIComponent,["Preview","Preview",{item:this._oItem.unicID,type:this._oItem.type}]);
               break;
            }
         }
         if(this._bUseButton && this._oItem.canUse)
         {
            _loc7_.addItem(this._parent.api.lang.getText("CLICK_TO_USE"),this,this.dispatchEvent,[{type:"useItem",item:this._oItem}]);
         }
         _loc7_.addItem(this._parent.api.lang.getText("CLICK_TO_INSERT"),this.api.kernel.GameManager,this.api.kernel.GameManager.insertItemInChat,[this._oItem]);
         if(this._bTargetButton && this._oItem.canTarget)
         {
            _loc7_.addItem(this._parent.api.lang.getText("CLICK_TO_TARGET"),this,this.dispatchEvent,[{type:"targetItem",item:this._oItem}]);
         }
         _loc7_.addItem(this._parent.api.lang.getText("ASSOCIATE_RECEIPTS"),this.api.ui,this.api.ui.loadUIComponent,["ItemUtility","ItemUtility",{item:this._oItem}]);
         if(this._bDestroyButton)
         {
            if(this._oItem.canDestroy)
            {
               _loc7_.addItem(this._parent.api.lang.getText("CLICK_TO_DESTROY"),this,this.dispatchEvent,[{type:"destroyItem",item:this._oItem}]);
            }
            if(this._oItem.compressedEffects.indexOf("3cf") != -1 && this._parent._name == "Inventory")
            {
               _loc7_.addItem(this._parent.api.lang.getText("DISASSOCIATE_MIMOBIONTE"),this,this.dispatchEvent,[{type:"separarMimobionte",item:this._oItem}]);
            }
            if(this._oItem.compressedEffects.indexOf("3ee") != -1 && this._parent._name == "Inventory")
            {
               _loc7_.addItem("Déverrouiller l\'objet",this,this.dispatchEvent,[{type:"VerouilleObject",item:this._oItem}]);
            }
            else
            {
               _loc7_.addItem("Verrouiller l\'objet",this,this.dispatchEvent,[{type:"VerouilleObject",item:this._oItem}]);
            }
         }
         _loc7_.show(_root._xmouse,_root._ymouse);
   }
};
_loc1.actualizarStats = function()
{
   var _loc6_ = "";
   var _loc9_ = new Array();
   for(var _loc12_ in this._oItem.effects)
   {
      _loc9_.push(this._oItem.effects[_loc12_]);
   }
   for(_loc12_ in _loc9_)
   {
      var _loc3_ = _loc9_[_loc12_];
      if(_loc3_.description.length > 0)
      {
         if(_loc6_.length > 0)
         {
            _loc6_ += ",";
         }
         var _loc8_ = "";
         var _loc4_ = !_global.isNaN(_loc3_.param1) ? Number(_loc3_.param1) : 0;
         var _loc5_ = !_global.isNaN(_loc3_.param2) ? Number(_loc3_.param2) : 0;
         var _loc10_ = !_global.isNaN(_loc3_.param3) ? Number(_loc3_.param3) : 0;
         var _loc7_ = true;
         for(var _loc11_ in this.STAT_TEXTO)
         {
            if(_loc3_.type == _loc11_)
            {
               _loc7_ = false;
               break;
            }
         }
         if(_loc7_)
         {
            if(_loc4_ > 0)
            {
               if(_loc4_ >= _loc5_)
               {
                  _loc8_ = "#0d0+" + _loc4_;
               }
               else if(_loc4_ < _loc5_)
               {
                  _loc8_ = "#1d" + (_loc5_ - _loc4_ + 1) + "+" + (_loc4_ - 1);
               }
            }
         }
         _loc6_ += Number(_loc3_.type).toString(16) + "#" + Number(_loc4_).toString(16) + "#" + Number(_loc5_).toString(16) + "#" + Number(_loc10_).toString(16) + _loc8_;
      }
   }
   if(Number(this._oItem.ID) <= Number(0))
   {
      this._parent.api.network.send("BASET_STATS_MODELO " + this._oItem.unicID + " " + _loc6_);
   }
   else
   {
      this._parent.api.network.send("BASET_STATS_OBJETO " + this._oItem.ID + " " + _loc6_);
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_pbEthereal":
         var _loc2_ = this._oItem.etherealResistance;
         this.gapi.showTooltip(_loc2_.description,oEvent.target,-20);
         break;
      case "_ldrTwoHanded":
         this.gapi.showTooltip(this.api.lang.getText("TWO_HANDS_WEAPON"),this._ldrTwoHanded,-20);
         break;
      case "_ldrPago":
         this.gapi.showTooltip(this._sPago,this._ldrPago,-20);
   }
};
_loc1.modificarStat = function(oItem, oItem2)
{
   var _loc4_ = new Array();
   var _loc5_ = false;
   for(var _loc7_ in this._oItem.effects)
   {
      var _loc2_ = this._oItem.effects[_loc7_];
      if(!_loc5_ && _loc2_.type == oItem.type && _loc2_.param1 == oItem.param1)
      {
         if(oItem2 != undefined)
         {
            _loc4_.push([oItem2.type,oItem2.param1,oItem2.param2,oItem2.param3,oItem2.param4]);
         }
         _loc5_ = true;
      }
      else
      {
         _loc4_.push([_loc2_.type,_loc2_.param1,_loc2_.param2,_loc2_.param3,_loc2_.param4]);
      }
   }
   _loc4_.reverse();
   this._oItem.effects = _loc4_;
   this.updateCurrentTabInformations();
};
_loc1._sPago = "Kamas";
_loc1.addProperty("displayPrice",_loc1.__get__displayPrice,_loc1.__set__displayPrice);
_loc1._bShowBaseEffects = false;
_loc1._aFiltersType = [16,17,18,82];
_loc1.STAT_TEXTO = [7,10,146,148,188,197,201,221,222,229,230,333,335,501,513,600,602,603,604,605,612,613,614,615,616,620,622,624,627,640,641,642,643,645,647,648,649,669,699,700,701,705,710,715,716,717,720,724,725,730,731,751,760,765,791,795,800,805,806,807,808,810,811,813,814,825,900,901,902,905,915,930,931,932,933,934,935,936,937,939,940,946,947,948,949,950,960,961,962,963,964,970,971,972,973,974,983,985,986,987,988,989,990,994,996,997,998,999];
