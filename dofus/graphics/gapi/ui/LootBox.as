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
_global.dofus["\r\x14"].gapi.ui.LootBox = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.LootBox.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.LootBox.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.LootBox.CLASS_NAME);
};
_loc1._itemlist = "";
_loc1._itemlistBK = "";
_loc1.__set__list = function(mcList)
{
   this._itemlist = mcList;
   this._itemlistBK = mcList;
};
_loc1.init = function()
{
   super.init(false,"LootBox");
};
_loc1.updateItems = function(itemsx)
{
   this.lootbox.lootbox2.itemsdb = itemsx.split(";")[0];
   this.valueS = itemsx.split(";")[1];
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   this.lootbox.lootbox2._btnCerrar._visible = false;
};
_loc1.addListeners = function()
{
   this.abrircofreotro._visible = false;
   this.abrircofre.addEventListener("click",this);
   this.abrircofre.addEventListener("over",this);
   this.abrircofre.addEventListener("out",this);
   this.abrircofreotro.addEventListener("click",this);
   this.abrircofreotro.addEventListener("over",this);
   this.abrircofreotro.addEventListener("out",this);
   this.lootbox.lootbox2._btnCerrar.addEventListener("click",this);
   this.lootbox.lootbox2._btnCerrar.addEventListener("over",this);
   this.lootbox.lootbox2._btnCerrar.addEventListener("out",this);
};
_loc1.initTexts = function()
{
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this.abrircofre:
         api = _global.API;
         api.ui.showTooltip("Ouvrir le coffre",oEvent.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case this.abrircofreotro:
         api = _global.API;
         api.ui.showTooltip("Ouvrez un autre coffre",oEvent.target,-20,{bXLimit:true,bYLimit:false});
         break;
      case this._btnCerrar:
         api = _global.API;
         api.ui.showTooltip("Fermer",oEvent.target,-20,{bXLimit:true,bYLimit:false});
   }
};
_loc1.out = function(oEvent)
{
   api = _global.API;
   api.ui.hideTooltip();
};
_loc1.reiniciame = function(bValue)
{
   if(bValue == 0)
   {
      this.abrircofreotro._visible = true;
   }
   else
   {
      this.abrircofreotro._visible = false;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this.lootbox.lootbox2._btnCerrar:
         this.gapi.unloadUIComponent("LootBox");
         break;
      case this.abrircofreotro:
         this.lootbox.lootbox2.gotoAndStop(1);
         this._itemlist = this._itemlistBK;
         this.abrircofreotro._visible = false;
         this.abrircofre._visible = true;
         break;
      case this.abrircofre:
         if(this._itemlist == "")
         {
            return undefined;
         }
         this.abrircofreotro._visible = false;
         this.lootbox.lootbox2.itemsdb = this._itemlist;
         this.api.network.send("wd" + this._itemlist);
         this.lootbox.lootbox2.gotoAndPlay(2);
         this.abrircofre._visible = false;
         this._itemlist = "";
         break;
   }
};
_loc1.addProperty("loot",function()
{
}
,_loc1.__set__list);
_loc1.valueS = false;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.LootBox.CLASS_NAME = "LootBox";
