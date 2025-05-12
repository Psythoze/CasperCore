var _loc1 = dofus["\r\x14"].gapi.ui.Spells.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Spells.CLASS_NAME);
   switch(this.gapi.getUIComponent("Banner").shortcuts.getCurrentTab())
   {
      case "Spells":
      case "Spells2":
         break;
      default:
         this.gapi.getUIComponent("Banner").shortcuts.setCurrentTab("Spells");
   }
};
