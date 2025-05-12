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
if(!dofus["\r\x14"].gapi.ui.guildperso)
{
   _global.dofus["\r\x14"].gapi.ui.guildperso = new Object();
}
_global.dofus["\r\x14"].gapi.ui.guildperso.GuildPersoItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.guildperso.GuildPersoItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.guildperso.GuildPersoItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblPrice.text = this._oItem.venta;
      this._lblValor.text = this._oItem.compra;
      this._btnBuy._visible = true;
      this._btnBuy.label = this.api.lang.getText("Edit");
      this._tiSearch._visible = false;
      this.capa._visible = false;
      this._oItem.Editable = false;
      this.EditarUnic = false;
   }
   else if(this._lblPrice.text != "")
   {
      this._lblPrice.text = "";
      this._lblValor.text = "";
      this._lblTasa.text = "";
      this._ldrIcon._visible = false;
      this._ldrIcon2._visible = false;
      this._btnBuy._visible = false;
      this.EditarUnic = false;
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
   this._tiSearch._visible = true;
   this.capa._visible = true;
};
_loc1.initTexts = function()
{
   this._btnBuy.label = this.api.lang.getText("Edit");
};
_loc1.EditarRank = function()
{
   if(this._tiSearch.text != "")
   {
      this._oItem.compra = this._tiSearch.text;
      this._lblValor.text = this._tiSearch.text;
   }
   this._tiSearch._visible = false;
   this.capa._visible = false;
   this._oItem.Editable = false;
   this.EditarUnic = false;
   this._btnBuy.label = this.api.lang.getText("Edit");
};
_loc1.click = function(oEvent)
{
   if(oEvent.target === this._btnBuy)
   {
      if(!this.EditarUnic)
      {
         this._tiSearch._visible = true;
         this.capa._visible = true;
         this._oItem.Editable = true;
         this._btnBuy.label = this.api.lang.getText("save");
         this.EditarUnic = true;
      }
      else
      {
         this.EditarRank();
      }
   }
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
_loc1.EditarUnic = false;
ASSetPropFlags(_loc1,null,1);
