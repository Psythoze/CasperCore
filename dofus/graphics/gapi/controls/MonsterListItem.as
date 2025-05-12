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
if(!dofus["\r\x14"].gapi.controls)
{
   _global.dofus["\r\x14"].gapi.controls = new Object();
}
_global.dofus["\r\x14"].gapi.controls.MonsterListItem = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.MonsterListItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = dofus["\r\x14"].gapi.controls.MonsterListItem.prototype;
_loc1["\x17\x06\x07"] = function()
{
   return this["\x17\x14\x0e"];
};
_loc1["\x16\x0b\x15"] = function(_loc2_)
{
   this["\x17\x14\x0e"] = _loc2_;
   if(this.initialized)
   {
      this.beginDisplay();
   }
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.Card.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.beginDisplay});
};
_loc1.initData = function()
{
   this._ldrIcon.addEventListener("initialization",this);
};
_loc1.initialization = function(_loc2_)
{
   var mc = _loc2_.clip;
   mc._visible = false;
   mc.attachMovie("staticR","mcAnim",10);
   mc.onEnterFrame = function()
   {
      nCompteur++;
      if(nCompteur >= 3)
      {
         monsterListItem.prepareSprite(this);
         delete mc.onEnterFrame;
      }
   };
};
_loc1.prepareSprite = function(_loc2_)
{
   if(_loc2_._width > _loc2_._height)
   {
      _loc2_._xscale = _loc2_._yscale = 2000 / _loc2_._width;
   }
   else
   {
      _loc2_._yscale = _loc2_._xscale = 2000 / _loc2_._height;
   }
   _loc2_._visible = true;
};
_loc1.beginDisplay = function()
{
   if(this.contentPath == undefined)
   {
      return undefined;
   }
   this._ldrIcon.forceReload = true;
   this._ldrIcon.content.removeMovieClip();
   this._ldrIcon.contentPath = this.contentPath;
};
_loc1.addProperty("contentPath",function()
{
}
,_loc1["\x17\x06\x07"],_loc1["\x16\x0b\x15"]);
_loc1.sAnim = "StaticR";
ASSetPropFlags(_loc1,null,1);
dofus["\r\x14"].gapi.controls.MonsterListItem.CLASS_NAME = "MonsterListItem";
