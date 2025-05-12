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
_global.dofus["\r\x14"].gapi.ui.Contenido = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.Contenido.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Contenido.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Contenido.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.api.ui.unloadUIComponent("Contenido");
   return true;
};
_loc1.__set__Datos = function(sData)
{
   this.sItemsPosibles = sData;
};
_loc1.createChildren = function()
{
   this.hideItemViewer(true);
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.initTexts = function()
{
   this._winBg.title = "Articles possibles à obtenir:";
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._lst.addEventListener("itemSelected",this);
   this._lst.addEventListener("itemRollOver",this);
   this._lst.addEventListener("itemRollOut",this);
   this.ActivarPackets();
};
_loc1.ActivarPackets = function()
{
   this._bChange = true;
   api = _global.API;
   api.network.send("wA" + this.sItemsPosibles);
};
_loc1.CargaObj = function(sDatos)
{
   this._oObjetos = new Object();
   var _loc6_ = sDatos.split("|");
   var _loc2_ = 0;
   while(_loc2_ < _loc6_.length)
   {
      var _loc3_ = _loc6_[_loc2_].split(";");
      var _loc4_ = _loc3_[0];
      var _loc5_ = _loc3_[1];
      this._oObjetos[_loc4_] = {id:_loc4_,stats:_loc5_};
      _loc2_ = _loc2_ + 1;
   }
   this.generateIndexes();
};
_loc1.hideItemViewer = function(bHide)
{
   this._winItemViewer._visible = !bHide;
   this._itvItemViewer._visible = !bHide;
};
_loc1.generateIndexes = function()
{
   this._eaItemsOriginal = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc6_ = this.api.lang.getItemUnics();
   for(var _loc7_ in _loc6_)
   {
      if(Number(_loc7_) <= _global.ID_OBJETO_MODELO_MAX)
      {
         var _loc4_ = _loc6_[_loc7_];
         var _loc3_ = this._oObjetos[_loc7_];
         if(!(_loc4_.n == "" || !_loc3_))
         {
            var _loc5_ = new dofus.datacenter["\f\f"](0,_loc3_.id,1,0,_loc3_.stats,0);
            this._eaItemsOriginal.push(_loc5_);
         }
      }
   }
   if(this._bChange)
   {
      this.change();
      this._bChange = false;
   }
};
_loc1.change = function(oEvent)
{
   if(this._lst.dataProvider != this._eaItemsOriginal)
   {
      this._lst.dataProvider = this._eaItemsOriginal;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnClose":
      case "_btnCancel":
         this.dispatchEvent({type:"cancel"});
         this.callClose();
   }
};
_loc1.itemSelected = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target) === this._lst)
   {
      var _loc2_ = this._lst.selectedItem;
      if(_loc2_ == undefined)
      {
         this.hideItemViewer(true);
      }
      else
      {
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
         {
            this.api.kernel.GameManager.insertItemInChat(_loc2_);
            return undefined;
         }
         this.hideItemViewer(false);
         this._itvItemViewer.itemData = _loc2_;
      }
   }
};
_loc1.itemRollOver = function(oEvent)
{
   this.gapi.showTooltip(oEvent.row.item.name,oEvent.row,20,{bXLimit:true,bYLimit:false});
};
_loc1.itemRollOut = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("datos",function()
{
}
,_loc1.__set__Datos);
_loc1.sItemsPosibles = "";
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Contenido.CLASS_NAME = "Contenido";
