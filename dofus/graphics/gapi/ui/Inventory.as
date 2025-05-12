var _loc1 = _global.dofus["\r\x14"].gapi.ui.Inventory.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Inventory.CLASS_NAME);
   this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Items");
   this.showCharacterPreview(this.api.kernel.OptionsManager.getOption("CharacterPreview"));
   this.showLivingItems(false);
   this.activaeliminar = false;
   this._windowInventoryRapidStuff._visible = false;
   this._tiSearch._visible = false;
   this._tiSearchFont._visible = false;
   this._btnQuitSearch._visible = false;
   this._ctr200._visible = false;
   this._ctr201._visible = false;
   this._ctr202._visible = false;
   this._ctr203._visible = false;
   this._ctr204._visible = false;
   this._ctr205._visible = false;
   this.tt._visible = false;
   this.cc._visible = false;
   this.bb._visible = false;
   this.cap._visible = false;
   this.ff._visible = false;
   this.dd._visible = false;
};
_loc1.OgrineChanged = function(_loc2_)
{
   this._lblOgrina.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.getFreeSlot = function(_loc2_)
{
   var _loc3_ = _loc2_.superType;
   var _loc2_ = 0;
   while(_loc2_ < dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_].length)
   {
      if(dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_][_loc2_] != "_ctr16")
      {
         if(this[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_][_loc2_]].contentData == undefined)
         {
            return this[dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE["type" + _loc3_][_loc2_]];
         }
      }
      _loc2_ += 1;
   }
   return undefined;
};
_loc1.createChildren = function()
{
   this._winBg.onRelease = 0;
   this._winBg.useHandCursor = false;
   this._winLivingItems.onRelease = 0;
   this._winLivingItems.useHandCursor = false;
   this.addToQueue({object:this,method:this.hideEpisodicContent});
   this.addToQueue({object:this,method:this.initFilter});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.hideItemViewer(true);
   this.hideItemSetViewer(true);
   this._ctrShield = this._ctr15;
   this._ctrWeapon = this._ctr1;
   this._ctrMount = this._ctr16;
   this._mcTwoHandedLink._visible = false;
   this._mcTwoHandedLink.stop();
   this._mcTwoHandedCrossLeft._visible = false;
   this._mcTwoHandedCrossRight._visible = false;
   Mouse.addListener(this);
   this.api.datacenter.Player.addEventListener("kamaChanged",this);
   this.api.datacenter.Player.addEventListener("OgrineChanged",this);
   this.api.datacenter.Player.addEventListener("mountChanged",this);
   this.api.datacenter.Player.addEventListener("nameChanged",this);
   this.addToQueue({object:this,method:this.kamaChanged,params:[{value:this.api.datacenter.Player.Kama}]});
   this.addToQueue({object:this,method:this.OgrineChanged,params:[{value:this.api.datacenter.Player.Ogrine}]});
   this.addToQueue({object:this,method:this.mountChanged});
   this.addToQueue({object:this,method:this.initTexts});
};
_loc1.sortInventory = function(sField)
{
   if(!sField)
   {
      return undefined;
   }
   this._cgGrid.dataProvider.sortOn(sField,Array.NUMERIC);
   this._sCurrentSort = sField;
   this._nLastProviderLen = this._cgGrid.dataProvider.length;
   this._nLastFilterID = this._nCurrentFilterID;
   this._cgGrid.modelChanged();
};
_loc1.change = function(oEvent)
{
   if(this._tiSearch.text.length >= 3)
   {
      this.searchItem(this._tiSearch.text.toUpperCase());
   }
   else
   {
      this.updateData(false);
   }
};
_loc1.showCharacterPreview = function(bShow)
{
   if(bShow)
   {
      this._winPreview._visible = true;
      this._svCharacterViewer._visible = true;
      this._mcItemSetViewerPlacer._x = this._mcBottomPlacer._x;
      this._mcItemSetViewerPlacer._y = this._mcBottomPlacer._y;
      this._isvItemSetViewer._x = this._mcBottomPlacer._x;
      this._isvItemSetViewer._y = this._mcBottomPlacer._y;
   }
   else
   {
      this._winPreview._visible = false;
      this._svCharacterViewer._visible = false;
      this._mcItemSetViewerPlacer._x = this._winPreview._x;
      this._mcItemSetViewerPlacer._y = this._winPreview._y;
      this._isvItemSetViewer._x = this._winPreview._x;
      this._isvItemSetViewer._y = this._winPreview._y;
   }
};
_loc1.searchItem = function(sText)
{
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = new Object();
   var _loc7_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < this._cgGridCopy.length)
   {
      var _loc6_ = this._cgGridCopy[_loc2_];
      var _loc3_ = this.searchWordsInName(_loc9_,_loc6_.name.toUpperCase(),_loc7_);
      if(_loc3_ != 0)
      {
         var _loc4_ = new Object();
         _loc4_.oWords = _loc3_;
         _loc4_.oItem = _loc6_;
         _loc5_[_loc2_] = _loc4_;
         _loc7_ = _loc3_;
      }
      _loc2_ += 1;
   }
   for(var _loc10_ in _loc5_)
   {
      if(_loc5_[_loc10_].oWords >= _loc7_)
      {
         _loc8_.push(_loc5_[_loc10_].oItem);
      }
   }
   this._cgGrid.dataProvider = _loc8_;
   this._lblSearchCount.text = _loc8_.length != 0 ? _loc8_.length + " " + ank.utils.PatternDecoder.combine(this.api.lang.getText("OBJECTS"),"m",_loc8_ < 2) : this.api.lang.getText("NO_BIGSTORE_SEARCH_RESULT");
   this._btnView.enabled = false;
};
_loc1.searchWordsInName = function(aWords, sName, nMaxWordsCount)
{
   var _loc2_ = 0;
   var _loc1_ = aWords.length;
   while(_loc1_ >= 0)
   {
      var _loc3_ = aWords[_loc1_];
      if(sName.indexOf(_loc3_) != -1)
      {
         _loc2_ += 1;
      }
      else if(_loc2_ + _loc1_ < nMaxWordsCount)
      {
         return 0;
      }
      _loc1_ -= 1;
   }
   return _loc2_;
};
_loc1.resetTwoHandClip = function()
{
   this._cgGridCopy = this._cgGrid.dataProvider.clone();
   this._ctrShield.content._alpha = 100;
   this._ctrWeapon.content._alpha = 100;
   this._mcTwoHandedLink.gotoAndStop(1);
   if(this.api.datacenter.Player.weaponItem.needTwoHands)
   {
      this._mcTwoHandedLink._visible = true;
      this._mcTwoHandedCrossLeft._visible = true;
      this._mcTwoHandedCrossRight._visible = false;
   }
   else
   {
      this._mcTwoHandedLink._visible = false;
      this._mcTwoHandedCrossLeft._visible = false;
      this._mcTwoHandedCrossRight._visible = false;
   }
};
_loc1.showSearchButton = function(oValue, oClick)
{
   if(oValue)
   {
      this._cbTypes._visible = false;
      this._btnQuitSearch._visible = true;
      this._btnSearch._visible = false;
      this._tiSearch._visible = true;
      this._tiSearchFont._visible = true;
      this._tiSearch.text = "";
      this._tiSearch.setFocus();
   }
   else
   {
      this._cbTypes._visible = true;
      this._btnQuitSearch._visible = false;
      this._btnSearch._visible = true;
      this._tiSearch.text = "";
      this._tiSearch._visible = false;
      this._tiSearchFont._visible = false;
   }
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addListeners = function()
{
   this._itvItemViewer.addEventListener("linkearItem",this);
   this._cgSets.addEventListener("overItem",this);
   this._cgSets.addEventListener("outItem",this);
   this._btnSearch.addEventListener("click",this);
   this._btnQuitSearch.addEventListener("click",this);
   this._tiSearch.addEventListener("change",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterCards.addEventListener("click",this);
   this._btnFilterCards.addEventListener("over",this);
   this._btnFilterCards.addEventListener("out",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgGrid.addEventListener("dblClickItem",this);
   this._btnCrear.addEventListener("click",this);
   this._btnNuevo.addEventListener("click",this);
   this._btnModificar.addEventListener("click",this);
   this._btnBorrar.addEventListener("click",this);
   this._btnUsar.addEventListener("click",this);
   this._btnMoreChoice.addEventListener("click",this);
   this._btnMoreChoice.addEventListener("over",this);
   this._btnMoreChoice.addEventListener("out",this);
   this._btnFilterSets.addEventListener("click",this);
   this._btnFilterSets.addEventListener("over",this);
   this._btnFilterSets.addEventListener("out",this);
   this._btnClose.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnFilterQuest.addEventListener("click",this);
   this._btnMultiEliminar.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnFilterQuest.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnFilterQuest.addEventListener("out",this);
   this._itvItemViewer.addEventListener("useItem",this);
   this._itvItemViewer.addEventListener("destroyItem",this);
   this._itvItemViewer.addEventListener("separarMimobionte",this);
   this._itvItemViewer.addEventListener("VerouilleObject",this);
   this._itvItemViewer.addEventListener("verContenido",this);
   this._itvItemViewer.addEventListener("targetItem",this);
   this._cbTypes.addEventListener("itemSelected",this);
   this._btnMimi.addEventListener("click",this);
   this._btnMimi.addEventListener("out",this);
   this._btnMimi.addEventListener("over",this);
   for(var _loc5_ in dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE)
   {
      var _loc4_ = dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE[_loc5_];
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         var _loc2_ = this[_loc4_[_loc3_]];
         _loc2_.addEventListener("over",this);
         _loc2_.addEventListener("out",this);
         if(_loc2_.toolTipText == undefined)
         {
            _loc2_.toolTipText = this.api.lang.getText(_loc2_ == this._ctrMount ? "MOUNT" : "INVENTORY_" + _loc5_.toUpperCase());
         }
         _loc3_ += 1;
      }
   }
};
_loc1.initTexts = function()
{
   this._lblWeight.text = this.api.lang.getText("WEIGHT");
   this._winPreview.title = this.api.lang.getText("CHARACTER_PREVIEW",[this.api.datacenter.Player.Name]);
   this._winBg.title = this.api.lang.getText("INVENTORY");
   this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
   this._lblNoItem.text = this.api.lang.getText("SELECT_ITEM");
   this._winLivingItems.title = this.api.lang.getText("MANAGE_ITEM");
   this._txtNombre.text = "";
   this._txtNombre.restrict = "0-9a-zA-Z ";
   this._txtNombre.maxChars = 20;
   this._txtInformacion.text = this.api.lang.getText("ITEMS_SETS_RAPIDO");
   this._txtIntro.text = this.api.lang.getText("INTRO_SETS_RAPIDO");
   this._txtIconos.text = this.api.lang.getText("ICONOS_SETS_RAPIDO");
   this._btnNuevo.label = this.api.lang.getText("NEW");
   this._btnCrear.label = this.api.lang.getText("SAVE");
   this._btnUsar.label = this.api.lang.getText("USE");
   this._btnModificar.label = this.api.lang.getText("MODIFY");
   this._btnBorrar.label = this.api.lang.getText("DELETE");
   this._btnMimi.label = "Mimi";
};
_loc1.dropDownItem = function()
{
   if(!this.api.datacenter.Player.checkCanMoveItem())
   {
      return undefined;
   }
   var _loc2_ = this.gapi.getCursor();
   if(!_loc2_.canDrop)
   {
      this.gapi.loadUIComponent("AskOk","AskOkCantDrop",{title:this.api.lang.getText("IMPOSSIBLE"),text:this.api.lang.getText("CANT_DROP_ITEM")});
      return undefined;
   }
   this.gapi.removeCursor();
   if(_loc2_.Quantity > 1)
   {
      var _loc3_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc2_.Quantity,params:{type:"drop",item:_loc2_}});
      _loc3_.addEventListener("validate",this);
   }
   else if(this.api.kernel.OptionsManager.getOption("ConfirmDropItem"))
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_DROP_ITEM"),"CAUTION_YESNO",{name:"ConfirmDropOne",params:{item:_loc2_},listener:this});
   }
   else
   {
      this.api.network.Items.drop(_loc2_.ID,1);
   }
};
_loc1.mostrarPanelSet = function(bMostrar)
{
   this._cgGrid._visible = !bMostrar;
   this._cgSets._visible = bMostrar;
   if(bMostrar)
   {
      this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
      this.actualizarContainers("");
   }
   this._btnNuevo._visible = bMostrar;
   this._txtIntro._visible = bMostrar;
   this._txtInformacion._visible = bMostrar;
   this._nIcono = 1;
   this._oSet = undefined;
   var _loc2_ = 0;
   while(_loc2_ <= 17)
   {
      this["_sctr" + _loc2_]._visible = bMostrar;
      this["_m" + _loc2_]._visible = bMostrar;
      _loc2_ = _loc2_ + 1;
   }
   if(!bMostrar)
   {
      this._txtIconos._visible = false;
      this._cgIconos._visible = false;
      this._btnCrear._visible = false;
      this._btnUsar._visible = false;
      this._btnModificar._visible = false;
      this._btnBorrar._visible = false;
      this._mBlanco._visible = false;
      this._txtNombre._visible = false;
   }
};
_loc1.selectItem = function(oEvent)
{
   if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && oEvent.target.contentData != undefined)
   {
      this.api.kernel.GameManager.insertItemInChat(oEvent.target.contentData);
   }
   else
   {
      if(oEvent.target.contentData.position == -1 && this.activaeliminar)
      {
         this.api.network.send("Od" + oEvent.target.contentData.ID + "|" + oEvent.target.contentData.Quantity + "|1");
         this.api.datacenter.Player.dropItem(oEvent.target.contentData.ID);
      }
      this.showItemInfos(oEvent.target.contentData);
      this.showLivingItems(oEvent.target.contentData.skineable == true);
      if(oEvent.target.contentData.skineable)
      {
         this._livItemViewer.itemData = oEvent.target.contentData;
      }
   }
};
_loc1.initFilter = function()
{
   switch(this.api.datacenter.Basics.inventory_filter)
   {
      case "sets":
         this._btnFilterSets.selected = true;
         this._btnSelectedFilterButton = this._btnFilterSets;
         this.mostrarPanelSet(true);
         break;
      case "nonequipement":
         this._btnFilterNonEquipement.selected = true;
         this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_NONEQUIPEMENT;
         this._btnSelectedFilterButton = this._btnFilterNonEquipement;
         this.mostrarPanelSet(false);
         break;
      case "resources":
         this._btnFilterRessoureces.selected = true;
         this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_RESSOURECES;
         this._btnSelectedFilterButton = this._btnFilterRessoureces;
         this.mostrarPanelSet(false);
         break;
      case "runes":
         this._btnFilterRunes.selected = true;
         this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
         this._btnSelectedFilterButton = this._btnFilterRunes;
         this.mostrarPanelSet(false);
         break;
      case "soul":
         this._btnFilterSoul.selected = true;
         this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
         this._btnSelectedFilterButton = this._btnFilterSoul;
         this.showCustomSet(false);
         break;
      case "cards":
         this._btnFilterCards.selected = true;
         this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
         this._btnSelectedFilterButton = this._btnFilterCards;
         this.showCustomSet(false);
         break;
      case "quest":
         this._btnFilterQuest.selected = true;
         this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_QUEST;
         this._btnSelectedFilterButton = this._btnFilterQuest;
         this.mostrarPanelSet(false);
         break;
      case "equipement":
      default:
         this._btnFilterEquipement.selected = true;
         this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_EQUIPEMENT;
         this._btnSelectedFilterButton = this._btnFilterEquipement;
         this.mostrarPanelSet(false);
   }
};
_loc1.actualizarContainers = function(sData)
{
   var _loc3_ = 0;
   while(_loc3_ <= 17)
   {
      this["_sctr" + _loc3_].contentData = undefined;
      _loc3_ = _loc3_ + 1;
   }
   if(sData == undefined || sData == "")
   {
      return undefined;
   }
   var _loc8_ = sData.split(";");
   for(var _loc9_ in _loc8_)
   {
      var _loc5_ = _loc8_[_loc9_].split(",");
      var _loc7_ = _global.parseInt(_loc5_[0]);
      var _loc6_ = _global.parseInt(_loc5_[1]);
      var _loc4_ = this.api.datacenter.Player.getObjeto(_loc7_);
      if(_loc4_ != undefined)
      {
         this["_sctr" + _loc6_].contentData = _loc4_.item;
      }
   }
};
_loc1.showSearch = function()
{
   var _loc2_ = this.gapi.loadUIComponent("InventorySearch","InventorySearch",{_oDataProvider:this._cgGrid.dataProvider});
   _loc2_.addEventListener("selected",this);
};
_loc1.getData = function()
{
   var _loc2_ = "";
   var _loc3_ = 0;
   while(_loc3_ <= 17)
   {
      var _loc4_ = this["_ctr" + _loc3_].contentData;
      if(_loc4_ != undefined)
      {
         if(_loc2_.length > 0)
         {
            _loc2_ += ";";
         }
         _loc2_ += _loc4_.ID + "," + _loc4_.position;
      }
      _loc3_ = _loc3_ + 1;
   }
   return _loc2_;
};
var §elementsVisible:Boolean§ = false;
_loc1.click = function(oEvent)
{
   if(oEvent.target == this._btnClose)
   {
      this.callClose();
      return undefined;
   }
   switch(oEvent.target._name)
   {
      case "_btnMimi":
         elementsVisible = !elementsVisible;
         this._ctr200._visible = elementsVisible;
         this._ctr201._visible = elementsVisible;
         this._ctr202._visible = elementsVisible;
         this._ctr203._visible = elementsVisible;
         this._ctr204._visible = elementsVisible;
         this._ctr205._visible = elementsVisible;
         this.tt._visible = elementsVisible;
         this.cc._visible = elementsVisible;
         this.bb._visible = elementsVisible;
         this.cap._visible = elementsVisible;
         this.ff._visible = elementsVisible;
         this.dd._visible = elementsVisible;
         this._ctr6._visible = !elementsVisible;
         this._ctr1._visible = !elementsVisible;
         this._ctr15._visible = !elementsVisible;
         this._ctr7._visible = !elementsVisible;
         this._ctr8._visible = !elementsVisible;
         this._ctr16._visible = !elementsVisible;
         this.t._visible = !elementsVisible;
         this.c._visible = !elementsVisible;
         this.b._visible = !elementsVisible;
         this.ca._visible = !elementsVisible;
         this.f._visible = !elementsVisible;
         this.d._visible = !elementsVisible;
         return undefined;
      case "_btnNuevo":
         if(this._cgSets.dataProvider.length >= 10)
         {
            return undefined;
         }
         this._cgIconos._visible = true;
         this._btnCrear._visible = true;
         this._mBlanco._visible = true;
         this._txtNombre._visible = true;
         this._txtIconos._visible = true;
         this._btnUsar._visible = false;
         this._btnModificar._visible = false;
         this._btnBorrar._visible = false;
         this.cargarIconos();
         var _loc4_ = 0;
         while(_loc4_ <= 17)
         {
            this["_sctr" + _loc4_].contentData = this["_ctr" + _loc4_].contentData;
            _loc4_ = _loc4_ + 1;
         }
         this._nIcono = 1;
         return undefined;
         break;
      case "_btnCrear":
         if(this._txtNombre.text == "")
         {
            return undefined;
         }
         this._txtIconos._visible = false;
         this._cgIconos._visible = false;
         this._btnCrear._visible = false;
         this._mBlanco._visible = false;
         this._txtNombre._visible = false;
         if(this._cgSets.dataProvider.length >= 10)
         {
            return undefined;
         }
         var _loc6_ = 0;
         var _loc3_ = 1;
         while(_loc3_ <= 12)
         {
            var _loc5_ = this.api.datacenter.Player.getSet(_loc3_);
            if(_loc5_ == undefined)
            {
               _loc6_ = _loc3_;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(_loc6_ == 0)
         {
            return undefined;
         }
         var _loc8_ = this.getData();
         var _loc10_ = {ID:_loc6_,name:this._txtNombre.text,icono:this._nIcono,iconFile:dofus.Constants.SETS_RAPIDOS_ICONS_PATH + this._nIcono + ".swf",data:_loc8_};
         this.api.datacenter.Player.addSet(_loc10_);
         this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
         this.api.network.send("ZSC" + _loc6_ + "|" + this._txtNombre.text + "|" + this._nIcono + "|" + _loc8_);
         return undefined;
         break;
      case "_btnModificar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         _loc8_ = this.getData();
         _loc10_ = {ID:this._oSet.ID,name:this._oSet.name,icono:this._oSet.icono,iconFile:this._oSet.iconFile,data:_loc8_};
         this.api.datacenter.Player.addSet(_loc10_);
         this.actualizarContainers(_loc8_);
         this.api.network.send("ZSC" + this._oSet.ID + "|" + this._oSet.name + "|" + this._oSet.icono + "|" + _loc8_);
         return undefined;
         break;
      case "_btnUsar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         this.api.network.send("ZSU" + this._oSet.ID);
         return undefined;
         break;
      case "_btnBorrar":
         if(this._oSet == undefined)
         {
            return undefined;
         }
         this._cgIconos._visible = false;
         this._btnCrear._visible = false;
         this._mBlanco._visible = false;
         this._txtNombre._visible = false;
         this._txtIconos._visible = false;
         this._btnUsar._visible = false;
         this._btnModificar._visible = false;
         this._btnBorrar._visible = false;
         this.api.datacenter.Player.removeSet(this._oSet.ID);
         this._cgSets.dataProvider = this.api.datacenter.Player.SetsRapidos;
         this.actualizarContainers("");
         this.api.network.send("ZSB" + this._oSet.ID);
         return undefined;
         break;
      default:
         if(this._mcArrowAnimation._visible)
         {
            this._mcArrowAnimation._visible = false;
         }
         if(oEvent.target == this._btnMoreChoice)
         {
            var _loc7_ = this.api.ui.createPopupMenu();
            _loc7_.addItem(this.api.lang.getText("INVENTORY_DATE_SORT"),this,this.sortInventory,["_itemDateId"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_NAME_SORT"),this,this.sortInventory,["_itemName"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_TYPE_SORT"),this,this.sortInventory,["_itemType"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_LEVEL_SORT"),this,this.sortInventory,["_itemLevel"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_POD_SORT"),this,this.sortInventory,["_itemWeight"]);
            _loc7_.addItem(this.api.lang.getText("INVENTORY_QTY_SORT"),this,this.sortInventory,["_nQuantity"]);
            _loc7_.show(_root._xmouse,_root._ymouse);
            return undefined;
         }
         if(oEvent.target != this._btnSelectedFilterButton)
         {
            this.api.sounds.events.onInventoryFilterButtonClick();
            this._btnSelectedFilterButton.selected = false;
            this._btnSelectedFilterButton = oEvent.target;
            switch(oEvent.target._name)
            {
               case "_btnFilterSets":
                  this._lblFilter.text = this.api.lang.getText("SETS_RAPIDOS");
                  this.mostrarPanelSet(true);
                  return undefined;
               case "_btnFilterEquipement":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_EQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
                  this.api.datacenter.Basics.inventory_filter = "equipement";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterNonEquipement":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_NONEQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
                  this.api.datacenter.Basics.inventory_filter = "nonequipement";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterRessoureces":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_RESSOURECES;
                  this._lblFilter.text = this.api.lang.getText("RESSOURECES");
                  this.api.datacenter.Basics.inventory_filter = "resources";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterRunes":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
                  this._lblFilter.text = this.api.lang.getText("RUNES");
                  this.api.datacenter.Basics.inventory_filter = "runes";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnFilterSoul":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
                  this._lblFilter.text = this.api.lang.getText("SOUL");
                  this.api.datacenter.Basics.inventory_filter = "soul";
                  this.showCustomSet(false);
                  break;
               case "_btnFilterCards":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
                  this._lblFilter.text = this.api.lang.getText("CARDS");
                  this.api.datacenter.Basics.inventory_filter = "cards";
                  this.showCustomSet(false);
                  break;
               case "_btnFilterQuest":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Inventory.FILTER_QUEST;
                  this._lblFilter.text = this.api.lang.getText("QUEST_OBJECTS");
                  this.api.datacenter.Basics.inventory_filter = "quest";
                  this.mostrarPanelSet(false);
                  break;
               case "_btnSearch":
                  this.showSearchButton(true);
                  break;
               case "_btnQuitSearch":
                  this.showSearchButton(false);
            }
            this.updateData(true);
         }
         else
         {
            oEvent.target.selected = true;
         }
   }
};
_loc1.elegirSet = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this._oSet = _loc2_;
   this.actualizarContainers(this._oSet.data);
   this._cgIconos._visible = false;
   this._btnCrear._visible = false;
   this._mBlanco._visible = false;
   this._txtNombre._visible = false;
   this._txtIconos._visible = false;
   this._btnUsar._visible = true;
   this._btnModificar._visible = true;
   this._btnBorrar._visible = true;
};
_loc1.elegirIcono = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   this._nIcono = _loc2_.index;
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnFilterSets:
         this.api.ui.showTooltip(this.api.lang.getText("SETS_RAPIDOS"),oEvent.target,-20);
         break;
      case this._btnFilterEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),oEvent.target,-20);
         break;
      case this._btnFilterNonEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),oEvent.target,-20);
         break;
      case this._btnFilterRessoureces:
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),oEvent.target,-20);
         break;
      case this._btnFilterQuest:
         this.api.ui.showTooltip(this.api.lang.getText("QUEST_OBJECTS"),oEvent.target,-20);
         break;
      case this._btnFilterRunes:
         this.api.ui.showTooltip(this.api.lang.getText("RUNES"),oEvent.target,-20);
         break;
      case this._btnFilterSoul:
         this.api.ui.showTooltip(this.api.lang.getText("SOUL"),oEvent.target,-20);
         break;
      case this._btnFilterCards:
         this.api.ui.showTooltip(this.api.lang.getText("CARDS"),_loc2_.target,-20);
         break;
      default:
         this.api.ui.showTooltip(oEvent.target.toolTipText,oEvent.target,-20);
   }
};
_loc1.cargarIconos = function()
{
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 1;
   while(_loc2_ <= 27)
   {
      var _loc3_ = new Object();
      _loc3_.iconFile = dofus.Constants.SETS_RAPIDOS_ICONS_PATH + _loc2_ + ".swf";
      _loc3_.index = _loc2_;
      _loc4_.push(_loc3_);
      _loc2_ = _loc2_ + 1;
   }
   this._cgIconos.dataProvider = _loc4_;
};
_loc1.showLivingItems = function(bShow)
{
   this._livItemViewer._visible = bShow;
   this._winLivingItems._visible = bShow;
   if(bShow)
   {
      this._mcItemSetViewerPlacer._x = this._mcBottomPlacer._x;
      this._mcItemSetViewerPlacer._y = this._mcBottomPlacer._y;
      this._isvItemSetViewer._x = this._mcBottomPlacer._x;
      this._isvItemSetViewer._y = this._mcBottomPlacer._y;
   }
   else
   {
      this.showCharacterPreview(this.api.kernel.OptionsManager.getOption("CharacterPreview"));
   }
};
_loc1.separarMimobionte = function(oEvent)
{
   this.api.network.send("Om" + oEvent.item.ID);
};
_loc1.linkearItem = function(oEvent)
{
   this.api.network.send("Om" + oEvent.item.ID);
};
_loc1.VerouilleObject = function(oEvent)
{
   this.api.network.send("OL" + oEvent.item.ID);
};
_loc1.verContenido = function(oEvent)
{
   this.api.ui.loadUIComponent("Contenido","Contenido",{datos:oEvent.item.ID});
};
_loc1._oSet = undefined;
_loc1._nIcono = 1;
