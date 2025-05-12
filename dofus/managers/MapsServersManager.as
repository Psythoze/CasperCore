var _loc1 = _global.dofus["\x0b\b"].MapsServersManager.prototype;
_loc1.parseMap2 = function(sID, sDate, oData)
{
   if(this.api.network.Game.isBusy)
   {
      this.addToQueue({object:this,method:this.parseMap2,params:[sID,sDate,oData]});
      return undefined;
   }
   if(oData == undefined)
   {
      oData = this.api.lang.getValueFromSOMapData("MAP_" + sID).data;
      if((oData.id == undefined || oData.date != sDate) && oData.id != sID)
      {
         this.api.network.send("GDm" + sID);
         return undefined;
      }
   }
   else
   {
      var _loc6_ = this.api.lang.getValueFromSOMapData("MAP_" + sID);
      _loc6_.data = oData;
      _loc6_.flush();
   }
   var _loc4_ = Number(oData.id);
   this._bCustomFileCall = false;
   if(this.api.network.Game.nLastMapIdReceived != _loc4_ && this.api.network.Game.nLastMapIdReceived != -1)
   {
      this.api.gfx.onMapLoaded();
      return undefined;
   }
   this._bBuildingMap = true;
   this._lastLoadedMap = oData;
   var _loc10_ = this.getMapName(_loc4_);
   var _loc14_ = Number(oData.width);
   var _loc11_ = Number(oData.height);
   var _loc17_ = Number(oData.backgroundNum);
   var _loc16_ = oData.mapData;
   var _loc7_ = oData.ambianceId;
   var _loc12_ = oData.musicId;
   var _loc9_ = oData.bOutdoor != 1 ? false : true;
   var _loc18_ = (oData.capabilities & 1) == 0;
   var _loc13_ = (oData.capabilities >> 1 & 1) == 0;
   var _loc15_ = (oData.capabilities >> 2 & 1) == 0;
   var _loc8_ = (oData.capabilities >> 3 & 1) == 0;
   this.api.datacenter.Basics.aks_current_map_id = _loc4_;
   this.api.kernel.TipsManager.onNewMap(_loc4_);
   this.api.kernel.StreamingDisplayManager.onNewMap(_loc4_);
   var _loc3_ = new dofus.datacenter["\x10\x15"](_loc4_);
   _loc3_.bCanChallenge = _loc18_;
   _loc3_.bCanAttack = _loc13_;
   _loc3_.bSaveTeleport = _loc15_;
   _loc3_.bUseTeleport = _loc8_;
   _loc3_.bOutdoor = _loc9_;
   _loc3_.ambianceID = _loc7_;
   _loc3_.musicID = _loc12_;
   _loc3_.bCanAttackHunt = oData.bCanAttackHunt;
   _loc3_.bCanUseItem = oData.bCanUseItem;
   _loc3_.bCanEquipItem = oData.bCanEquipItem;
   _loc3_.bCanBoostStats = oData.bCanBoostStats;
   this.api.gfx.buildMap(_loc4_,_loc10_,_loc14_,_loc11_,_loc17_,_loc16_,_loc3_);
   this._bBuildingMap = false;
};
_loc1.loadMap = function(sID, sDate, sKey)
{
   this._lastLoadedMap = undefined;
   if(!_global.isNaN(Number(sID)))
   {
      if(sKey != undefined && sKey.length > 0)
      {
         this._aKeys[Number(sID)] = dofus.aks["\x1e\x0f"].prepareKey(sKey);
      }
      else
      {
         delete this._aKeys[Number(sID)];
      }
   }
   this._lastFileName = sID + "_" + sDate + (this._aKeys[Number(sID)] == undefined ? "" : "X") + ".swf";
   trace("loadMap " + this._lastFileName);
   this.loadData(this._lastFileName);
};
_loc1.test = function()
{
   trace("metodo test");
};
_loc1.cargarMapa = function(sUrl)
{
   ank["\x1e\n\x07"]["\x1e\x0b\x02"](this.EsperaTimer,"Espera");
   this.loadData(sUrl != undefined ? sUrl : this._lastFileName);
};
_loc1.parseMap = function(oData)
{
   trace("parseMap this.api.network.Game.isBusy " + this.api.network.Game.isBusy);
   if(this.api.network.Game.isBusy)
   {
      this.addToQueue({object:this,method:this.parseMap,params:[oData]});
      return undefined;
   }
   var _loc4_ = Number(oData.id);
   if(_global.isNaN(_loc4_))
   {
      if(oData.id != "luisito")
      {
         this.loadData("7777_101211.swf");
      }
      return undefined;
   }
   this._bCustomFileCall = false;
   if(this.api.network.Game.nLastMapIdReceived != _loc4_ && this.api.network.Game.nLastMapIdReceived != -1)
   {
      this.api.gfx.onMapLoaded();
      return undefined;
   }
   this._bBuildingMap = true;
   this._lastLoadedMap = oData;
   var _loc10_ = this.getMapName(_loc4_);
   var _loc12_ = Number(oData.width);
   var _loc11_ = Number(oData.height);
   var _loc8_ = Number(oData.backgroundNum);
   var _loc7_ = this._aKeys[_loc4_] == undefined ? oData.mapData : dofus.aks["\x1e\x0f"].decypherData(oData.mapData,this._aKeys[_loc4_],_global.parseInt(dofus.aks["\x1e\x0f"].checksum(this._aKeys[_loc4_]),16) * 2);
   var _loc6_ = oData.ambianceId;
   var _loc17_ = oData.musicId;
   var _loc16_ = oData.bOutdoor != 1 ? false : true;
   var _loc15_ = (oData.capabilities & 1) == 0;
   var _loc14_ = (oData.capabilities >> 1 & 1) == 0;
   var _loc13_ = (oData.capabilities >> 2 & 1) == 0;
   var _loc9_ = (oData.capabilities >> 3 & 1) == 0;
   this.api.datacenter.Basics.aks_current_map_id = _loc4_;
   this.api.kernel.TipsManager.onNewMap(_loc4_);
   this.api.kernel.StreamingDisplayManager.onNewMap(_loc4_);
   var _loc5_ = new dofus.datacenter["\x10\x15"](_loc4_);
   _loc5_.bCanChallenge = _loc15_;
   _loc5_.bCanAttack = _loc14_;
   _loc5_.bSaveTeleport = _loc13_;
   _loc5_.bUseTeleport = _loc9_;
   _loc5_.bOutdoor = _loc16_;
   _loc5_.ambianceID = _loc6_;
   _loc5_.musicID = _loc17_;
   this.api.gfx.buildMap(_loc4_,_loc10_,_loc12_,_loc11_,_loc8_,_loc7_,_loc5_);
   this._bBuildingMap = false;
};
_loc1.onComplete = function(mc)
{
   var _loc2_ = mc;
   this.parseMap(_loc2_);
};
_loc1.enviarMapData = function()
{
};
_loc1._lastFileName = "";
_loc1._envio = false;
_loc1.EsperaTimer = new Object();
