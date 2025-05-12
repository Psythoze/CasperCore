var _loc1 = _global.dofus["\r\x14"].battlefield["\x14"].prototype;
_loc1.initialize = function()
{
   this.createEmptyMovieClip("_mcGfx",10);
   this.createEmptyMovieClip("_mcTxtBackground",20);
   this.createEmptyMovieClip("_mcOrnamentos",21);
};
_loc1.drawGfx = function(sFile, nFrame)
{
   this._mcGfx.attachClassMovie(ank["\x1e\n\x07"]["\x1e\x0b\x15"],"_mcSwfLoader",10);
   this._mcGfx._mcSwfLoader.loadSWF(sFile,nFrame);
};
_loc1.drawOrnamentos = function(sFile, nFrame, aArgs)
{
   this._visible = false;
   if(sFile == undefined)
   {
      sFile = "clips/ornamentos.swf";
   }
   aArgs.ornamento = true;
   this._mcOrnamentos.attachClassMovie(ank["\x1e\n\x07"]["\x1e\x0b\x15"],"_mcSwfLoader2",21);
   this._mcOrnamentos._mcSwfLoader2.loadSWF(sFile,nFrame,aArgs);
};
_global.dofus["\r\x14"].battlefield["\x14"].TEXT_SMALL_FORMAT = new TextFormat("Font1",10,16777215,false,false,false,null,null,"left");
_global.dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT2 = new TextFormat("Font2",8,16777215,false,false,false,null,null,"center");
_global.dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT = new TextFormat("Font2",9,16777215,false,false,false,null,null,"center");
_global.dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT3 = new TextFormat("Font3",8,16777215,false,false,false,null,null,"center");
_global.dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT5 = new TextFormat("Font2",9,16777215,false,false,false,null,null,"center");
_global.dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT6 = new TextFormat("Font2",10,16777215,false,false,false,null,null,"center");
_global.dofus["\r\x14"].battlefield["\x14"].TEXT_FORMAT4 = new TextFormat("Font3",9,16777215,false,false,false,null,null,"center");
