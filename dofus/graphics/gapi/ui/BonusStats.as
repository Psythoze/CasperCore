_global.dofus["\r\x14"].gapi.ui.BonusStats = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.BonusStats.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.BonusStats.prototype;
_loc1.__set__Stat = function(nValue)
{
   this._nStat = nValue;
};
_loc1.init = function()
{
   super.init(false,"BonusStats");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   switch(_global.parseInt(this._nStat,10))
   {
      case 10:
         this._lblIcone.contentPath = "IconEarthBonus";
         break;
      case 11:
         this._lblIcone.contentPath = "IconVita";
         break;
      case 12:
         this._lblIcone.contentPath = "IconWisdom";
         break;
      case 13:
         this._lblIcone.contentPath = "IconWaterBonus";
         break;
      case 14:
         this._lblIcone.contentPath = "IconAirBonus";
         break;
      case 15:
         this._lblIcone.contentPath = "IconFireBonus";
         break;
      default:
         this._lblIcone.contentPath = "OeufCasse";
   }
};
_loc1.addListeners = function()
{
   this._btnValidate.addEventListener("click",this);
   this._btnUp.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._btnValidate.label = this.api.lang.getText("VALIDATE");
   this._btnUp.label = this.api.lang.getText("MAX");
   this._txtTitle.text = this.api.lang.getText("AUTO_BOOST");
   this._txtDescription.text = this.api.lang.getText("QUANTITY");
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnValidate:
         if(!this.api.datacenter.Game.isFight)
         {
            this.api.network.send("AB" + this._nStat + ";" + this._tiSearch.text);
         }
      case this._btnCancel:
         this.gapi.unloadUIComponent("BonusStats");
         break;
      case this._btnUp:
         this._tiSearch.text = this.api.datacenter.Player.BonusPoints;
   }
};
_loc1.addProperty("stat",function()
{
}
,_loc1.__set__Stat);
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.BonusStats.CLASS_NAME = "BonusStats";
