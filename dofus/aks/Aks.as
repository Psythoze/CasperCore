var _loc1 = dofus.aks["\x1e\x0f"].prototype;
_loc1.electron = function(sData)
{
   this.sValue = sData;
};
_loc1.initialize = function(_loc2_)
{
   super.initialize(_loc3_);
   this.Basics = new dofus.aks.Basics(this,_loc3_);
   this.Account = new dofus.aks.Account(this,_loc3_);
   this.Friends = new dofus.aks.Friends(this,_loc3_);
   this.Enemies = new dofus.aks.Enemies(this,_loc3_);
   this.Chat = new dofus.aks.Chat(this,_loc3_);
   this.Dialog = new dofus.aks.Dialog(this,_loc3_);
   this.Exchange = new dofus.aks.Exchange(this,_loc3_);
   this.Game = new dofus.aks.Game(this,_loc3_);
   this.GameActions = new dofus.aks.GameActions(this,_loc3_);
   this.Houses = new dofus.aks.Houses(this,_loc3_);
   this.Infos = new dofus.aks.Infos(this,_loc3_);
   this.Items = new dofus.aks.Items(this,_loc3_);
   this.Job = new dofus.aks.Job(this,_loc3_);
   this.Key = new dofus.aks.Key(this,_loc3_);
   this.Spells = new dofus.aks.Spells(this,_loc3_);
   this.Storages = new dofus.aks.Storages(this,_loc3_);
   this.Emotes = new dofus.aks.Emotes(this,_loc3_);
   this.Documents = new dofus.aks.Documents(this,_loc3_);
   this.Guild = new dofus.aks.Guild(this,_loc3_);
   this.Waypoints = new dofus.aks.Waypoints(this,_loc3_);
   this.Zones = new dofus.aks.Zones(this,_loc3_);
   this.Koliseo = new dofus.aks.Koliseo(this,_loc3_);
   this.InventoryShortcuts = new dofus.aks.InventoryShortcuts(this,_loc3_);
   this.Subareas = new dofus.aks.Subareas(this,_loc3_);
   this.Specialization = new dofus.aks.Specialization(this,_loc3_);
   this.Fights = new dofus.aks.Fights(this,_loc3_);
   this.Tutorial = new dofus.aks.Tutorial(this,_loc3_);
   this.Quests = new dofus.aks.Quests(this,_loc3_);
   this.Party = new dofus.aks.Party(this,_loc3_);
   this.Subway = new dofus.aks.Subway(this,_loc3_);
   this.Mount = new dofus.aks.Mount(this,_loc3_);
   this.Conquest = new dofus.aks.Conquest(this,_loc3_);
   this.ChooseReward = new dofus.aks.ChooseReward(this,_loc3_);
   this.Ping = new Object();
   this.Lag = new Object();
   this.Deco = new Object();
   this._bLag = false;
   this._bAutoReco = this.api.lang.getConfigText("AUTO_RECONNECT") == true;
   this._oDataProcessor = new dofus.aks["\x11\f"](this,_loc3_);
   this._xSocket = new XMLSocket();
   this._aLastPings = new Array();
   var aks = this;
   this._xSocket.onClose = function()
   {
      aks.onClose();
      aks.resetKeys();
   };
   this._xSocket.onConnect = function(_loc2_)
   {
      aks.onConnect(_loc2_);
   };
   this._xSocket.onData = function(_loc2_)
   {
      aks.onData(_loc2_);
   };
   this._oLoader = new LoadVars();
   this._oLoader.onLoad = function(_loc2_)
   {
      aks.onLoad(_loc2_);
   };
};
