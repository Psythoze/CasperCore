var _loc1 = ank.gapi.controls.Container.prototype;
_loc1.__get__centerContent = function()
{
   return this._bCenterContent;
};
_loc1.__set__centerContent = function(bCenterContent)
{
   this._bCenterContent = bCenterContent;
   return this._bCenterContent;
};
_loc1.__get__scaleContent = function()
{
   return this._bScaleContent;
};
_loc1.__set__scaleContent = function(bScaleContent)
{
   this._bScaleContent = bScaleContent;
   return this._bScaleContent;
};
_loc1.createChildren = function()
{
   if(this._bScaleContent == undefined)
   {
      this._bScalContent = true;
   }
   if(this._bCenterContent == undefined)
   {
      this._bCenterContent = false;
   }
   this.createEmptyMovieClip("_mcInteraction",0);
   this.drawRoundRect(this._mcInteraction,0,0,1,1,0,0,0);
   this._mcInteraction.trackAsMenu = true;
   this.attachMovie("Loader","_ldrContent",20,{scaleContent:this._bScaleContent,centerContent:this._bCenterContent});
   this._ldrContent.move(this._nMargin,this._nMargin);
   this._ldrContent.addEventListener("complete",this);
   this.createEmptyMovieClip("_mcLabelBackground",29);
};
_loc1.addProperty("centerContent",_loc1.__get__centerContent,_loc1.__set__centerContent);
_loc1.addProperty("scaleContent",_loc1.__get__scaleContent,_loc1.__set__scaleContent);
