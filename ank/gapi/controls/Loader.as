var _loc1 = ank.gapi.controls.Loader.prototype;
_loc1.__get__tempVars = function()
{
   return this._oTempVars;
};
_loc1.__set__tempVars = function(oTempVars)
{
   this._oTempVars = oTempVars;
};
_loc1.load = function()
{
   if(this._sPrevURL == undefined && this._sURL == "")
   {
      return undefined;
   }
   if(!this._bForceReload && (this._sPrevURL == this._sURL || this._sURL == undefined || this.holder_mc == undefined))
   {
      return undefined;
   }
   this._visible = false;
   this._bLoaded = false;
   this._sPrevURL = this._sURL;
   this.holder_mc.content_mc.removeMovieClip();
   if(this._sURL.toLowerCase().indexOf(".swf") != -1 || this._sURL.toLowerCase().indexOf(".png") != -1)
   {
      if(this.holder_mc.content_mc == undefined)
      {
         this.holder_mc.createEmptyMovieClip("content_mc",1);
      }
      this._mvlLoader.loadClip(this._sURL,this.holder_mc.content_mc);
   }
   else
   {
      this.holder_mc.attachMovie(this._sURL,"content_mc",1,this._oParams);
      this.onLoadComplete(this.holder_mc.content_mc);
      this.onLoadInit(this.holder_mc.content_mc);
   }
};
_loc1.addProperty("tempVars",_loc1.__get__tempVars,_loc1.__set__tempVars);
