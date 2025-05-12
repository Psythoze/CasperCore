if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].gapi)
{
   _global.dofus["\r\x14"].gapi = new Object();
}
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
if(!dofus["\r\x14"].gapi.ui.temporis)
{
   _global.dofus["\r\x14"].gapi.ui.temporis = new Object();
}
dofus["\r\x14"].gapi.ui.temporis.TemporisChallengeExotic = function(nObjectGfxId, nQuestId, nPreviousQuestId)
{
   super();
   this.initialize(nObjectGfxId,nQuestId,nPreviousQuestId);
};
var _loc1 = dofus["\r\x14"].gapi.ui.temporis.TemporisChallengeExotic.prototype;
_loc1.initialize = function(nObjectGfxId, nQuestId, nPreviousQuestId)
{
   this._nObjectGfxId = nObjectGfxId;
   this._nQuestId = nQuestId;
   this._nPreviousQuestId = nPreviousQuestId;
};
_loc1.__get__objectGfxId = function()
{
   return this._nObjectGfxId;
};
_loc1.__set__objectGfxId = function(sId)
{
   this._nObjectGfxId = sId;
};
_loc1.__get__questId = function()
{
   return this._nQuestId;
};
_loc1.__set__questId = function(sId)
{
   this._nQuestId = sId;
};
_loc1.__get__previousQuestId = function()
{
   return this._nPreviousQuestId;
};
_loc1.__set__previousQuestId = function(sId)
{
   this._nPreviousQuestId = sId;
};
_loc1.addProperty("objectGfxId",_loc1.__get__objectGfxId,_loc1.__set__objectGfxId);
_loc1.addProperty("previousQuestId",_loc1.__get__previousQuestId,_loc1.__set__previousQuestId);
_loc1.addProperty("questId",_loc1.__get__questId,_loc1.__set__questId);
_loc1._nObjectGfxId = 0;
_loc1._nQuestId = 0;
_loc1._nPreviousQuestId = 0;
ASSetPropFlags(_loc1,null,1);
