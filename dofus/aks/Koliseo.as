if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.aks)
{
   _global.dofus.aks = new Object();
}
_global.dofus.aks.Koliseo = function(oAKS, oAPI)
{
   super.initialize(oAKS,oAPI);
};
_global.dofus.aks.Koliseo.prototype = new dofus.aks.Handler();
var _loc1 = _global.dofus.aks.Koliseo.prototype;
_loc1.invite = function(sSpriteName)
{
   this.aks.send("kI" + sSpriteName);
};
_loc1.refuseInvitation = function()
{
   this.aks.send("kR",false);
};
_loc1.acceptInvitation = function()
{
   this.aks.send("kA");
};
_loc1.leave = function(sSpriteID)
{
   this.aks.send("kV" + (sSpriteID == undefined ? "" : sSpriteID));
};
_loc1.onInvite = function(bSuccess, sExtraData)
{
   if(bSuccess)
   {
      var _loc4_ = sExtraData.split("|");
      var _loc2_ = _loc4_[0];
      var _loc3_ = _loc4_[1];
      if(_loc2_ == undefined || _loc3_ == undefined)
      {
         this.refuseInvitation();
         return undefined;
      }
      if(_loc2_ == this.api.datacenter.Player.Name)
      {
         this.api.kernel.showMessage(this.api.lang.getText("KOLISEO"),this.api.lang.getText("YOU_INVITE_B_IN_KOLISEO",[_loc3_]),"INFO_CANCEL",{name:"Koliseo",listener:this});
      }
      if(_loc3_ == this.api.datacenter.Player.Name)
      {
         if(this.api.kernel.ChatManager.isBlacklisted(_loc2_))
         {
            this.refuseInvitation();
            return undefined;
         }
         this.api.kernel.showMessage(undefined,this.api.lang.getText("CHAT_A_INVITE_YOU_IN_KOLISEO",[this.api.kernel.ChatManager.getLinkName(_loc2_)]),"INFO_CHAT");
         this.api.kernel.showMessage(this.api.lang.getText("KOLISEO"),this.api.lang.getText("A_INVITE_YOU_IN_KOLISEO",[_loc2_]),"CAUTION_YESNOIGNORE",{name:"Koliseo",player:_loc2_,listener:this,params:{player:_loc2_}});
         this.api.sounds.events.onGameInvitation();
      }
   }
   else
   {
      var _loc5_ = sExtraData.charAt(0);
      switch(_loc5_)
      {
         case "a":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("KOLISEO_ALREADY_IN_GROUP"),"ERROR_CHAT",{name:"KoliseoError"});
            break;
         case "f":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("KOLISEO_FULL"),"ERROR_CHAT",{name:"KoliseoError"});
            break;
         case "n":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_FIND_ACCOUNT_OR_CHARACTER",[sExtraData.substr(1)]),"ERROR_CHAT",{name:"KoliseoError"});
      }
   }
};
_loc1.onRefuse = function(sExtraData)
{
   this.api.ui.unloadUIComponent("AskYesNoIgnoreKoliseo");
   this.api.ui.unloadUIComponent("AskCancelKoliseo");
};
_loc1.onAccept = function(sExtraData)
{
   this.api.ui.unloadUIComponent("AskYesNoIgnoreKoliseo");
   this.api.ui.unloadUIComponent("AskCancelKoliseo");
};
_loc1.onCreate = function(bSuccess, sExtraData)
{
   if(bSuccess)
   {
      this.api.ui.loadUIComponent("Koliseo","Koliseo",undefined,{bStrayIfPresent:true});
   }
   else
   {
      var _loc2_ = sExtraData.charAt(0);
      switch(_loc2_)
      {
         case "a":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("KOLISEO_ALREADY_IN_GROUP"),"ERROR_CHAT",{name:"KoliseoError"});
            break;
         case "f":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("KOLISEO_FULL"),"ERROR_CHAT",{name:"KoliseoError"});
      }
   }
};
_loc1.onLeave = function(sExtraData)
{
   var _loc3_ = this.api.ui.getUIComponent("Koliseo");
   if(_loc3_.followID != undefined)
   {
      this.api.kernel.GameManager.updateCompass(this.api.datacenter.Basics.banner_targetCoords[0],this.api.datacenter.Basics.banner_targetCoords[1]);
   }
   var _loc2_ = _loc3_.getMember(sExtraData).name;
   if(_loc2_ != undefined)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("A_KICK_FROM_KOLISEO",[_loc2_]),"INFO_CHAT");
   }
   else
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("LEAVE_GROUP"),"INFO_CHAT");
   }
   this.api.ui.unloadUIComponent("Koliseo");
   this.api.ui.unloadUIComponent("AskYesNoIgnoreKoliseo");
   this.api.ui.unloadUIComponent("AskCancelKoliseo");
   this.api.datacenter.Player.inKoliseo = false;
   this.api.datacenter.Basics.aks_infos_highlightCoords_clear(2);
};
_loc1.onMovement = function(sExtraData)
{
   var _loc32_ = sExtraData.charAt(0) == "+";
   var _loc6_ = this.api.ui.getUIComponent("Koliseo");
   var _loc30_ = sExtraData.substr(1).split("|");
   var _loc7_ = -1;
   while(true)
   {
      _loc7_ = _loc7_ + 1;
      if(_loc7_ >= _loc30_.length)
      {
         break;
      }
      var _loc2_ = String(_loc30_[_loc7_]).split(";");
      var _loc5_ = _loc2_[0];
      switch(sExtraData.charAt(0))
      {
         case "+":
            var _loc28_ = _loc2_[1];
            var _loc10_ = _loc2_[2];
            var _loc24_ = Number(_loc2_[3]);
            var _loc16_ = Number(_loc2_[4]);
            var _loc26_ = Number(_loc2_[5]);
            var _loc22_ = _loc2_[6];
            var _loc14_ = _loc2_[7];
            var _loc27_ = Number(_loc2_[8]);
            var _loc20_ = Number(_loc2_[9]);
            var _loc15_ = Number(_loc2_[10]);
            var _loc8_ = Number(_loc2_[11]);
            var _loc4_ = new Object();
            _loc4_.id = _loc5_;
            _loc4_.name = _loc28_;
            _loc4_.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _loc10_ + ".swf";
            _loc4_.color1 = _loc24_;
            _loc4_.color2 = _loc16_;
            _loc4_.color3 = _loc26_;
            _loc4_.life = _loc14_;
            _loc4_.level = _loc27_;
            _loc4_.initiative = _loc20_;
            _loc4_.prospection = _loc15_;
            _loc4_.side = _loc8_;
            this.api.kernel.CharactersManager.setSpriteAccessories(_loc4_,_loc22_);
            _loc6_.addMember(_loc4_);
            break;
         case "-":
            _loc6_.removeMember(_loc5_,true);
            break;
         case "~":
            var _loc18_ = _loc2_[1];
            var _loc29_ = _loc2_[2];
            var _loc25_ = Number(_loc2_[3]);
            var _loc21_ = Number(_loc2_[4]);
            var _loc9_ = Number(_loc2_[5]);
            var _loc23_ = _loc2_[6];
            var _loc17_ = _loc2_[7];
            var _loc12_ = Number(_loc2_[8]);
            var _loc13_ = Number(_loc2_[9]);
            var _loc19_ = Number(_loc2_[10]);
            var _loc11_ = Number(_loc2_[11]);
            var _loc3_ = new Object();
            _loc3_.id = _loc5_;
            _loc3_.name = _loc18_;
            _loc3_.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + _loc29_ + ".swf";
            _loc3_.color1 = _loc25_;
            _loc3_.color2 = _loc21_;
            _loc3_.color3 = _loc9_;
            _loc3_.life = _loc17_;
            _loc3_.level = _loc12_;
            _loc3_.initiative = _loc13_;
            _loc3_.prospection = _loc19_;
            _loc3_.side = _loc11_;
            this.api.kernel.CharactersManager.setSpriteAccessories(_loc3_,_loc23_);
            _loc6_.updateData(_loc3_);
      }
   }
   _loc6_.refresh();
};
_loc1.cancel = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskCancelKoliseo")
   {
      this.refuseInvitation();
   }
};
_loc1.yes = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskYesNoIgnoreKoliseo")
   {
      this.acceptInvitation();
   }
};
_loc1.no = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskYesNoIgnoreKoliseo")
   {
      this.refuseInvitation();
   }
};
_loc1.ignore = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target._name) === "AskYesNoIgnoreKoliseo")
   {
      this.api.kernel.ChatManager.addToBlacklist(oEvent.params.player);
      this.api.kernel.showMessage(undefined,this.api.lang.getText("TEMPORARY_BLACKLISTED",[oEvent.params.player]),"INFO_CHAT");
      this.refuseInvitation(oEvent.params.spriteID);
   }
};
ASSetPropFlags(_loc1,null,1);
