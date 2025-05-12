var _loc1 = dofus.datacenter.Exchange.prototype;
_loc1.__set__distantOgrine = function(nDistantOgrine)
{
   _loc1._nDistantOgrine = nDistantOgrine;
   this.dispatchEvent({type:"distantOgrineChange",value:nDistantOgrine});
};
_loc1.__get__distantOgrine = function()
{
   return _loc1._nDistantOgrine;
};
_loc1.__set__localOgrine = function(nLocalOgrine)
{
   this._nLocalOgrine = nLocalOgrine;
   this.dispatchEvent({type:"localOgrineChange",value:nLocalOgrine});
};
_loc1.__get__localOgrine = function()
{
   return _loc1._nLocalOgrine;
};
_loc1.initialize = function(nDistantPlayerID)
{
   _loc1._nLocalOgrine = 0;
   _loc1._nDistantOgrine = 0;
   eval("\t\x04").events["\x0f\x03"].initialize(this);
   this._nDistantPlayerID = nDistantPlayerID;
   this._eaLocalGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaDistantGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaCoopGarbage = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaReadyStates = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaReadyStates[0] = false;
   this._eaReadyStates[1] = false;
};
_loc1.addProperty("localOgrine",_loc1.__get__localOgrine,_loc1.__set__localOgrine);
_loc1.addProperty("distantOgrine",_loc1.__get__distantOgrine,_loc1.__set__distantOgrine);
