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
_global.dofus["\r\x14"].gapi.ui.Market = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Market.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Market.prototype;
_loc1.__set__MarketOgrinas = function(sValue)
{
   if(sValue.split("~")[0] == "vacio")
   {
      this._aMarketOgrinas = "vacio";
   }
   else
   {
      this._aMarketOgrinas = sValue.split("~")[0].split("|");
   }
   this._tasaOgrina = sValue.split("~")[1];
   this.TaxOg = sValue.split("~")[2];
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Market.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnTabKamas.addEventListener("click",this);
   this._btnTabOgrinas.addEventListener("click",this);
   this._dgLogros.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this.VentaOgrinas.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this.precioKamas.addEventListener("change",this);
   this.Misogrinas.addEventListener("change",this);
};
_loc1.initTexts = function()
{
   this._btnTabOgrinas.label = this.api.lang.getText("OFEFERS_TITLE");
   this._btnTabKamas.label = this.api.lang.getText("M_OFEFERS_TITLE");
   this._dgLogros.columnsNames = ["",this.api.lang.getText("OFFER_T"),"",this.api.lang.getText("PRICE_T"),"Tasa",""];
   this._lblKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Kama).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._lblOgrinas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Ogrine).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._lblName.text = this._sNombre;
   this._txtNombre.text = this._sNombre;
   this.titleSell.text = this.api.lang.getText("TITTLE_SELL");
   this.Recomend.text = this.api.lang.getText("PRICE_RECOMENDED");
   this._txtTitulo.text = "";
   this.VentaOgrinas.label = this.api.lang.getText("MAKE_OFFER");
   this._lblOgrinOs.text = this.api.lang.getText("MY_MONEY");
   this.lbltax.text = this.api.lang.getText("YOU_WIN_X_OGRINES") + "0";
   this._win.title = this.api.lang.getText("MARKET_TITLE");
   this._price.text = this.api.lang.getText("OGRINES_PRICE");
};
_loc1.change = function(oEvent)
{
   switch(oEvent.target)
   {
      case this.Misogrinas:
         if(this.Misogrinas.text.length >= 1 && _global.parseInt(this.Misogrinas.text) > 0)
         {
            this.Recomend.text = this.api.lang.getText("PRICE_RECOMENDED") + this.formatDecimals(_global.parseInt(this.Misogrinas.text) / Number(this._tasaOgrina),0) + " Ogrines";
            if(Number(this.Misogrinas.text) > this.api.datacenter.Player.Kama)
            {
               this.Misogrinas.text = this.api.datacenter.Player.Kama;
            }
         }
         if(this.precioKamas.text !== "")
         {
            this.precioKamas.text = "";
         }
         if(this.Misogrinas.text.length <= 0)
         {
            if(this.precioKamas.text !== "")
            {
               this.precioKamas.text = "";
            }
            this.lbltasaK.text = "Tax 0 x 0";
            this.lbltax.text = this.api.lang.getText("YOU_WIN_X_OGRINES") + "0";
            this.VentaOgrinas.enabled = false;
         }
         break;
      case this.precioKamas:
         if(this.Misogrinas.text.length <= 0)
         {
            if(this.precioKamas.text !== "")
            {
               this.precioKamas.text = "";
            }
            if(this.lblError.text !== "")
            {
               this.lblError.text = "";
            }
            this.lbltasaK.text = "Tax 0 x 0";
            this.lbltax.text = this.api.lang.getText("YOU_WIN_X_OGRINES") + " 0";
         }
         if(this.precioKamas.text.length >= 1 && _global.parseInt(this.precioKamas.text) > 0)
         {
            if(this.Misogrinas.text.length >= 1 && _global.parseInt(this.Misogrinas.text) > 0)
            {
               this.lbltasaK.text = "Tax 1 x " + this.formatDecimals(_global.parseInt(this.Misogrinas.text) / _global.parseInt(this.precioKamas.text),0);
               this.lbltax.text = this.api.lang.getText("YOU_WIN_X_OGRINES") + " " + (Number(this.precioKamas.text) - Math.round(_global.parseInt(this.precioKamas.text) * this.TaxOg / 100) + " Ogrines");
            }
            if(this.formatDecimals(_global.parseInt(this.Misogrinas.text) / _global.parseInt(this.precioKamas.text),0) <= 0)
            {
               this.VentaOgrinas.enabled = false;
            }
            else
            {
               if(this.lblError.text !== "")
               {
                  this.lblError.text = "";
               }
               this.VentaOgrinas.enabled = true;
            }
            if(_global.parseInt(this.precioKamas.text) > _global.parseInt(this.Misogrinas.text))
            {
               this.precioKamas.text = this.Misogrinas.text;
            }
            else if(this.lblError.text !== "")
            {
               this.lblError.text = "";
            }
         }
   }
};
_loc1.formatDecimals = function(num, digits)
{
   if(digits <= 0)
   {
      return Math.round(num);
   }
   var _loc4_ = Math.pow(10,digits);
   var _loc2_ = String(Math.round(num * _loc4_) / _loc4_);
   if(_loc2_.indexOf(".") == -1)
   {
      _loc2_ += ".0";
   }
   var _loc6_ = _loc2_.split(".");
   var _loc3_ = digits - _loc6_[1].length;
   var _loc1_ = 1;
   while(_loc1_ <= _loc3_)
   {
      _loc2_ += "0";
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_;
};
_loc1.askBuy = function(_loc2_, _loc3_, _loc4_, _loc7_)
{
   if(_loc3_ != undefined)
   {
      if(_loc3_)
      {
         if(_global.parseInt(_loc2_) > this.api.datacenter.Player.Ogrine)
         {
            this.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("NOT_ENOUGH_RICH_OGRINAS_MARKET")});
         }
         else
         {
            var _loc3_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:this.api.lang.getText("BIGSTORE"),text:this.api.lang.getText("DO_U_BUY_ITEM_BIGSTORE_OGRINAS_MARKET",[_loc4_ + " Kamas",_loc2_]),params:{id:_loc7_,mine:_loc3_}});
            _loc3_.addEventListener("yes",this);
         }
      }
      else
      {
         _loc3_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:this.api.lang.getText("BIGSTORE"),text:this.api.lang.getText("DO_U_WANT_RETIRER_MARKET"),params:{id:_loc7_,mine:_loc3_}});
         _loc3_.addEventListener("yes",this);
      }
   }
};
_loc1.yes = function(_loc2_)
{
   if(_loc2_.target.params.mine)
   {
      this.api.network.send("wM" + _loc2_.target.params.id);
   }
   else
   {
      this.api.network.send("wR" + _loc2_.target.params.id);
   }
};
_loc1.initData = function()
{
   this.VentaOgrinas.enabled = false;
   this._aLogros = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = this._aMarketOgrinas;
   var _loc5_ = 0;
   if(_loc4_ !== "vacio")
   {
      for(_loc5_ in _loc4_)
      {
         var _loc3_ = _loc4_[_loc5_];
         var _loc2_ = new Object();
         _loc2_.ID = _loc3_.split(";")[0];
         _loc2_.venta = _loc3_.split(";")[1];
         _loc2_.compra = _loc3_.split(";")[2];
         _loc2_.perso = _loc3_.split(";")[3];
         _loc2_.cambio = _loc3_.split(";")[4];
         this._aLogros.push(_loc2_);
         this._aLogros.bubbleSortOn("compra",Array.NUMERIC | Array.DESCENDING);
      }
   }
   this.updateCurrentTabInformations();
};
_loc1.Actualiza = function(sData)
{
   if(this.precioKamas.text !== "")
   {
      this.precioKamas.text = "";
   }
   if(this.lblError.text !== "")
   {
      this.lblError.text = "";
   }
   if(this.Misogrinas.text !== "")
   {
      this.Misogrinas.text = "";
   }
   this._lblKamas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Kama).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._lblOgrinas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this.api.datacenter.Player.Ogrine).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this.lbltasaK.text = "Tax 0 x 0";
   this.lbltax.text = this.api.lang.getText("YOU_WIN_X_OGRINES") + "0";
   if(sData.split("~")[0] == "vacio")
   {
      this._aMarketOgrinas = "vacio";
   }
   else
   {
      this._aMarketOgrinas = sData.split("~")[0].split("|");
   }
   this._tasaOgrina = sData.split("~")[1];
   this._aLogros = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc7_ = sData.split("~")[3];
   var _loc4_ = this._aMarketOgrinas;
   var _loc8_ = true;
   var _loc5_ = 0;
   if(_loc4_ !== "vacio")
   {
      for(_loc5_ in _loc4_)
      {
         var _loc3_ = _loc4_[_loc5_];
         var _loc2_ = new Object();
         _loc2_.ID = _loc3_.split(";")[0];
         _loc2_.venta = _loc3_.split(";")[1];
         _loc2_.compra = _loc3_.split(";")[2];
         _loc2_.perso = _loc3_.split(";")[3];
         _loc2_.cambio = _loc3_.split(";")[4];
         this._aLogros.push(_loc2_);
         this._aLogros.bubbleSortOn("compra",Array.NUMERIC | Array.DESCENDING);
      }
   }
   if(_loc7_ == 1)
   {
      this.setCurrentTab("Kamas");
   }
   else
   {
      this.setCurrentTab("Ogrinas");
   }
};
_loc1.setCurrentTab = function(_loc2_)
{
   var _loc2_ = this["_btnTab" + this._sCurrentTab];
   var _loc3_ = this["_btnTab" + _loc2_];
   _loc2_.selected = true;
   _loc2_.enabled = true;
   _loc3_.selected = false;
   this._sCurrentTab = _loc2_;
   this.updateCurrentTabInformations();
};
_loc1.updateCurrentTabInformations = function()
{
   var _loc3_ = new Array();
   _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   switch(this._sCurrentTab)
   {
      case "Kamas":
         for(var _loc4_ in this._aLogros)
         {
            var _loc2_ = this._aLogros[_loc4_];
            if(_loc2_.perso == this.api.datacenter.Player.ID)
            {
               _loc3_.push(_loc2_);
            }
         }
         this._dgLogros.dataProvider = _loc3_;
         break;
      case "Ogrinas":
         for(_loc4_ in this._aLogros)
         {
            _loc2_ = this._aLogros[_loc4_];
            if(_loc2_.perso != this.api.datacenter.Player.ID)
            {
               _loc3_.push(_loc2_);
            }
         }
         this._dgLogros.dataProvider = _loc3_;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnTabKamas:
         this.setCurrentTab("Kamas");
         break;
      case this._btnTabOgrinas:
         this.setCurrentTab("Ogrinas");
         break;
      case this._btnCerrar:
         this.gapi.unloadUIComponent("Market");
         break;
      case this.VentaOgrinas:
         if(this.precioKamas.text != "" && this.Misogrinas.text != "")
         {
            this.api.network.send("wO" + this.Misogrinas.text + "|" + this.precioKamas.text);
         }
   }
};
_loc1.addProperty("MarketOgrinas",function()
{
}
,_loc1.__set__MarketOgrinas);
_loc1._tasaOgrina = 0;
_loc1._sCurrentTab = "Ogrinas";
_loc1.TaxOg = 0;
_loc1._aMarketOgrinas = "";
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Market.CLASS_NAME = "Market";
