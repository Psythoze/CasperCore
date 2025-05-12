var _loc1 = dofus.datacenter.Basics.prototype;
_loc1.__get__pathMove_intoWorld = function()
{
   return this._sPathMove_intoWorld;
};
_loc1.__set__pathMove_intoWorld = function(sPathMove_intoWorld)
{
   this._sPathMove_intoWorld = sPathMove_intoWorld;
};
_loc1.initialize = function()
{
   this.api.kernel.debug("initializeBasics");
   delete this.connexionKey;
   delete this.lastPingTimer;
   delete this.gfx_lastActionTime;
   delete this.gfx_canLaunch;
   delete this.gfx_lastArea;
   this.lastDateUpdate = -1000000;
   this.aks_server_will_disconnect = false;
   this.aks_gifts_stack = new Array();
   delete this.aks_chat_lastActionTime;
   this.chat_type_visible = new Object();
   delete this.aks_emote_lastActionTime;
   delete this.aks_exchange_echangeType;
   _global.clearInterval(this.aks_infos_lifeRestoreInterval);
   delete this.aks_infos_lifeRestoreInterval;
   delete this.aks_infos_highlightCoords;
   delete this.aks_ticket;
   delete this.aks_gameserver_ip;
   delete this.aks_gameserver_port;
   this.aks_rescue_count = -1;
   this.aks_servers = new ank["\x1e\n\x07"]["\x0f\x01"]();
   delete this.aks_current_server;
   delete this.aks_identity;
   if(this.aks_a_logs == undefined)
   {
      this.aks_a_logs = "";
   }
   this.aks_a_prompt = "";
   this.aks_debug_command_line = "";
   delete this.spellManager_errorMsg;
   delete this.interactionsManager_path;
   delete this.inventory_filter;
   delete this.banner_targetCoords;
   this.payzone_isFirst = true;
   delete this.quests_lastID;
   this.craftViewer_filter = [true,true,true,true,true,true,true,true];
   this.mapExplorer_filter = [false,false,true,false,true];
   this.mapExplorer_zoom = 50;
   this.mapExplorer_coord = undefined;
   this.mapExplorer_grid = false;
   this.isLogged = false;
   this.inGame = false;
   this.serverMessageID = -1;
   this.createCharacter = false;
   this.chatParams = new Object();
   this.aks_current_team = -1;
   this.aks_team1_starts = null;
   this.aks_team2_starts = null;
   this.inactivity_signaled = 0;
   this.first_connection_from_miniclip = false;
   this.first_movement = false;
   this.canUseSeeAllSpell = true;
   _global.API.kernel.SpellsBoostsManager.clear();
};
_loc1.addProperty("pathMove_intoWorld",_loc1.__get__pathMove_intoWorld,_loc1.__set__pathMove_intoWorld);
