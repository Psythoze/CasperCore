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
_global.dofus["\r\x14"].gapi.ui.MarketShop = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.MarketShop.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.MarketShop.prototype;
_loc1.__set__members = function(eaMembers)
{
   this._sData = eaMembers;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.MarketShop.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnCerrar.addEventListener("click",this);
   this._cg.addEventListener("selectItem",this);
   this._cg.addEventListener("overItem",this);
   this._cg.addEventListener("outItem",this);
   this._cg.addEventListener("dblClickItem",this);
   this._btnBourse.addEventListener("click",this);
   this._btnFaq.addEventListener("click",this);
   this._cgCats.addEventListener("itemSelected",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgGrid.addEventListener("dblClickItem",this);
};
_loc1.overItem = function(var2)
{
   var _loc2_ = var2.target.contentData;
   _loc2_.showStatsTooltip(var2.target,var2.target.contentData.style);
};
_loc1.outItem = function(var2)
{
   this.gapi.hideTooltip();
};
_loc1.registrarItems = function(_loc2)
{
   if(_loc2.length == 0)
   {
      this._cg.dataProvider = null;
      return undefined;
   }
   var _loc7_ = _loc2.split("|");
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = 0;
   while(_loc4_ < _loc7_.length)
   {
      if(_loc7_[_loc4_].length > 1)
      {
         var _loc3_ = _loc7_[_loc4_].split(";");
         _loc2 = new Object();
         _loc2.id = Number(_loc3_[0]);
         _loc2.price = Number(_loc3_[1]);
         _loc2.stats = _loc3_[2];
         var _loc5_ = _loc3_[3];
         var _loc6_ = _loc3_[4];
         if(_loc5_ != undefined && _loc5_ != null)
         {
            _loc2.items = _loc5_;
         }
         else
         {
            _loc2.items = _loc3_[0];
         }
         if(_loc6_ != undefined && _loc6_ != null)
         {
            _loc2.data = _loc6_;
         }
         _loc8_.push(_loc2);
      }
      _loc4_ = _loc4_ + 1;
   }
   this._cg.dataProvider = _loc8_;
   this._cg.selectedIndex = 0;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target) === this._cgCats)
   {
      var _loc2_ = this._cgCats.selectedItem;
      this.api.network.send("kb+" + _loc2_.Id);
   }
};
_loc1.selectItem = function(oEvent)
{
   if(oEvent.target.contentData != undefined)
   {
      var _loc2_ = oEvent.target.contentData;
      var _loc3_ = this.api.lang.getItemUnicText(Number(_loc2_.unicID)).t;
      this.CAcces(_loc2_.unicID,_loc3_);
      this.descriItemOK(_loc2_.unicID);
   }
};
_loc1.descriItemOK = function(_loc2)
{
   var _loc10_ = this.api.lang.getItemStats(_loc2);
   if(_loc10_ != undefined)
   {
      var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc8_ = new Array();
      var _loc6_ = _loc10_.split(",");
      var _loc4_ = 0;
      while(_loc4_ < _loc6_.length)
      {
         var _loc3_ = _loc6_[_loc4_].split("#");
         _loc3_[0] = _global.parseInt(_loc3_[0],16);
         _loc3_[1] = _loc3_[1] == "0" ? undefined : _global.parseInt(_loc3_[1],16);
         _loc3_[2] = _loc3_[2] == "0" ? undefined : _global.parseInt(_loc3_[2],16);
         _loc3_[3] = _loc3_[3] == "0" ? undefined : _global.parseInt(_loc3_[3],16);
         _loc8_.push(_loc3_);
         _loc4_ += 1;
      }
      var _loc5_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc8_);
      for(var _loc9_ in _loc5_)
      {
         if(_loc5_[_loc9_].description.length > 0)
         {
            _loc7_.push(_loc5_[_loc9_]);
         }
      }
      _loc7_.reverse();
      this._lstInfos.dataProvider = _loc7_;
   }
   this.descriAccessories(_loc2);
};
_loc1.CAcces = function(_id, _type)
{
   var _loc6_ = "";
   switch(_type)
   {
      case 16:
         _loc1.CoiffeId = Number(_id).toString(16);
         break;
      case 17:
         _loc1.CapeId = Number(_id).toString(16);
         break;
      case 18:
         _loc1.FamiId = Number(_id).toString(16);
         break;
      case 82:
         _loc1.BoucId = Number(_id).toString(16);
         break;
      case 113:
         var _loc7_ = this.api.lang.getItemStats(Number(_id));
         var _loc3_ = _loc7_.split(",");
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_].length > 1)
            {
               if(_loc3_[_loc2_].split("#")[0] == "3cd")
               {
                  var _loc4_ = _loc3_[_loc2_].split("#")[4].split("+")[1];
                  if(_loc4_ == "11")
                  {
                     _loc1.CapeId = Number(_id).toString(16) + "~17~1";
                  }
                  else if(_loc4_ == "10")
                  {
                     _loc1.CoiffeId = Number(_id).toString(16) + "~16~1";
                  }
                  else
                  {
                     _loc1.BoucId = Number(_id).toString(16) + "~82~1";
                  }
               }
            }
            _loc2_ = _loc2_ + 1;
         }
   }
   _loc6_ = "," + _loc1.CoiffeId + "," + _loc1.CapeId + "," + _loc1.FamiId + "," + _loc1.BoucId;
   this.api.kernel.CharactersManager.setSpriteAccessories(this._svPlayer.spriteData,_loc6_);
};
_loc1.RefreshPoints = function(_loc2)
{
   this._txtOgrinas.text = Number(_loc2);
   this._txtOgrinas.text = new ank["\x1e\n\x07"]["\x0e\x1c"](_loc2).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.descriAccessories = function(_loc2)
{
   if(_loc2.items != undefined && _loc2.items != null)
   {
      var _loc5_ = _loc2.data.split(",");
      var _loc9_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         if(_loc5_[_loc3_].length > 1)
         {
            var _loc4_ = _global.parseInt(_loc5_[_loc3_],16);
            var _loc6_ = new dofus.datacenter["\f\f"](_loc4_,_loc4_,1,-1,"");
            _loc7_.push(_loc6_);
         }
         _loc3_ = _loc3_ + 1;
      }
      this._cgGrid.dataProvider = _loc7_;
   }
};
_loc1.descriItem = function(_loc2)
{
   var _loc10_ = _loc2.stats;
   if(_loc10_ != undefined)
   {
      var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      var _loc8_ = new Array();
      var _loc6_ = _loc10_.split(",");
      var _loc4_ = 0;
      while(_loc4_ < _loc6_.length)
      {
         var _loc3_ = _loc6_[_loc4_].split("#");
         _loc3_[0] = _global.parseInt(_loc3_[0],16);
         _loc3_[1] = _loc3_[1] == "0" ? undefined : _global.parseInt(_loc3_[1],16);
         _loc3_[2] = _loc3_[2] == "0" ? undefined : _global.parseInt(_loc3_[2],16);
         _loc3_[3] = _loc3_[3] == "0" ? undefined : _global.parseInt(_loc3_[3],16);
         _loc8_.push(_loc3_);
         _loc4_ += 1;
      }
      var _loc5_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc8_);
      for(var _loc9_ in _loc5_)
      {
         if(_loc5_[_loc9_].description.length > 0)
         {
            _loc7_.push(_loc5_[_loc9_]);
         }
      }
      _loc7_.reverse();
      this._lstInfos.dataProvider = _loc7_;
   }
   this.descriAccessories(_loc2);
};
_loc1.initTexts = function()
{
   this._txtOgrinas.text = Number(this._sData.split("@")[1]);
   this._btnCats.label = this.api.lang.getText("ITEM_TYPE");
   this._btnStuffs.label = "Objets";
   this._btnFaq.label = "?";
   this._btnBourse.label = "Bourses aux ogrines";
   this._btnInv.label = "Prévisualisation";
   this._btnTabEffects.label = this.api.lang.getText("EFFECTS");
};
_loc1.initData = function()
{
   var _loc4_ = this.api.datacenter.Player.data;
   var _loc13_ = {color1:_loc4_.color1,color2:_loc4_.color2,color3:_loc4_.color3};
   this._svPlayer.zoom = 250;
   this._svPlayer.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPlayer.refreshDelay = 50;
   this._svPlayer.spriteData = _loc4_;
   var _loc8_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svPlayer.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc12_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc9_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc12_ + ".swf",undefined,5);
   _loc9_.accessories = _loc8_.accessories;
   this._svPlayer.enableBlur = true;
   this._svPlayer.refreshAccessories = !var2;
   this._svPlayer.sourceSpriteData = _loc8_;
   this._svPlayer.spriteData = _loc9_;
   this._svPlayer.setColors(this._oColors);
   var _loc10_ = this._sData.split("@")[0];
   var _loc6_ = _loc10_.split("|");
   var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = 0;
   while(_loc5_ < _loc6_.length)
   {
      if(_loc6_[_loc5_].length > 1)
      {
         _loc4_ = _loc6_[_loc5_].split(",");
         var _loc3_ = new Object();
         _loc3_.Id = Number(_loc4_[0]);
         _loc3_.gfxId = this.api.lang.getItemUnicText(Number(_loc4_[1])).g;
         _loc3_.Name = _loc4_[2];
         _loc3_.Type = this.api.lang.getItemUnicText(Number(_loc4_[1])).t;
         _loc7_.push(_loc3_);
      }
      _loc5_ = _loc5_ + 1;
   }
   this._cgCats.dataProvider = _loc7_;
   this._cgCats.selectedIndex = 0;
   this._cgGrid.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc11_ = this._cgCats.selectedItem;
   this.api.network.send("kb+" + _loc11_.Id);
};
_loc1.change = function(oEvent)
{
   if(oEvent.target._parent._tiSearch.text.length >= 3)
   {
      this.api.network.send("Z*P" + this._tiSearch.text);
   }
   else
   {
      this.updateData(this._eaData[this.NumberTag]);
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnFaq:
         this.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:"Guide d’utilisation de la boutique",text:"Bienvenue dans le manuel d’utilisation de la boutique.  \nDans cette interface vous pouvez naviguer dans toute la boutique du serveur sur n’importe quelle carte.  \n \n1. Comment prévisualiser un objet dans mon personnage ? Vous pouvez prévisualiser l’objet sur votre personnage avant de l’acheter en cliquant sur le bouton  \'Œil \' près du bouton d’achat. \\n \n2. Comment prévisualiser les objets de Cadeaux et Boîtes Mystérieuses ? Cliquez sur l’objet désiré, puis vous verrez le contenu des cadeaux ou des boîtes mystérieuses dans la catégorie  \'Aperçu \'. Enfin, sélectionnez la skin que vous voulez.  \n \n3. Comment puis-je acheter sans choisir la quantité ? \nRestez appuyer sur  \'Ctrl \' avant de cliquer sur  \'Acheter \'. Ce faisant, le montant sera fixé à 1."});
         return undefined;
      case this._btnBourse:
         this.api.network.send("wT");
         return undefined;
      case this._btnCerrar:
         this.api.ui.unloadUIComponent("MarketShop");
         return undefined;
      default:
   }
};
_loc1.addProperty("miembros",function()
{
}
,_loc1.__set__members);
_loc1.CacId = "";
_loc1.CoiffeId = "";
_loc1.CapeId = "";
_loc1.FamiId = "";
_loc1.BoucId = "";
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.MarketShop.CLASS_NAME = "MarketShop";
