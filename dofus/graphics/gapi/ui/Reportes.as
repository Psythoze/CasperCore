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
_global.dofus["\r\x14"].gapi.ui.Reportes = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Reportes.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Reportes.prototype;
_loc1.__set__members = function(eaMembers)
{
   this._sData = eaMembers;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Reportes.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._dgMembers.addEventListener("itemSelected",this);
   this._btnBugs.addEventListener("click",this);
   this._btnSugerencias.addEventListener("click",this);
   this._btnDenuncias.addEventListener("click",this);
   this._btnOgrinas.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnLeidos.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("REPORTES");
   this._dgMembers.columnsNames = [this.api.lang.getText("NRO"),this.api.lang.getText("NAME_BIG"),this.api.lang.getText("SHORTCUTS_DESCRIPTION"),this.api.lang.getText("DATE")];
   this._btnBugs.label = this.api.lang.getText("BUGS");
   this._btnDenuncias.label = this.api.lang.getText("DENUNCIAS");
   this._btnOgrinas.label = this.api.lang.getText("OGRINAS");
   this._btnSugerencias.label = this.api.lang.getText("SUGERENCIAS");
   this._lblLeidos.text = this.api.lang.getText("MOSTRAR_REPORTES_LEIDOS");
};
_loc1.initData = function()
{
   this._btnLeidos.selected = false;
   var _loc8_ = this._sData.split("|");
   var _loc9_ = new Object();
   var _loc5_ = 0;
   while(_loc5_ < _loc8_.length)
   {
      var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      if(_loc8_[_loc5_].length > 1)
      {
         var _loc4_ = 0;
         var _loc6_ = _loc8_[_loc5_].split("#");
         while(_loc4_ < _loc6_.length)
         {
            var _loc2_ = new Object();
            var _loc3_ = _loc6_[_loc4_].split(";");
            _loc2_.nro = _loc3_[0];
            _loc2_.name = _loc3_[1];
            _loc2_.description = _loc3_[2];
            _loc2_.fecha = _loc3_[3];
            _loc2_.leido = _loc3_[4] == "1";
            _loc7_.push(_loc2_);
            _loc4_ = _loc4_ + 1;
         }
      }
      _loc9_[_loc5_] = _loc7_;
      _loc5_ = _loc5_ + 1;
   }
   this._eaData = _loc9_;
};
_loc1.updateData = function(eaMembers)
{
   if(this._btnLeidos.selected)
   {
      this._dgMembers.dataProvider = eaMembers;
   }
   else
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      for(var _loc4_ in eaMembers)
      {
         if(!eaMembers[_loc4_].leido)
         {
            _loc3_.push(eaMembers[_loc4_]);
         }
      }
      this._dgMembers.dataProvider = _loc3_;
   }
};
_loc1.itemSelected = function(oEvent)
{
   var _loc3_ = oEvent.row.item;
   if(!_loc3_.leido || _global.CONFIG.skipLanguageVerification)
   {
      this.api.network.send("Zr" + this.index + _loc3_.nro + ";" + _loc3_.name);
   }
   if(_global.CONFIG.skipLanguageVerification)
   {
      this.api.kernel.GameManager.showReportePopupMenu(this.index,_loc3_.nro);
   }
   _loc3_.leido = true;
};
_loc1.click = function(oEvent)
{
   var _loc0_ = null;
   if((_loc0_ = oEvent.target) !== this._btnLeidos)
   {
      var _loc3_ = oEvent.target;
      this._btnBugs.selected = true;
      this._btnSugerencias.selected = true;
      this._btnOgrinas.selected = true;
      this._btnDenuncias.selected = true;
      switch(oEvent.target)
      {
         case this._btnBugs:
            this.updateData(this._eaData[0]);
            this.index = 0;
            break;
         case this._btnSugerencias:
            this.updateData(this._eaData[1]);
            this.index = 1;
            break;
         case this._btnDenuncias:
            this.updateData(this._eaData[2]);
            this.index = 2;
            break;
         case this._btnOgrinas:
            this.updateData(this._eaData[3]);
            this.index = 3;
            break;
         default:
            break;
         case this._btnCerrar:
            this.api.ui.unloadUIComponent("Reportes");
            return undefined;
      }
      _loc3_.selected = false;
   }
   this.updateData(this._eaData[this.index]);
   return undefined;
};
_loc1.addProperty("miembros",function()
{
}
,_loc1.__set__members);
_loc1.index = 0;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Reportes.CLASS_NAME = "Reportes";
