var _loc1 = dofus["\r\x14"].gapi.controls.Chat.prototype;
_loc1.__get__filters = function()
{
   return new Array(this._btnFilter0.selected,this._btnFilter1.selected,this._btnFilter2.selected,this._btnFilter3.selected,this._btnFilter4.selected,this._btnFilter5.selected,this._btnFilter6.selected,this._btnFilter7.selected,this._btnFilter8.selected,this._btnFilter11.selected);
};
_loc1.addListeners = function()
{
   this._btnOpenClose.addEventListener("click",this);
   this._btnSmileys.addEventListener("click",this);
   this._btnFilter0.addEventListener("click",this);
   this._btnFilter1.addEventListener("click",this);
   this._btnFilter2.addEventListener("click",this);
   this._btnFilter3.addEventListener("click",this);
   this._btnFilter4.addEventListener("click",this);
   this._btnFilter5.addEventListener("click",this);
   this._btnFilter6.addEventListener("click",this);
   this._btnFilter7.addEventListener("click",this);
   this._btnFilter8.addEventListener("click",this);
   this._btnFilter11.addEventListener("click",this);
   this._btnSitDown.addEventListener("click",this);
   this._btnBigStore.addEventListener("click",this);
   this._btnOpenClose.addEventListener("over",this);
   this._btnSmileys.addEventListener("over",this);
   this._btnFilter0.addEventListener("over",this);
   this._btnFilter1.addEventListener("over",this);
   this._btnFilter2.addEventListener("over",this);
   this._btnFilter3.addEventListener("over",this);
   this._btnFilter4.addEventListener("over",this);
   this._btnFilter5.addEventListener("over",this);
   this._btnFilter6.addEventListener("over",this);
   this._btnFilter7.addEventListener("over",this);
   this._btnFilter8.addEventListener("over",this);
   this._btnFilter11.addEventListener("over",this);
   this._btnSitDown.addEventListener("over",this);
   this._btnOpenClose.addEventListener("out",this);
   this._btnSmileys.addEventListener("out",this);
   this._btnFilter0.addEventListener("out",this);
   this._btnFilter1.addEventListener("out",this);
   this._btnFilter2.addEventListener("out",this);
   this._btnFilter3.addEventListener("out",this);
   this._btnFilter4.addEventListener("out",this);
   this._btnFilter5.addEventListener("out",this);
   this._btnFilter6.addEventListener("out",this);
   this._btnFilter7.addEventListener("out",this);
   this._btnFilter8.addEventListener("out",this);
   this._btnFilter11.addEventListener("out",this);
   this.mostrarBotones();
   this._sSmileys.addEventListener("selectSmiley",this);
   this._sSmileys.addEventListener("selectEmote",this);
   this._txtChat.addEventListener("href",this);
   var _loc2_ = this._btnFilter0;
   var _loc3_ = 0;
   while(_loc2_ != undefined)
   {
      _loc2_.selected = this.api.datacenter.Basics.chat_type_visible[_loc3_] == true;
      _loc2_.selected = true;
      this.api.kernel.ChatManager.setTypeVisible(_loc3_,_loc2_.selected);
      _loc3_ += 1;
      _loc2_ = this["_btnFilter" + _loc3_];
   }
   this.api.kernel.ChatManager.setTypeVisible(1,true);
   this.api.kernel.ChatManager.refresh();
};
_loc1.mostrarBotones = function()
{
   this._btnOrnamentos._visible = this.api.datacenter.Game.isFight == false;
   this._btnFightPos._visible = this.api.datacenter.Game.isFight == false;
   this._btnOgrinas._visible = this.api.datacenter.Game.isFight == false;
   this._btnBestiario._visible = this.api.datacenter.Game.isFight == false;
   this.HdV._visible = this.api.datacenter.Game.isFight == false;
   this.logros._visible = this.api.datacenter.Game.isFight == false;
   this.Pase._visible = this.api.datacenter.Game.isFight == false;
   this.Ladder._visible = this.api.datacenter.Game.isFight == false;
   this._btnOgrinas._visible = this.api.datacenter.Game.isFight == false;
   this.HdV._visible = this.api.datacenter.Game.isFight == false;
   this.logros._visible = this.api.datacenter.Game.isFight == false;
   this.Pase._visible = this.api.datacenter.Game.isFight == false;
   this.Ladder._visible = this.api.datacenter.Game.isFight == false;
   this._btnFightPos._visible = this.api.datacenter.Game.isFight == false;
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_btnSitDown":
         this.api.sounds.events.onBannerChatButtonClick();
         var _loc3_ = this.api.lang.getEmoteID("sit");
         if(_loc3_ != undefined)
         {
            this.api.network.Emotes.useEmote(_loc3_);
         }
         break;
      case "_btnSmileys":
         this.api.sounds.events.onBannerChatButtonClick();
         this.hideSmileys(this._bSmileysOpened);
         break;
      case "_btnOpenClose":
         this.api.sounds.events.onBannerChatButtonClick();
         this.open(!_loc2_.target.selected);
         break;
      case "_btnFilter0":
         this.dispatchEvent({type:"filterChanged",filter:0,selected:this._btnFilter0.selected});
         this.api.kernel.ChatManager.setTypeVisible(0,this._btnFilter0.selected);
         break;
      case "_btnFilter1":
         this.dispatchEvent({type:"filterChanged",filter:1,selected:this._btnFilter1.selected});
         this.api.kernel.ChatManager.setTypeVisible(1,this._btnFilter1.selected);
         break;
      case "_btnFilter2":
         this.dispatchEvent({type:"filterChanged",filter:2,selected:this._btnFilter2.selected});
         this.api.kernel.ChatManager.setTypeVisible(2,this._btnFilter2.selected);
         break;
      case "_btnFilter3":
         this.dispatchEvent({type:"filterChanged",filter:3,selected:this._btnFilter3.selected});
         this.api.kernel.ChatManager.setTypeVisible(3,this._btnFilter3.selected);
         break;
      case "_btnFilter4":
         this.dispatchEvent({type:"filterChanged",filter:4,selected:this._btnFilter4.selected});
         this.api.kernel.ChatManager.setTypeVisible(4,this._btnFilter4.selected);
         break;
      case "_btnFilter5":
         this.dispatchEvent({type:"filterChanged",filter:5,selected:this._btnFilter5.selected});
         this.api.kernel.ChatManager.setTypeVisible(5,this._btnFilter6.selected);
         break;
      case "_btnFilter6":
         this.dispatchEvent({type:"filterChanged",filter:6,selected:this._btnFilter6.selected});
         this.api.kernel.ChatManager.setTypeVisible(6,this._btnFilter6.selected);
         break;
      case "_btnFilter7":
         this.dispatchEvent({type:"filterChanged",filter:7,selected:this._btnFilter7.selected});
         this.api.kernel.ChatManager.setTypeVisible(7,this._btnFilter7.selected);
         break;
      case "_btnFilter8":
         this.dispatchEvent({type:"filterChanged",filter:8,selected:this._btnFilter8.selected});
         this.api.kernel.ChatManager.setTypeVisible(8,this._btnFilter8.selected);
         break;
      case "_btnFilter9":
         this.dispatchEvent({type:"filterChanged",filter:9,selected:this._btnFilter9.selected});
         this.api.kernel.ChatManager.setTypeVisible(9,this._btnFilter9.selected);
         break;
      case "_btnFilter10":
         this.dispatchEvent({type:"filterChanged",filter:10,selected:this._btnFilter10.selected});
         this.api.kernel.ChatManager.setTypeVisible(10,this._btnFilter10.selected);
         break;
      case "_btnFilter11":
         this.dispatchEvent({type:"filterChanged",filter:11,selected:this._btnFilter11.selected});
         this.api.kernel.ChatManager.setTypeVisible(11,this._btnFilter11.selected);
         break;
      default:
         this.dispatchEvent({type:"filterChanged",filter:Number(_loc2_.target._name.substr(10)),selected:_loc2_.target.selected});
   }
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_btnSmileys":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_SMILEYS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case "_btnOpenClose":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_MORE"),_loc2_.target,-33,{bXLimit:true,bYLimit:false});
         break;
      case "_btnSitDown":
         this.gapi.showTooltip(this.api.lang.getText("SITDOWN_TOOLTIP"),_loc2_.target,-46,{bXLimit:true,bYLimit:false});
         break;
      case "_btnBigStore":
         this.gapi.showTooltip(this.api.lang.getText("BIGSTORE_TOOLTIP"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         break;
      default:
         var _loc3_ = Number(_loc2_.target._name.substr(10));
         this.gapi.showTooltip(this.api.lang.getText("CHAT_TYPE" + _loc3_),_loc2_.target,-20,{bXLimit:true,bYLimit:true});
   }
};
_loc1.out = function(_loc2_)
{
   if(this.api.gfx.mapHandler.showingFightCells && !this.api.datacenter.Game.isFight)
   {
      this.api.gfx.unSelect(true);
      this.api.gfx.mapHandler.showingFightCells = false;
   }
   this.gapi.hideTooltip();
};
