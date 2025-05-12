var _loc1 = _global.dofus["\r\x14"].gapi.ui.Guild.prototype;
_loc1.__set__Anuncio = function(sValue)
{
   this.sAnuncio = sValue;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.setCurrentTab,params:[this._sCurrentTab]});
   this._mcPlacer._visible = false;
   this._mcCaution._visible = this._lblValid._visible = false;
   this.txtAnuncio._visible = false;
   this.Fondo._visible = false;
};
_loc1.initTexts = function()
{
   this._btnTabMembers.label = this.api.lang.getText("GUILD_MEMBERS");
   this._btnTabBoosts.label = this.api.lang.getText("GUILD_BOOSTS");
   this._btnTabTaxCollectors.label = this.api.lang.getText("GUILD_TAXCOLLECTORS");
   this._btnTabMountParks.label = this.api.lang.getText("MOUNT_PARK");
   this._btnTabGuildHouses.label = this.api.lang.getText("HOUSES_WORD");
   this._lblXP.text = this.api.lang.getText("EXPERIMENT");
   this._txtDescrip.text = this.sAnuncio;
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnEdit.addEventListener("click",this);
   this._btnTabMembers.addEventListener("click",this);
   this._btnTabBoosts.addEventListener("click",this);
   this._btnTabTaxCollectors.addEventListener("click",this);
   this._btnTabMountParks.addEventListener("click",this);
   this._btnTabGuildHouses.addEventListener("click",this);
   this.api.datacenter.Player.guildInfos.addEventListener("modelChanged",this);
   this._pbXP.addEventListener("over",this);
   this._pbXP.addEventListener("out",this);
};
_loc1.initData = function()
{
   var _loc3_ = this.api.datacenter.Player.guildInfos;
   var _loc2_ = _loc3_.emblem;
   this._eEmblem.backID = _loc2_.backID;
   this._eEmblem.backColor = _loc2_.backColor;
   this._eEmblem.upID = _loc2_.upID;
   this._eEmblem.upColor = _loc2_.upColor;
   this._winBg.title = this.api.lang.getText("GUILD") + " \'" + _loc3_.name + "\'";
   this.api.network.Guild.getInfosGeneral();
   var _loc4_ = _loc3_.playerRights;
   this._btnEdit._visible = _loc4_.canManageRights;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnClose":
         this.callClose();
         break;
      case "_btnEdit":
         if(this.editado == false)
         {
            this.txtAnuncio._visible = true;
            this.Fondo._visible = true;
            this.editado = true;
            this.txtAnuncio.text = this.sAnuncio;
            this._btnEdit.icon = "UI_MainMenuCross2";
         }
         else
         {
            this.api.network.send("wG" + this.txtAnuncio.text);
            this._btnEdit.icon = "UI_MainMenuEdit";
            this.txtAnuncio._visible = false;
            this.Fondo._visible = false;
            this._txtDescrip.text = this.txtAnuncio.text;
            this.editado = false;
         }
         break;
      case "_btnTabMembers":
         this.setCurrentTab("Members");
         break;
      case "_btnTabBoosts":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("Boosts");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
            oEvent.target.selected = true;
         }
         break;
      case "_btnTabTaxCollectors":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("TaxCollectors");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
            oEvent.target.selected = true;
         }
         break;
      case "_btnTabMountParks":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("MountParks");
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
            oEvent.target.selected = true;
         }
         break;
      case "_btnTabGuildHouses":
         if(this.api.datacenter.Player.guildInfos.isValid)
         {
            this.setCurrentTab("GuildHouses");
            break;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("NOT_ENOUGHT_MEMBERS_IN_GUILD"),"ERROR_BOX");
         oEvent.target.selected = true;
         break;
   }
};
_loc1.over = function(oEvent)
{
   if(oEvent.target._name === "_pbXP")
   {
      this.gapi.showTooltip(new ank.utils.ExtendedString(this._pbXP.value).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank.utils.ExtendedString(this._pbXP.maximum).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this._pbXP,-20);
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.addProperty("anuncio",function()
{
}
,_loc1.__set__Anuncio);
_loc1.editado = false;
_loc1.sAnuncio = "";
