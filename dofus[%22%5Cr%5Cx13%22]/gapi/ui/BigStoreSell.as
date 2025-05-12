var _loc1 = dofus["\r\x14"].gapi.ui.BigStoreSell.prototype;
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.populateComboBox});
   this.addToQueue({object:this,method:this.setQuantityHeader});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.setAddMode,params:[false]});
   this.addToQueue({object:this,method:this.setRemoveMode,params:[false]});
   this.hideItemViewer(true);
};
_loc1.setQuantityHeader = function()
{
   this._dgPrices.columnsNames = ["","x" + this._oData.quantity1,"x" + this._oData.quantity2,"x" + this._oData.quantity3];
};
_loc1.hideItemViewer = function(_loc2_)
{
   this._itvItemViewer._visible = !_loc2_;
   this._winItemViewer._visible = !_loc2_;
   this._mcItemViewerDescriptionBack._visible = !_loc2_;
   this._srBottom._visible = !_loc2_;
   this._mcPrice._visible = !_loc2_;
   this._mcKamaSymbol._visible = !_loc2_;
   this._lblQuantity._visible = !_loc2_;
   this._lblQuantityValue._visible = !_loc2_;
   this._lblPrice._visible = !_loc2_;
   this._lblTaxTime._visible = !_loc2_;
   this._lblTaxTimeValue._visible = !_loc2_;
   this._cbQuantity._visible = !_loc2_;
   this._tiPrice._visible = !_loc2_;
   this._mcMiddlePrice._visible = !_loc2_;
   this._lblMiddlePrice._visible = !_loc2_;
   this._dgPrices._visible = !_loc2_;
   this._lblPriceInBigStore._visible = !_loc2_;
   if(_loc2_)
   {
      this._oSelectedItem = undefined;
   }
};
_loc1.setItemStats = function(oItem)
{
   var _loc2_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _loc2_.push(oItem);
   this._dgPrices.dataProvider = _loc2_;
};
_loc1.selectedItem = function(_loc2_)
{
   if(_loc2_.item == undefined)
   {
      this.hideItemViewer(true);
      this.setAddMode(false);
      this.setRemoveMode(false);
   }
   else
   {
      this._oSelectedItem = _loc2_.item;
      this.hideItemViewer(false);
      this._itvItemViewer.itemData = _loc2_.item;
      this.populateComboBox(_loc2_.item.Quantity);
      var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc4_.push(_loc2_.item);
      this._dgPrices.dataProvider = _loc4_;
      var _loc5_ = _loc2_.item.type;
      if(this._lblMiddlePrice.text != undefined)
      {
         this._lblMiddlePrice.text = "";
      }
      if(!this._oData.typesObj[_loc5_])
      {
         this.setAddMode(false);
         this.setRemoveMode(false);
         this.setBadItemMode(this.api.lang.getText("BIGSTORE_BAD_TYPE"));
      }
      else if(_loc2_.item.level > this._oData.maxLevel)
      {
         this.setAddMode(false);
         this.setRemoveMode(false);
         this.setBadItemMode(this.api.lang.getText("BIGSTORE_BAD_LEVEL"));
      }
      else
      {
         switch(_loc2_.target._name)
         {
            case "_livInventory":
               if(this._nQuantityIndex != undefined && this._cbQuantity.dataProvider.length >= this._nQuantityIndex)
               {
                  this._cbQuantity.selectedIndex = this._nQuantityIndex - 1;
               }
               else
               {
                  this._nQuantityIndex = undefined;
                  this._cbQuantity.selectedIndex = 0;
               }
               this.setRemoveMode(false);
               this.setAddMode(true);
               if(this._tiPrice.text != undefined)
               {
                  if(!_global.isNaN(this._nLastPrice))
                  {
                     this._tiPrice.text = String(this._nLastPrice);
                  }
                  else
                  {
                     this._tiPrice.text = "";
                  }
               }
               this._livInventory2.setFilter(this._livInventory.currentFilterID);
               this._tiPrice.setFocus();
               this.refreshRemoveButton();
               break;
            case "_livInventory2":
               this._lblQuantityValue.text = "x" + String(_loc2_.item.Quantity);
               this.setAddMode(false);
               this.setRemoveMode(true);
               this._tiPrice.text = _loc2_.item.price;
               this._livInventory.setFilter(this._livInventory2.currentFilterID);
               this._lblTaxTimeValue.text = _loc2_.item.remainingHours + "h";
               var _loc6_ = _loc2_.targets.length;
               this.refreshRemoveButton(_loc6_);
         }
         this.api.network.Exchange.bigStoreItemList(_loc2_.item.unicID);
         this.api.network.Exchange.getItemMiddlePriceInBigStore(_loc2_.item.unicID);
      }
   }
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_btnRemove":
         var _loc3_ = this._livInventory2.lstInventory.getSelectedItems();
         if(_loc3_.length == 0 && this._oSelectedItem == undefined)
         {
            break;
         }
         if(_loc3_.length == 0)
         {
            _loc3_.push(this._oSelectedItem);
         }
         this.remove(_loc3_);
         this.hideItemViewer(true);
         this.setRemoveMode(false);
         this._btnAdd._visible = false;
         break;
      case "_btnAdd":
         var _loc4_ = Number(this._tiPrice.text);
         var _loc5_ = Number(this._cbQuantity.selectedItem.index);
         if(_global.isNaN(_loc4_) || _loc4_ == 0)
         {
            this.gapi.loadUIComponent("AskOk","AksOkBadPrice",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("ERROR_INVALID_PRICE")});
         }
         else if(_global.isNaN(_loc5_) || _loc5_ == 0)
         {
            this.gapi.loadUIComponent("AskOk","AksOkBadQuantity",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("ERROR_INVALID_QUANTITY")});
         }
         else
         {
            this.askSell(this._oSelectedItem,_loc5_,_loc4_);
         }
         break;
      case "_btnClose":
         this.callClose();
         break;
      case "_btnSwitchToBuy":
         this.api.network.Exchange.request(11,this._oData.npcID);
         break;
      case "_btnFilterSell":
         this.enableFilter(this._btnFilterSell.selected);
   }
};
_loc1.askSell(_loc2_,_loc3_,_loc4_);
var _loc5_ = this._oData["quantity" + _loc3_];
var _loc6_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoSell",{title:this.api.lang.getText("BIGSTORE"),text:this.api.lang.getText("DO_U_SELL_ITEM_BIGSTORE",["x" + _loc5_ + " " + _loc2_.name,_loc4_]),params:{item:_loc2_,itemQuantity:_loc2_.Quantity,quantity:_loc5_,quantityIndex:_loc3_,price:_loc4_}});
_loc6_.addEventListener("yes",this);
_loc1.yes = function(_loc2_)
{
   this._nQuantityIndex = _loc2_.target.params.quantityIndex;
   this.api.network.Exchange.movementItem(true,_loc2_.target.params.item,_loc2_.target.params.quantityIndex,_loc2_.target.params.price);
   this.api.network.Exchange.bigStoreItemList(_loc2_.target.params.item.unicID);
   if(_loc2_.target.params.itemQuantity - _loc2_.target.params.quantity < _loc2_.target.params.quantity)
   {
      this.setAddMode(false);
      this.hideItemViewer(true);
   }
   else
   {
      this.populateComboBox(_loc2_.target.params.itemQuantity - _loc2_.target.params.quantity);
   }
};
