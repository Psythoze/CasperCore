var _loc1 = dofus.aks.Friends.prototype;
_loc1.joinViewer = function(sName)
{
   this.aks.send("FS" + sName);
};
