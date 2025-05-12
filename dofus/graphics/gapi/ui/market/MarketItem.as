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
if(!dofus["\r\x14"].gapi.ui.market)
{
   _global.dofus["\r\x14"].gapi.ui.market = new Object();
}
_global.dofus["\r\x14"].gapi.ui.market.MarketItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.market.MarketItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.market.MarketItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._ldrIcon._visible = true;
      this._ldrIcon2._visible = true;
      this._ldrIcon.contentPath = "KamaSymbol";
      this._ldrIcon2.contentPath = "OgrineSymbol";
      this._lblTasa.text = "1 x " + oItem.cambio;
      this._lblPrice.text = oItem.venta;
      this._lblValor.text = oItem.compra;
      this._btnBuy._visible = true;
      this._btnBuy.label = oItem.perso == this.api.datacenter.Player.ID ? this.api.lang.getText("DELETE_OFFER") : this.api.lang.getText("BUY");
   }
   else if(this._lblPrice.text != "")
   {
      this._lblPrice.text = "";
      this._lblValor.text = "";
      this._lblTasa.text = "";
      this._ldrIcon._visible = false;
      this._ldrIcon2._visible = false;
      this._btnBuy._visible = false;
   }
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
};
_loc1.addListeners = function()
{
   this._btnBuy.addEventListener("click",this);
};
_loc1.init = function()
{
   super.init(false);
   this._lblPrice.text = "";
   this._lblValor.text = "";
   this._lblTasa.text = "";
   this._ldrIcon._visible = false;
   this._ldrIcon2._visible = false;
   this._btnBuy._visible = false;
};
_loc1.initTexts = function()
{
   this._btnBuy.label = this.api.lang.getText("BUY");
};
_loc1.click = function(oEvent)
{
   if(oEvent.target === this._btnBuy)
   {
      var _loc3_ = this._oItem.perso != this.api.datacenter.Player.ID;
      api = _global.API;
      api.ui.getUIComponent("Market").askBuy(this._oItem.compra,_loc3_,this._oItem.venta,this._oItem.ID);
   }
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
