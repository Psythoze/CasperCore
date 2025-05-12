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
_global.dofus["\r\x14"].gapi.ui.Mimobionte = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Mimobionte.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Mimobionte.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Mimobionte.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.updateData});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnValid.addEventListener("click",this);
   this._cgOriginal.addEventListener("selectItem",this);
   this._cgOriginal.addEventListener("overItem",this);
   this._cgOriginal.addEventListener("outItem",this);
   this._cgOriginal.addEventListener("dblClickItem",this);
   this._cgMascara.addEventListener("selectItem",this);
   this._cgMascara.addEventListener("overItem",this);
   this._cgMascara.addEventListener("outItem",this);
   this._cgMascara.addEventListener("dblClickItem",this);
   this._cgResultado.addEventListener("selectItem",this);
   this._cgResultado.addEventListener("overItem",this);
   this._cgResultado.addEventListener("outItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid._visible = false;
   this._itvItemViewer._visible = false;
   this._winItemViewer._visible = false;
   this._btnValid.enabled = false;
};
_loc1.initTexts = function()
{
   this._btnValid.label = this.api.lang.getText("FUSIONAR");
   this._winBg.title = this.api.lang.getText("MIMOBIONTE");
};
_loc1.updateData = function()
{
   this._eaDataProvider = this.api.datacenter.Player.Inventory;
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   for(var _loc5_ in this._eaDataProvider)
   {
      var _loc2_ = this._eaDataProvider[_loc5_];
      if(!_loc2_.isMimobionte && !_loc2_.skineable && _loc2_.position == -1 && _loc2_.canBeExchange)
      {
         var _loc3_ = -1;
         while(true)
         {
            _loc3_ = _loc3_ + 1;
            if(_loc3_ >= this._aFiltersType.length)
            {
               break;
            }
            if(_loc2_.type == this._aFiltersType[_loc3_])
            {
               _loc4_.push(_loc2_);
               break;
            }
         }
      }
   }
   if(_loc4_.length)
   {
      this._cgGrid.dataProvider = _loc4_;
   }
   else
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_NO_FOOD_LIVING_ITEM",["Mimobionte"]),"ERROR_BOX",{name:"noItem",listener:this});
      this.callClose();
   }
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.validate = function(noConfirm)
{
   var _loc3_ = this._cgOriginal.getContainer(0).contentData;
   var _loc2_ = this._cgMascara.getContainer(0).contentData;
   if(!noConfirm)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("CONFIRM_FUSION_MIMOBIONTE",[_loc3_.name,_loc2_.name]),"CAUTION_YESNO",{name:"Confirm",listener:this});
      return undefined;
   }
   this.api.network.send("ZsM" + _loc3_.ID + "|" + _loc2_.ID);
   this.callClose();
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose:
         this.callClose();
         break;
      case this._btnValid:
         this.validate(false);
   }
};
_loc1.dblClickItem = function(oEvent)
{
   this._cgResultado.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._parent._parent) !== this._cgGrid)
   {
      this.Cg = oEvent.target._parent._parent;
      this.mostrarViewer(false);
      this._cgGrid._visible = true;
   }
   else
   {
      this._cgGrid._visible = false;
      var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc5_ = oEvent.target.contentData;
      _loc7_.push(new dofus.datacenter["\f\f"](_loc5_.ID,_loc5_.unicID,1,-1,_loc5_.compressedEffects));
      this.Cg.dataProvider = _loc7_;
      var _loc2_ = this._cgOriginal.getContainer(0).contentData;
      var _loc3_ = this._cgMascara.getContainer(0).contentData;
      if(_loc2_ != undefined && _loc3_ != undefined)
      {
         if(_loc2_.ID == _loc3_.ID)
         {
            this.mostrarViewer(false);
            this._txtError.text = this.api.lang.getText("MIMOBIONTE_ERROR_IDS");
         }
         else if(_loc2_.type != _loc3_.type)
         {
            this.mostrarViewer(false);
            this._txtError.text = this.api.lang.getText("MIMOBIONTE_ERROR_TYPES");
         }
         else if(_loc3_.level > _loc2_.level)
         {
            this.mostrarViewer(false);
            this._txtError.text = this.api.lang.getText("MIMOBIONTE_ERROR_LEVELS");
         }
         else
         {
            this._txtError.text = "";
            var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
            var _loc4_ = _loc2_.compressedEffects;
            var _loc8_ = Number(_loc3_.unicID);
            if(_loc4_.length > 0)
            {
               _loc4_ += ",393#0#0#" + _loc8_.toString(16);
            }
            else
            {
               _loc4_ = "393#0#0#" + _loc8_.toString(16);
            }
            _loc6_.push(new dofus.datacenter["\f\f"](0,_loc2_.unicID,1,-1,_loc4_));
            this._cgResultado.dataProvider = _loc6_;
            this._btnValid.enabled = true;
         }
      }
   }
};
_loc1.mostrarViewer = function(bMostrar)
{
   this._itvItemViewer._visible = bMostrar;
   this._winItemViewer._visible = bMostrar;
};
_loc1.selectItem = function(oEvent)
{
   this._itvItemViewer.itemData = oEvent.target.contentData;
   this.mostrarViewer(true);
};
_loc1.overItem = function(oEvent)
{
   if(oEvent.target == undefined || oEvent.target.contentData.length == 0 || oEvent.target.contentData == undefined || oEvent.target.contentData.name == "")
   {
      return undefined;
   }
   this.gapi.showTooltip(oEvent.target.contentData.name,oEvent.target,-20,undefined,oEvent.target.contentData.style + "ToolTip");
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.yes = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.validate(true);
   }
};
_loc1.Cg = null;
_loc1._aFiltersType = [1,2,3,4,5,6,7,8,9,10,11,16,17,18,19,21,22,81,82];
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Mimobionte.CLASS_NAME = "Mimobionte";
