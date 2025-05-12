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
_global.dofus["\r\x14"].gapi.ui.Preview = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Preview.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Preview.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Preview.CLASS_NAME);
};
_loc1.__set__item = function(sData)
{
   this.sItems = sData;
};
_loc1.__set__tipo = function(sData)
{
   this.tipo = sData;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initComponent});
};
_loc1.click = function(var2)
{
   switch(var2.target)
   {
      case this._btnClose:
      case this._btnCancel:
         this.gapi.unloadUIComponent("Preview");
   }
};
_loc1.addListeners = function()
{
   this._btnCancel.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
};
_loc1.initComponent = function()
{
   this.showMyself();
};
_loc1.showMyself = function()
{
   var _loc6_ = false;
   var _loc20_ = false;
   var _loc10_ = this.api.datacenter.Player.data;
   if(_loc10_ == undefined)
   {
      this._svCharacter._visible = false;
      this._csColors._visible = false;
      return undefined;
   }
   if(this._svCharacter.spriteData == undefined)
   {
      var _loc15_ = _loc10_.color1;
      var _loc13_ = _loc10_.color2;
      var _loc11_ = _loc10_.color3;
   }
   else
   {
      _loc15_ = this._svCharacter.getColor(1);
      _loc13_ = this._svCharacter.getColor(2);
      _loc11_ = this._svCharacter.getColor(3);
   }
   this._oColors = {color1:_loc15_,color2:_loc13_,color3:_loc11_};
   this._svCharacter.zoom = 200;
   this._svCharacter.spriteAnims = ["StaticF","StaticR","StaticL","WalkF","RunF","Anim2R","Anim2L"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.useSingleLoader = true;
   var _loc18_ = this.api.datacenter.Player.Guild;
   var _loc17_ = this.api.datacenter.Player.Sex;
   this._csColors.breed = _loc18_;
   this._csColors.sex = _loc17_;
   this._csColors.colors = [_loc15_,_loc13_,_loc11_];
   var _loc19_ = _loc18_ + "" + _loc17_;
   var _loc14_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc19_ + ".swf",undefined,5);
   var _loc16_ = sExtraData.split("|");
   var _loc21_ = _loc16_[0];
   var _loc23_ = _loc16_[1].split(",");
   var _loc8_ = new Array();
   var _loc2_ = 0;
   while(_loc2_ < 5)
   {
      var _loc4_ = this.sItems;
      var _loc3_ = new dofus.datacenter["\x11"](undefined,undefined,undefined);
      switch(this.tipo)
      {
         case 16:
            if(_loc2_ == 1)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 17:
            if(_loc2_ == 2)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 18:
            if(_loc2_ == 3)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 82:
            if(_loc2_ == 4)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
      }
      _loc8_[_loc2_] = _loc3_;
      _loc2_ += 1;
   }
   var _loc22_ = this.api.datacenter.Sprites.getItemAt(_loc21_);
   if(!_loc6_)
   {
      _loc14_.accessories = _loc8_;
   }
   if(_loc20_)
   {
      var _loc5_ = this.api.datacenter.Player.mount;
      if(_loc5_ != undefined)
      {
         var _loc9_ = new dofus.datacenter.Mount(_loc5_.modelID,Number(_loc19_));
         var _loc7_ = false;
         for(var _loc12_ in _loc5_.capacities)
         {
            _loc6_ = _loc5_.capacities[_loc12_].data;
            if(_loc6_ == 9)
            {
               _loc7_ = true;
               break;
            }
         }
         if(_loc7_)
         {
            _loc9_.capacities = _loc5_.capacities;
            _loc9_.customColor1 = _loc13_;
            _loc9_.customColor2 = _loc11_;
            _loc9_.customColor3 = _loc11_;
         }
         _loc14_.mount = _loc9_;
      }
   }
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !_loc6_;
   this._svCharacter.sourceSpriteData = _loc10_;
   this._svCharacter.spriteData = _loc14_;
   this._svCharacter.setColors(this._oColors);
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("PREVIEW_WINDOW");
   this._lblCharacterName.text = this.api.datacenter.Player.Name;
   this._btnCancel.label = this.api.lang.getText("BACK");
};
_loc1.addProperty("item",function()
{
}
,_loc1.__set__item);
_loc1.addProperty("type",function()
{
}
,_loc1.__set__tipo);
_loc1.sItems = 0;
_loc1.tipo = 0;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Preview.CLASS_NAME = "Preview";
