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
_global.dofus["\r\x14"].gapi.ui.CustomSetEdit = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.CustomSetEdit.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.ui.CustomSetEdit.prototype;
_loc1.__set__rapidStuff = function(oRapidStuff)
{
   this._oRapidStuff = oRapidStuff;
   this._nIconID = oRapidStuff.icono == 0 ? undefined : oRapidStuff.icono;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.CustomSetEdit.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this._eaIcons = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 1;
   while(_loc2_ <= 20)
   {
      this._eaIcons.push({iconID:_loc2_,iconFile:dofus.Constants.CUSTOM_SET_ICONS + _loc2_ + ".swf"});
      _loc2_ = _loc2_ + 1;
   }
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initText});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnEliminar.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnSave.addEventListener("click",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid.multipleContainerSelectionEnabled = false;
};
_loc1.initText = function()
{
   this._winInventory.title = this.api.lang.getText("CUSTOM_SET_EDIT");
   this._lblName.text = this.api.lang.getText("NAME_BIG");
   this._lblIcon.text = this.api.lang.getText("ICON");
   this._btnEliminar.label = this.api.lang.getText("DELETE_WORD");
   this._btnSave.label = this.api.lang.getText("VALIDATE");
   this._tiSearch.text = this._oRapidStuff.name;
};
_loc1.initData = function()
{
   this._btnSave.enabled = !this._oRapidStuff.isEmptyRapidStuff;
   this._cgGrid.dataProvider = this._eaIcons;
   if(this._nIconID == undefined)
   {
      this._nIconID = 1;
   }
   this._cgGrid.selectedIndex = this._nIconID - 1;
   this._tiSearch.restrict = "\\-a-zA-Z0-9_.!?:;, ";
   this._tiSearch.maxChars = dofus["\r\x14"].gapi.ui.CustomSetEdit.NAME_MAX_CHARS;
   this._tiSearch.setFocus();
};
_loc1.editSet = function(nIcon)
{
   if(this._oRapidStuff)
   {
      var _loc6_ = this._tiSearch.text;
      if(_loc6_.length < dofus["\r\x14"].gapi.ui.CustomSetEdit.NAME_MIN_CHARS || _loc6_.length > dofus["\r\x14"].gapi.ui.CustomSetEdit.NAME_MAX_CHARS)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CUSTOM_SET_INVALID_NAME"),"ERROR_BOX");
         return undefined;
      }
      if(this._nIconID == undefined)
      {
         return undefined;
      }
      var _loc5_ = this.api.ui.getUIComponent("Inventory").getData();
      var _loc7_ = {ID:this._oRapidStuff.ID,name:this._tiSearch.text,icono:this._nIconID,iconFile:dofus.Constants.CUSTOM_SET_ICONS + this._nIconID + ".swf",data:_loc5_};
      this.api.datacenter.Player.addSet(_loc7_);
      this.api.network.send("ZSC" + this._oRapidStuff.ID + "|" + this._tiSearch.text + "|" + this._nIconID + "|" + _loc5_);
      this.api.ui.getUIComponent("Inventory").updateSet2(_loc5_);
      this.callClose();
   }
   else
   {
      _loc6_ = this._tiSearch.text;
      if(_loc6_.length < dofus["\r\x14"].gapi.ui.CustomSetEdit.NAME_MIN_CHARS || _loc6_.length > dofus["\r\x14"].gapi.ui.CustomSetEdit.NAME_MAX_CHARS)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CUSTOM_SET_INVALID_NAME"),"ERROR_BOX");
         return undefined;
      }
      if(this._nIconID == undefined)
      {
         return undefined;
      }
      var _loc4_ = 0;
      var _loc2_ = 1;
      while(_loc2_ <= 12)
      {
         var _loc3_ = this.api.datacenter.Player.getSet(_loc2_);
         if(_loc3_ == undefined)
         {
            _loc4_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_ == 0)
      {
         return undefined;
      }
      _loc5_ = this.api.ui.getUIComponent("Inventory").getData();
      _loc7_ = {ID:_loc4_,name:this._tiSearch.text,icono:this._nIconID,iconFile:dofus.Constants.CUSTOM_SET_ICONS + this._nIconID + ".swf",data:_loc5_};
      this.api.datacenter.Player.addSet(_loc7_);
      this.api.network.send("ZSC" + _loc4_ + "|" + this._tiSearch.text + "|" + this._nIconID + "|" + _loc5_);
      this.api.ui.getUIComponent("Inventory").updateSet();
      this.callClose();
   }
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.selectItem = function(_loc2_)
{
   var _loc2_ = _loc2_.target;
   if(_loc2_.contentData == undefined || !_loc2_.contentLoaded)
   {
      this._cgGrid.selectedIndex = this._cgGrid.lastLoadedContentIndex;
      var _loc3_ = this._cgGrid.selectedContentData;
   }
   else
   {
      _loc3_ = _loc2_.contentData;
   }
   var _loc4_ = _loc3_.iconID;
   this._nIconID = _loc4_;
};
_loc1.dblClickItem = function(_loc2_)
{
   this.selectItem(_loc2_);
   this.editSet(this._nIconID);
};
_loc1.yes = function(_loc2_)
{
   this.api.datacenter.Player.removeSet(this._oRapidStuff.ID);
   this.api.network.send("ZSB" + this._oRapidStuff.ID);
   this.api.ui.getUIComponent("Inventory").deleteSetF();
   this.callClose();
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnClose:
         this.callClose();
         break;
      case this._btnSave:
         this.editSet(this._nIconID);
         break;
      case this._btnEliminar:
         var _loc2_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoDeleteCustomSet",{title:this.api.lang.getText("QUESTION"),text:this.api.lang.getText("CONFIRM_DELETE_CUSTOM_SET")});
         _loc2_.addEventListener("yes",this);
   }
};
_loc1.addProperty("rapidStuff",function()
{
}
,_loc1.__set__rapidStuff);
ASSetPropFlags(_loc1,null,1);
_loc1._oRapidStuff = "";
_loc1._nIconID = undefined;
_global.dofus["\r\x14"].gapi.ui.CustomSetEdit.CLASS_NAME = "CustomSetEdit";
_global.dofus["\r\x14"].gapi.ui.CustomSetEdit.NAME_MIN_CHARS = 3;
_global.dofus["\r\x14"].gapi.ui.CustomSetEdit.NAME_MAX_CHARS = 20;
