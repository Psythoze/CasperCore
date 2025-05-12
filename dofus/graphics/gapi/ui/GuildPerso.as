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
_global.dofus["\r\x14"].gapi.ui.GuildPerso = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.GuildPerso.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.GuildPerso.prototype;
_loc1.__set__MarketOgrinas = function(sValue)
{
   this.sData = sValue;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.GuildPerso.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgLogros.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this._btnOk.addEventListener("click",this);
   this.GuardoTodo.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._dgLogros.columnsNames = ["",this.api.lang.getText("RANK"),this.api.lang.getText("RANK_PERSO"),this.api.lang.getText("CHANGE_RANK_CONFIRMATION")];
   this._winBackground.title = this.api.lang.getText("MARKET_TITLE");
   this.GuardoTodo.label = this.api.lang.getText("SAVE_ALL");
};
_loc1.initData = function()
{
   this._aLogros = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 0;
   var _loc4_ = this.api.lang.getRanks().slice();
   _loc4_.sortOn("o",Array.NUMERIC | Array.ASCENDING);
   while(_loc2_ < _loc4_.length)
   {
      var _loc3_ = new Object();
      _loc3_.ID = _loc4_[_loc2_].i;
      _loc3_.venta = _loc4_[_loc2_].n;
      _loc3_.compra = this.sData.split(";")[_loc2_].split(",")[1] != undefined ? this.sData.split(";")[_loc2_].split(",")[1] : "Empty";
      _loc3_.Editable = false;
      this._aLogros.push(_loc3_);
      _loc2_ += 1;
   }
   this._dgLogros.dataProvider = this._aLogros;
};
_loc1.EnviarNuevosRanks = function()
{
   var _loc3_ = "";
   var _loc2_ = 0;
   while(_loc2_ < this._aLogros.length)
   {
      if(_loc6_.Editable)
      {
         this.api.kernel.showMessage(undefined,"Impossible de sauvegarder les rangs","ERROR_CHAT");
         return undefined;
      }
      var _loc6_ = this._aLogros[_loc2_];
      if(_loc3_ == "")
      {
         _loc3_ = _loc6_.ID + "," + _loc6_.compra;
      }
      else
      {
         _loc3_ = _loc3_ + ";" + _loc6_.ID + "," + _loc6_.compra;
      }
      _loc2_ += 1;
   }
   this.api.network.send("wH" + _loc3_);
   this.gapi.unloadUIComponent("GuildPerso");
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.gapi.unloadUIComponent("GuildPerso");
         break;
      case this.GuardoTodo:
         this.EnviarNuevosRanks();
   }
};
_loc1.addProperty("rank",function()
{
}
,_loc1.__set__MarketOgrinas);
_loc1.sData = "";
_loc1._aLogros = new Array();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.GuildPerso.CLASS_NAME = "GuildPerso";
