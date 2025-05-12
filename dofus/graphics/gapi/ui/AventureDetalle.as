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
_global.dofus["\r\x14"].gapi.ui.AventureDetalle = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.AventureDetalle.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.AventureDetalle.prototype;
_loc1.__set__ID = function(nID)
{
   this._nID = nID;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.AventureDetalle.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("LOGROS_DETELLES");
};
_loc1.addListeners = function()
{
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ += 1;
      if(_loc2_ >= 6)
      {
         break;
      }
      this["_ctr" + _loc2_].addEventListener("over",this);
      this["_ctr" + _loc2_].addEventListener("out",this);
      this["_ctr" + _loc2_].addEventListener("click",this);
      this["_ctr" + _loc2_]._visible = false;
      this["_txtCant" + _loc2_]._visible = false;
      this["_bg" + _loc2_]._visible = false;
   }
   this._btnClose.addEventListener("click",this);
};
_loc1.initData = function()
{
   var _loc7_ = this.api.lang.getLogroUnico(this._nID);
   if(_loc7_ == undefined)
   {
      return undefined;
   }
   var _loc4_ = _loc7_.r;
   var _loc6_ = _loc4_[0];
   var _loc3_ = -1;
   while(true)
   {
      _loc3_ += 1;
      if(_loc3_ >= _loc6_.length)
      {
         break;
      }
      var _loc5_ = new _global.palmad.dofus.datacenter.Items(0,_loc4_[0][0],1,-1,-1);
      this["_ctr" + _loc3_].contentData = _loc5_;
      this["_txtCant" + _loc3_].text = _loc4_[0][1];
      this["_ctr" + _loc3_]._visible = true;
      this["_txtCant" + _loc3_]._visible = true;
      this["_bg" + _loc3_]._visible = true;
   }
   this._txtXP.text = _loc4_[1];
   this._txtKamas.text = _loc4_[2];
   if(_loc4_[3] != null)
   {
      this._txtTitulo.text = _loc4_[3];
   }
   this._ldr.contentPath = dofus.Constants.LOGROS_GFX + _loc7_.gfx + ".png";
   this._txtTitulo.text = _loc7_.n;
   this._txtDescripcion.text = _loc7_.d;
};
_loc1.click = function(oEvent)
{
   if(oEvent.target._name !== "_btnClose")
   {
      var _loc2_ = oEvent.target.contentData;
      if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc2_ != undefined)
      {
         this.gapi.api.kernel.GameManager.insertItemInChat(_loc2_);
      }
   }
   else
   {
      this.api.ui.unloadUIComponent("AventureDetalle");
   }
};
_loc1.over = function(oEvent)
{
   var _loc2_ = oEvent.target.contentData;
   this.gapi.showTooltip("x" + _loc2_.Quantity + " - " + _loc2_.name,oEvent.target,-20);
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("id",function()
{
}
,_loc1.__set__ID);
_loc1._nID = Number(0);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.AventureDetalle.CLASS_NAME = "AventureDetalle";
