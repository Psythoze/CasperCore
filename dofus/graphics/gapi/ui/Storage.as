var _loc1 = dofus["\r\x14"].gapi.ui.Storage.prototype;
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._ivInventoryViewer.addEventListener("selectedItem",this);
   this._ivInventoryViewer.addEventListener("dblClickItem",this);
   this._ivInventoryViewer.addEventListener("dropItem",this);
   this._ivInventoryViewer.addEventListener("dragKama",this);
   this._ivInventoryViewer2.addEventListener("selectedItem",this);
   this._ivInventoryViewer2.addEventListener("dblClickItem",this);
   this._ivInventoryViewer2.addEventListener("dropItem",this);
   this._ivInventoryViewer2.addEventListener("dragKama",this);
   this._btnMoveAll.addEventListener("click",this);
   this._btnTransfertToRight.addEventListener("click",this);
   if(this._oData != undefined)
   {
      this._oData.addEventListener("modelChanged",this);
   }
};
_loc1.initTexts = function()
{
   this._winInventory.title = this.api.datacenter.Player.data.name;
   if(this._bMount != true)
   {
      this._winInventory2.title = this.api.lang.getText("STORAGE");
   }
   else
   {
      this._winInventory2.title = this.api.lang.getText("MY_MOUNT");
   }
   this._btnMoveAll.label = this.api.lang.getText("MOVE_ALL");
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnMoveAll":
         var _loc7_ = new Array();
         for(var _loc9_ in this._ivInventoryViewer._cgGrid.dataProvider)
         {
            var _loc3_ = this._ivInventoryViewer._cgGrid.dataProvider[_loc9_];
            _loc7_.push({Add:true,ID:_loc3_.ID,Quantity:_loc3_.Quantity});
         }
         this.api.network.Exchange.movementItems(_loc7_);
         break;
      case "_btnTransfertToRight":
         var _loc8_ = new Array();
         var _loc10_ = 0;
         for(_loc9_ in this._ivInventoryViewer2._cgGrid.dataProvider)
         {
            var _loc2_ = this._ivInventoryViewer2._cgGrid.dataProvider[_loc9_];
            _loc8_.push({Add:false,ID:_loc2_.ID,Quantity:_loc2_.Quantity});
         }
         this.api.network.Exchange.movementItems(_loc8_);
         break;
      case "_btnClose":
         this.callClose();
   }
};
_loc1.out = function(_loc2_)
{
   this.api.ui.hideTooltip();
};
_loc1.moveItems = function(_loc2_, _loc3_)
{
   var _loc8_ = new Array();
   var _loc2_ = 0;
   while(_loc2_ < _loc2_.length)
   {
      var _loc3_ = _loc2_[_loc2_];
      _loc8_.push({Add:_loc3_,ID:_loc3_.ID,Quantity:_loc3_.Quantity});
      _loc2_ += 1;
   }
   this.api.network.Exchange.movementItems(_loc8_);
};
_loc1.moveItem = function(_loc2_, _loc3_, _loc4_)
{
   var _loc3_ = _loc2_.Quantity;
   var _loc2_ = 1;
   if(_loc4_)
   {
      _loc2_ = _loc3_;
   }
   this.api.network.Exchange.movementItem(_loc3_,_loc2_,_loc2_);
};
_loc1.storageUsersCount = function(_loc2_)
{
};
