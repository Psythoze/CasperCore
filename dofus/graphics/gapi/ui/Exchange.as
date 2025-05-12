var _loc1 = dofus["\r\x14"].gapi.ui.Exchange.prototype;
var interval;
var list = "";
var size = 0;
var a = 0;
var active = false;
_loc1.__set__Taxt = function(taxt)
{
   this.TaxOg = taxt;
};
_loc1.__set__Min = function(taxt)
{
   this.MinOg = taxt;
};
_loc1.transfertToExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO+" + _loc2_);
   a += 1;
};
_loc1.transfertToNoExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO-" + _loc2_);
   a += 1;
};
_loc1.addListeners = function()
{
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgLocal.addEventListener("dblClickItem",this);
   this._cgLocal.addEventListener("dropItem",this);
   this._cgLocal.addEventListener("dragItem",this);
   this._tiSearch.addEventListener("change",this);
   this._cgLocal.addEventListener("selectItem",this);
   this._cgLocal.addEventListener("overItem",this);
   this._cgLocal.addEventListener("outItem",this);
   this._cgDistant.addEventListener("selectItem",this);
   this._cgDistant.addEventListener("overItem",this);
   this._cgDistant.addEventListener("outItem",this);
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterCards.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterCards.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterCards.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnTransfertToExchange.addEventListener("click",this);
   this._cgDistant.multipleContainerSelectionEnabled = false;
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnClose.addEventListener("click",this);
   this.api.datacenter.Exchange.addEventListener("localKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("distantKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("localOgrineChange",this);
   this.api.datacenter.Exchange.addEventListener("distantOgrineChange",this);
   this.api.datacenter.Player.addEventListener("playerOgrineChange",this);
   this._btnValidate.addEventListener("click",this);
   this._btnPrivateChat.addEventListener("click",this);
   this._cbTypes.addEventListener("itemSelected",this);
   this._lblOgrine.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._lblOgrine.onRollOut = function()
   {
      this._parent.out({target:this});
   };
};
_loc1.initTexts = function()
{
   this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
   this._winInventory.title = this.api.datacenter.Player.data.name;
   this._winDistant.title = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Exchange.distantPlayerID).name;
   this._btnValidate.label = this.api.lang.getText("ACCEPT");
   this._lblKama.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Kama).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._lblOgrine.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Ogrine).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._btnPrivateChat.label = this.api.lang.getText("WISPER_MESSAGE");
   this.updateOgrineTaxe(0);
   this._btnTransfertToExchange.label = this.api.lang.getText("FAST_TRANSFER");
};
_loc1.initData = function()
{
   this.dataProvider = this.api.datacenter.Exchange.inventory;
   this.localDataProvider = this.api.datacenter.Exchange.localGarbage;
   this.distantDataProvider = this.api.datacenter.Exchange.distantGarbage;
   this.readyDataProvider = this.api.datacenter.Exchange.readyStates;
};
_loc1.change = function(oEvent)
{
   if(this._tiSearch.text.length >= 2)
   {
      this.searchItem(this._tiSearch.text.toUpperCase());
   }
   else
   {
      this.updateData(false);
   }
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
_loc1.searchItem = function(sText)
{
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = new Object();
   var _loc7_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < this._cgGrid.dataProvider.length)
   {
      var _loc6_ = this._cgGrid.dataProvider[_loc2_];
      var _loc4_ = this.searchWordsInName(_loc9_,_loc6_.name.toUpperCase(),_loc7_);
      if(_loc4_ != 0)
      {
         var _loc3_ = new Object();
         _loc3_.oWords = _loc4_;
         _loc3_.oItem = _loc6_;
         _loc5_[_loc2_] = _loc3_;
         _loc7_ = _loc4_;
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
};
_loc1.validateOgrine = function(_loc2_)
{
   if(_loc2_ < this.MinOg && _loc2_ != 0)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_MIN_OGRINE_EXCHANGE"),"ERROR_CHAT");
      return undefined;
   }
   if(_loc2_ + this.getOgrineTaxe(_loc2_) > this.api.datacenter.Player.Ogrine)
   {
      _loc2_ = this.api.datacenter.Player.Ogrine - Math.round(this.api.datacenter.Player.Ogrine * this.TaxOg / 100);
   }
   this.api.network.Exchange.movementOgrine(_loc2_);
};
_loc1.askOgrineQuantity = function()
{
   var _loc2_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:this.api.datacenter.Exchange.localOgrine,max:this.api.datacenter.Player.Ogrine,min:this.MinOg,params:{targetType:"ogrine"}});
   _loc2_.addEventListener("validate",this);
};
_loc1.validate = function(_loc2_)
{
   switch(_loc2_.params.targetType)
   {
      case "item":
         this.validateDrop(_loc2_.params.targetGrid,_loc2_.params.oItem,_loc2_.value);
         break;
      case "kama":
         this.validateKama(_loc2_.value);
         break;
      case "ogrine":
         this.validateOgrine(_loc2_.value);
   }
};
_loc1.localOgrineChange = function(oEvent)
{
   this._lblLocalOgrine.text = new ank["\x1e\n\x07"]["\x0e\x1c"](oEvent.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this.hideButtonValidate(true);
   ank.utils.Timer.setTimer(this,"exchange",this,this.hideButtonValidate,dofus["\r\x14"].gapi.ui.Exchange.DELAY_BEFORE_VALIDATE,[false]);
   this.updateOgrineTaxe(oEvent.value);
   this._lblOgrine.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Ogrine - (oEvent.value + this.getOgrineTaxe(oEvent.value))).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this.onDataUpdated();
};
_loc1.distantOgrineChange = function(_loc2_)
{
   this._mcBlink.play();
   this._lblDistantOgrine.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this.hideButtonValidate(true);
   this.onDataUpdated();
};
_loc1.playerOgrineChange = function(_loc2_)
{
   this._lblOgrine.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2_.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnFilterEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),_loc2_.target,-20);
         break;
      case this._btnFilterNonEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),_loc2_.target,-20);
         break;
      case this._btnFilterRessoureces:
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),_loc2_.target,-20);
         break;
      case this._lblOgrine:
         this.api.ui.showTooltip(this.api.datacenter.Player.Ogrine,_loc2_.target,-20);
         break;
      case this._btnFilterSoul:
         this.api.ui.showTooltip(this.api.lang.getText("SOUL"),_loc2_.target,-20);
         break;
      case this._btnFilterRunes:
         this.api.ui.showTooltip(this.api.lang.getText("RUNES"),_loc2_.target,-20);
         break;
      case this._btnFilterCards:
         this.api.ui.showTooltip(this.api.lang.getText("CARDS"),_loc2_.target,-20);
   }
};
_loc1.dblClickItem = function(_loc2_)
{
   var _loc4_ = _loc2_.target.contentData;
   var _loc3_ = _loc2_.targets;
   if(_loc4_ == undefined)
   {
      return undefined;
   }
   var _loc5_ = Key.isDown(dofus.Constants.SELECT_MULTIPLE_ITEMS_KEY);
   var _loc6_ = !!_loc5_ ? _loc4_.Quantity : 1;
   var _loc7_ = _loc2_.owner._name;
   switch(_loc7_)
   {
      case "_cgGrid":
         if(_loc5_ && _loc3_.length > 1)
         {
            if(active == true)
            {
               clearInterval(interval);
               active = false;
            }
            else
            {
               for(_loc4_ in _loc3_)
               {
                  _loc2_ = _loc3_[_loc4_];
                  if(list.length > 0)
                  {
                     list += ";";
                  }
                  list += _loc2_.ID + "|" + _loc2_.Quantity;
               }
               list = list.split(";");
               size = list.length;
               interval = setInterval(this,"transfertToExchange",10);
               active = true;
            }
         }
         else
         {
            this.validateDrop("_cgLocal",_loc4_,_loc6_);
         }
         break;
      case "_cgLocal":
         if(_loc5_ && _loc3_.length > 1)
         {
            if(active == true)
            {
               clearInterval(interval);
               active = false;
            }
            else
            {
               for(_loc4_ in _loc3_)
               {
                  _loc2_ = _loc3_[_loc4_];
                  if(list.length > 0)
                  {
                     list += ";";
                  }
                  list += _loc2_.ID + "|" + _loc2_.Quantity;
               }
               list = list.split(";");
               size = list.length;
               interval = setInterval(this,"transfertToNoExchange",10);
               active = true;
            }
         }
         this.validateDrop("_cgGrid",_loc4_,_loc6_);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnTransfertToExchange":
         if(active == true)
         {
            clearInterval(interval);
            active = false;
         }
         else
         {
            for(var _loc3_ in this._cgGrid.dataProvider)
            {
               var _loc2_ = this._cgGrid.dataProvider[_loc3_];
               if(list.length > 0)
               {
                  list += ";";
               }
               list += _loc2_.ID + "|" + _loc2_.Quantity;
            }
            list = list.split(";");
            size = list.length;
            interval = setInterval(this,"transfertToExchange",200);
            active = true;
         }
         break;
      case "_btnClose":
         this.callClose();
         break;
      case "_btnValidate":
         this.api.network.Exchange.ready();
         break;
      case "_btnPrivateChat":
         if(this.api.datacenter.Exchange.distantPlayerID > 0)
         {
            this.api.kernel.GameManager.askPrivateMessage(this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Exchange.distantPlayerID).name);
         }
         break;
      default:
         if(oEvent.target != this._btnSelectedFilterButton)
         {
            this._btnSelectedFilterButton.selected = false;
            this._btnSelectedFilterButton = oEvent.target;
            switch(oEvent.target._name)
            {
               case "_btnFilterEquipement":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_EQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
                  break;
               case "_btnFilterNonEquipement":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Exchange.FILTER_NONEQUIPEMENT;
                  this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
                  break;
               case "_btnFilterRessoureces":
                  this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.Exchange.FILTER_RESSOURECES;
                  this._lblFilter.text = this.api.lang.getText("RESSOURECES");
                  break;
               case "_btnFilterSoul":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
                  this._lblFilter.text = this.api.lang.getText("SOUL");
                  break;
               case "_btnFilterRunes":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
                  this._lblFilter.text = this.api.lang.getText("RUNES");
                  break;
               case "_btnFilterCards":
                  this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
                  this._lblFilter.text = this.api.lang.getText("CARDS");
            }
            this.updateData(true);
            break;
         }
         oEvent.target.selected = true;
         break;
   }
};
_loc1.getOgrineTaxe = function(bOgrine)
{
   return Math.round(Number(bOgrine) * this.TaxOg / 100);
};
_loc1.updateOgrineTaxe = function(bOgrine)
{
   this._lblLocalOgrineTaxe.text = "Taxe à " + this.TaxOg + "% : " + this.getOgrineTaxe(bOgrine);
};
_loc1.TaxOg = 0;
_loc1.MinOg = 1500;
_loc1.addProperty("tax",function()
{
}
,_loc1.__set__Taxt);
_loc1.addProperty("min",function()
{
}
,_loc1.__set__Min);
ASSetPropFlags(_loc1,null,1);
