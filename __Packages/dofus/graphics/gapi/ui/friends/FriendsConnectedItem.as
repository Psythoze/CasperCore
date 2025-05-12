var _loc1 = dofus["\r\x14"].gapi.ui["\x0e\x03"]["\x0e\x02"].prototype;
_loc1.init = function()
{
   super.init(false);
   this._mcFight._visible = false;
   this._btnRemove._visible = false;
   this._mcEye._visible = false;
};
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   if(_loc2_)
   {
      this._oItem = _loc4_;
      if(_loc4_.account != undefined && !this._mcList._parent._parent.api.config.isStreaming)
      {
         this._lblName.text = _loc4_.account + " (" + _loc4_.name + ")";
      }
      else
      {
         this._lblName.text = _loc4_.name;
      }
      if(_loc4_.level != undefined)
      {
         this._lblLevel.text = _loc4_.level;
      }
      else
      {
         this._lblLevel.text = "";
      }
      this._mcFight._visible = _loc4_.state == "IN_MULTI" && _loc4_.level != "?";
      this._ldrGuild.contentPath = _global.palmad.dofus.Constants.GUILDS_MINI_PATH + _loc4_.gfxID + ".swf";
      if(_loc4_.alignement != -1)
      {
         this._ldrAlignement.contentPath = _global.palmad.dofus.Constants.ALIGNMENTS_MINI_PATH + _loc4_.alignement + ".swf";
      }
      else
      {
         this._ldrAlignement.contentPath = "";
      }
      this._btnRemove._visible = true;
      this._mcEye._visible = _loc4_.state == "IN_MULTI" && _loc4_.level != "?";
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblLevel.text = "";
      this._ldrAlignement.contentPath = "";
      this._mcFight._visible = false;
      this._ldrGuild.contentPath = "";
      this._btnRemove._visible = false;
      this._mcEye._visible = false;
   }
};
_loc1.addListeners = function()
{
   var ref = this;
   this._mcEye.onRelease = function()
   {
      ref._mcList._parent._parent.joinSpectator(ref._oItem.name);
   };
   this._btnRemove.addEventListener("click",this);
};
