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
_global.dofus["\r\x14"].gapi.ui.LookSelectorMarketShop = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.LookSelectorMarketShop.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.LookSelectorMarketShop.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc2_ = new dofus.datacenter["\f\f"](this._oItem.id,this._oItem.id,1,-1,this._oItem.stats);
      _loc3_.push(_loc2_);
      this._Id = this._oItem.id;
      this._lblName.text = _loc2_.name;
      this._lblPrice.text = this._oItem.price;
      this._og._visible = true;
      this._bg._visible = true;
      this._btnOk._visible = true;
      var _loc4_ = this._mcList.gapi.api.lang.getItemUnicText(Number(this._oItem.id)).t;
      switch(_loc4_)
      {
         case 18:
         case 17:
         case 16:
         case 82:
            this.ShowInMe._visible = true;
            this.ShowInMeImg._visible = true;
      }
      this._btnOk.label = this._mcList.gapi.api.lang.getText("BUY");
      this._cgItem.dataProvider = _loc3_;
      this._cgItem._visible = true;
   }
   else if(this._lblName.text != undefined)
   {
      this._cgItem.dataProvider = null;
      this._cgItem._visible = false;
      this._lblName.text = "";
      this._lblPrice.text = "";
      this._og._visible = false;
      this._bg._visible = false;
      this._btnOk._visible = false;
      this.ShowInMe._visible = false;
      this.ShowInMeImg._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._btnOk._visible = false;
   this.ShowInMe._visible = false;
   this.ShowInMeImg._visible = false;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   this._cgItem.addEventListener("overItem",this);
   this._cgItem.addEventListener("outItem",this);
   this._cgItem.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this.ShowInMe.addEventListener("click",this);
   this._cgItem.addEventListener("selectItem",this);
};
_loc1.overItem = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   _loc2_.showStatsTooltip(oEvent.target,oEvent.target.contentData.style);
};
_loc1.selectItem = function(oEvent)
{
   this._mcList._parent._parent.descriItem(this._oItem);
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.descriItem = function(oEvent)
{
   var _loc4_ = oEvent;
   var _loc2_ = -20;
   var _loc1_ = _loc4_.name;
   var _loc5_ = true;
   for(var _loc6_ in _loc4_.effects)
   {
      var _loc3_ = _loc4_.effects[_loc6_];
      if(_loc3_.description.length > 0)
      {
         if(_loc5_)
         {
            _loc1_ += "\n";
            _loc2_ -= 10;
            _loc5_ = false;
         }
         _loc1_ = _loc1_ + "\n" + _loc3_.description;
         _loc2_ -= 12;
      }
   }
   return _loc1_;
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnOk:
         if(this._oItem.price > Number(this._mcList._parent._parent._txtOgrinas.text))
         {
            this._mcList.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:this._mcList.gapi.api.lang.getText("ERROR_WORD"),text:this._mcList.gapi.api.lang.getText("NOT_ENOUGH_RICH_OGRINAS")});
            break;
         }
         if(Key.isDown(17))
         {
            var _loc4_ = this._mcList.gapi.api.lang.getItemUnicText(Number(this._oItem.id)).n;
            var _loc3_ = this._mcList.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:"Boutique",text:"Est-ce que vous êtes sûr de vouloir continuer ?\n\nDétails de la commande : \nObjet : " + _loc4_ + "\nQuantité : " + 1 + "\nPrix total à payer : " + this._oItem.price + "",params:{id:this._oItem.id,qua:1}});
            _loc3_.addEventListener("yes",this);
            break;
         }
         var _loc5_ = int(this._mcList._parent._parent._txtOgrinas.text / this._oItem.price);
         var _loc2_ = this._mcList.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:1,max:_loc5_,params:{id:this._oItem.id}});
         _loc2_.addEventListener("validate",this);
         break;
      case this.ShowInMe:
         var _loc6_ = this._mcList.gapi.api.lang.getItemUnicText(Number(this._oItem.id)).t;
         this._mcList._parent._parent.CAcces(this._oItem.id,_loc6_);
         break;
      case this._cgItem:
         this._cgItem._visible = false;
         break;
      case this._btnVerify:
         this._btnVerify._visible = false;
   }
};
_loc1.validate = function(oEvent)
{
   var _loc4_ = this._mcList.gapi.api.lang.getItemUnicText(Number(this._oItem.id)).n;
   var _loc3_ = this._mcList.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:"Boutique",text:"Est-ce que vous êtes sûr de vouloir continuer ?\n\nDétails de la commande : \nObjet : " + _loc4_ + "\nQuantité : " + oEvent.value + "\nPrix total à payer : " + this._oItem.price * oEvent.value + "",params:{id:this._oItem.id,qua:oEvent.value}});
   _loc3_.addEventListener("yes",this);
};
_loc1.yes = function(oEvent)
{
   this._mcList.gapi.api.network.send("kbb" + oEvent.target.params.id + "|" + oEvent.target.params.qua);
};
_loc1.Id = -1;
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
