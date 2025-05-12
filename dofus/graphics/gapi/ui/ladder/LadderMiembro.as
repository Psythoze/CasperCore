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
if(!dofus["\r\x14"].gapi.ui.ladder)
{
   _global.dofus["\r\x14"].gapi.ui.ladder = new Object();
}
_global.dofus["\r\x14"].gapi.ui.ladder.LadderMiembro = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.ladder.LadderMiembro.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.ladder.LadderMiembro.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._lblNro.text = oItem.nro;
      if(oItem.gfx != undefined && oItem.gfx != "")
      {
         this._ldrGuild.contentPath = dofus.Constants.GUILDS_MINI_PATH + oItem.gfx + ".swf";
      }
      else
      {
         this._ldrGuild.contentPath = "";
      }
      if(oItem.emblema != undefined)
      {
         var _loc4_ = oItem.emblema.split(",");
         this._eEmblem._visible = true;
         this._eEmblem.backID = _global.parseInt(_loc4_[0],36);
         this._eEmblem.backColor = _global.parseInt(_loc4_[1],36);
         this._eEmblem.upID = _global.parseInt(_loc4_[2],36);
         this._eEmblem.upColor = _global.parseInt(_loc4_[3],36);
         this._lblRank.text = oItem.titulo;
         this._ldrAlignement.contentPath = "";
      }
      else
      {
         if(oItem.rush !== "epa")
         {
            this._lblRank.text = this.getTitulo(oItem.titulo);
         }
         else
         {
            this._lblRank.text = oItem.titulo;
         }
         this._eEmblem._visible = false;
      }
      this._lblName.text = oItem.nombre;
      if(oItem.nro == 1)
      {
         this.top3._visible = false;
         this.top2._visible = false;
         this.top1._visible = true;
      }
      else if(oItem.nro == 2)
      {
         this.top3._visible = false;
         this.top2._visible = true;
         this.top1._visible = false;
      }
      else if(oItem.nro == 3)
      {
         this.top3._visible = true;
         this.top2._visible = false;
         this.top1._visible = false;
      }
      this._lblLevel.text = oItem.nivel;
      this._lblWinXP.text = oItem.experiencia;
      this._mcFight._visible = oItem.estado == 2;
      this._mcOffline._visible = oItem.estado == 0;
      if(oItem.alineacion != undefined && oItem.alineacion != "")
      {
         this._ldrAlignement.contentPath = dofus.Constants.ALIGNMENTS_MINI_PATH + oItem.alineacion + ".swf";
      }
      if(oItem.cote != undefined && oItem.cote != "")
      {
         this._lblCote.text = oItem.cote;
      }
      this._mcSearch._visible = oItem.buscado == true;
   }
   else if(this._lblNro.text != undefined)
   {
      this._lblNro.text = "";
      this._lblName.text = "";
      this._lblRank.text = "";
      this._lblLevel.text = "";
      this._lblWinXP.text = "";
      this._ldrGuild.contentPath = "";
      this._ldrAlignement.contentPath = "";
      this._mcFight._visible = false;
      this._mcOffline._visible = false;
      this.top3._visible = false;
      this.top2._visible = false;
      this.top1._visible = false;
      this._mcSearch._visible = false;
      this._eEmblem._visible = false;
      this._lblCote.text = "";
   }
};
_loc1.getTitulo = function(sData)
{
   if(sData == undefined || sData == "0")
   {
      return "";
   }
   var _loc4_ = "";
   var _loc3_ = Number(sData.split("~")[0]);
   var _loc5_ = sData.split("~")[1];
   switch(this._mcList.gapi.api.lang.getTitle(_loc3_).pt)
   {
      case 1:
         _loc4_ = this._mcList.gapi.api.lang.getTitle(_loc3_).t.split("%1").join(this._mcList.gapi.api.lang.getMonsters()[_global.parseInt(_loc5_)].n);
         break;
      case 0:
      default:
         _loc4_ = this._mcList.gapi.api.lang.getTitle(_loc3_).t.split("%1").join(_loc5_);
   }
   return _loc4_;
};
_loc1.init = function()
{
   super.init(false);
   this._mcFight._visible = false;
   this._mcOffline._visible = false;
   this._mcSearch._visible = false;
   this.top3._visible = false;
   this.top2._visible = false;
   this.top1._visible = false;
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
ASSetPropFlags(_loc1,null,1);
