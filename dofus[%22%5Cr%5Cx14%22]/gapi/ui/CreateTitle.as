_global.dofus["\r\x14"].gapi.ui.CreateTitle = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.CreateTitle.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.CreateTitle.prototype;
_loc1.__set__puntos = function(sValue)
{
   this.Puntos = sValue;
};
_loc1.init = function()
{
   super.init(false,"CreateTitle");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initComponents});
};
_loc1.initTexts = function()
{
   this._btnValidate.label = this.api.lang.getText("VALIDATE");
   this._lblValue.text = "";
   this._itName.text = "";
   this._lblColors.text = this.api.lang.getText("CREATE_COLOR");
   this._lblName.text = this.api.lang.getText("TITLE_CREATE_NAME");
   this._win.title = this.api.lang.getText("TITLE_CREATE");
   this._precio.text = "Prix: " + this.Puntos;
};
_loc1.initListeners = function()
{
   this._cpColors.addEventListener("change",this);
   this._itName.addEventListener("change",this);
   this._btnValidate.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
};
_loc1.initComponents = function()
{
   this._svCharacterViewer.spriteData = this.api.datacenter.Player.data;
   this._colors = -1;
};
_loc1.change = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._cpColors:
         this._lblValue.textColor = oEvent.value;
         this._itName.textColor = oEvent.value;
         this._colors = oEvent.value;
         break;
      case this._itName:
         this._lblValue.text = this._itName.text;
   }
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnCancel:
         this.callClose();
         break;
      case this._btnValidate:
         this.api.network.send("XF" + this._lblValue.text + ";" + this._colors);
         this.callClose();
   }
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
ASSetPropFlags(_loc1,null,1);
_loc1.addProperty("puntos",function()
{
}
,_loc1.__set__puntos);
_loc1.Puntos = 0;
_global.dofus["\r\x14"].gapi.ui.CreateTitle.CLASS_NAME = "CreateTitle";
