_global.dofus["\r\x14"].gapi.controls.LadderMiembrosObjetivos = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.LadderMiembrosObjetivos.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.LadderMiembrosObjetivos.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this.Nombre = oItem.name;
      this._lblPosition.text = oItem.position;
      this._lblName.text = oItem.name;
      this._lblEstado.text = oItem.estado;
      this._btnInfo._visible = true;
      var _loc3_ = oItem.finalizado;
      if(_loc3_ == 0)
      {
         this._misok._visible = false;
         this._misnok._visible = true;
      }
      else
      {
         this._misok._visible = true;
         this._misnok._visible = false;
         this._btnInfo._visible = false;
      }
   }
   else if(this._lblName.text != undefined)
   {
      this._lblPosition.text = "";
      this._lblName.text = "";
      this._lblEstado.text = "";
      this._btnInfo._visible = false;
      this._misok._visible = false;
      this._misnok._visible = false;
   }
};
_loc1.click = function(oEvent)
{
   if(oEvent.target === this._btnInfo)
   {
      api = _global.API;
      api.network.send("wx" + this._lblPosition.text);
   }
};
_loc1.out = function(oEvent)
{
   api = _global.API;
   api.ui.hideTooltip();
};
_loc1.over = function(oEvent)
{
   if(oEvent.target._name === "_btnInfo")
   {
      api = _global.API;
      api.ui.showTooltip("Plus d\'information sur la quête: " + this.Nombre,oEvent.target,-20,{bXLimit:true,bYLimit:false});
   }
};
_loc1.addListeners = function()
{
   this._btnInfo.addEventListener("click",this);
   this._btnInfo.addEventListener("over",this);
   this._btnInfo.addEventListener("out",this);
   this._lblName.addEventListener("over",this);
   this._lblName.addEventListener("out",this);
};
_loc1.init = function()
{
   super.init(false);
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
_loc1.Nombre = "";
ASSetPropFlags(_loc1,null,1);
