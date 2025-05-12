var _loc1 = dofus["\r\x14"].gapi.ui.Friends.prototype;
_loc1.joinSpectator = function(sName)
{
   this.api.network.Friends.joinViewer(sName);
};
