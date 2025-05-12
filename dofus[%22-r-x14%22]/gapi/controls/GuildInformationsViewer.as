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
if(!dofus["\r\x14"].gapi.controls)
{
   _global.dofus["\r\x14"].gapi.controls = new Object();
}
_global.dofus["\r\x14"].gapi.controls.GuildInformationsViewer = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.GuildInformationsViewer.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.GuildInformationsViewer.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.GuildInformationsViewer.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnEditInformations.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnSave.addEventListener("click",this);
};
_loc1.click = function(oEvent)
{
};
_loc1.initData = function()
{
   var _loc3_ = this.api.datacenter.Player.guildInfos;
   var _loc2_ = _loc3_.playerRights;
   this._btnEditInformations.enabled = _loc2_.canManageRights;
   this.toggleInfosEditor(false);
};
_loc1.setTextArea = function(_loc2_)
{
   this.api.kernel.debug(_loc2_);
   if(_loc2_.length == 0 || _loc2_ == undefined)
   {
      this._taGuildInformations.text = this.api.lang.getText("GUILD_INFORMATIONS_EMPTY");
      this._bEmptyTextField = true;
   }
   else
   {
      this._taGuildInformations.text = _loc2_;
      this._taGuildInformations2.text = _loc2_;
      this._bEmptyTextField = false;
   }
};
_loc1.toggleInfosEditor = function(_loc2_)
{
   this._taGuildInformations2._visible = _loc2_;
   this._taGuildInformations._visible = !_loc2_;
   this._taGuildInformations.editable = _loc2_;
   this._taGuildInformations.html = !_loc2_;
   this._btnCancel._visible = _loc2_;
   this._btnSave._visible = _loc2_;
   this._mcEditMode._visible = _loc2_;
   this._btnEditInformations._visible = !_loc2_;
   if(_loc2_)
   {
      if(this._bEmptyTextField)
      {
         this._taGuildInformations.text = "";
      }
      this._taGuildInformations.setFocus(false);
   }
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnEditInformations:
         this.toggleInfosEditor(true);
         break;
      case this._btnCancel:
         this.toggleInfosEditor(false);
         break;
      case this._btnSave:
         this.toggleInfosEditor(false);
         this.api.network.send("wQ" + this._taGuildInformations2.text);
   }
};
_loc1.over = function(_loc2_)
{
   if(_loc2_.target === this._mcHelp)
   {
      this.gapi.showTooltip(this.api.lang.getText("GUILD_INFORMATIONS_HELP"),this._mcHelp._x + 75,185);
   }
};
_loc1.out = function()
{
   this.gapi.hideTooltip();
};
_loc1.initTexts = function()
{
   this._lblName.text = this.api.lang.getText("GUILD_HOUSE_DISPLAY_EMBLEM_FOR_GUILD");
   this._taConductRules.text = this.api.lang.getText("GUILD_CONDUCT_RULES");
   this._btnEditInformations.label = this.api.lang.getText("MODIFY");
   this._btnCancel.label = this.api.lang.getText("CANCEL_SMALL");
   this._btnSave.label = this.api.lang.getText("SAVE");
   var ref = this;
   this._mcHelp.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcHelp.onRollOut = function()
   {
      ref.out({target:this});
   };
};
_loc1.updateData = function()
{
   var _loc2_ = this.api.datacenter.Player.guildInfos;
   this.api.kernel.debug("ANNOUNCE HERE 1");
   this.setTextArea(_loc2_.infos);
   this._lblLatestUpdate.text = this.api.lang.getText("MESSAGE_EDITED",[_loc2_.infosFormatedLastModification,_loc2_.infosMember]);
   this._lblLatestUpdate._visible = _loc2_.infosMember != "";
};
_global.dofus["\r\x14"].gapi.controls.GuildInformationsViewer.CLASS_NAME = "GuildInformationsViewer";
