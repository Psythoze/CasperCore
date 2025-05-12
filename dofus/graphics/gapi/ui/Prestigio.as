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
_global.dofus["\r\x14"].gapi.ui.Prestigio = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Prestigio.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Prestigio.prototype;
_loc1.init = function()
{
   super.init(false,"Prestigio");
};
_loc1.__set__datos = function(nValue)
{
   this._datos = nValue;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.item1 = 0;
_loc1.item2 = 0;
_loc1.item3 = 0;
_loc1.item4 = 0;
_loc1.item5 = 0;
_loc1.item6 = 0;
_loc1.item7 = 0;
_loc1.item8 = 0;
_loc1.recibe = false;
_loc1.item1nombre = "";
_loc1.item2nombre = "";
_loc1.item3nombre = "";
_loc1.item4nombre = "";
_loc1.item5nombre = "";
_loc1.item6nombre = "";
_loc1.item7nombre = "";
_loc1.item8nombre = "";
_loc1.desliza = 0;
_loc1.descriItem = function(oEvent)
{
   var _loc4_ = oEvent;
   var _loc2_ = -20;
   var _loc1_ = _loc4_.name;
   var _loc5_ = true;
   for(var _loc6_ in _loc4_.effects)
   {
      var _loc3_ = _loc4_.effects[_loc6_];
      if(_loc3_.description.length > 0)
      {
         if(_loc5_)
         {
            _loc1_ += "\n";
            _loc2_ -= 10;
            _loc5_ = false;
         }
         _loc1_ = _loc1_ + "\n" + _loc3_.description;
         _loc2_ -= 12;
      }
   }
   return _loc1_;
};
_loc1.mispts = 0;
_loc1.cargaTodo = function(contenido, elvalxx)
{
   this.recibe = false;
   this.todoOff();
   this._datos = contenido;
   var _loc5_ = this._datos.split(",");
   var _loc16_ = _loc5_.length - 1;
   this.progreso.value = this._datos.split(",")[_loc16_].split(";")[1];
   var _loc9_ = this._datos.split(",")[_loc16_].split(";")[2];
   var _loc17_ = this._datos.split(",")[_loc16_].split(";")[3];
   if(elvalxx)
   {
      this.desliza = int(_loc17_);
   }
   var _loc18_ = this._datos.split(",")[_loc16_].split(";")[4];
   var _loc19_ = this._datos.split(",")[_loc16_].split(";")[5];
   this.mispts = int(_loc19_);
   if(_loc17_ == 0)
   {
      this.btnIza._visible = false;
   }
   else
   {
      this.btnIza._visible = true;
   }
   if(_loc5_.length <= 8 || _loc18_ == 1)
   {
      this.btnDer._visible = false;
   }
   else if(_loc18_ == 0)
   {
      this.btnDer._visible = true;
   }
   var _loc3_ = 0;
   while(_loc3_ < 8)
   {
      var _loc2_ = _loc5_[_loc3_].split(";")[0];
      if(_loc2_ == "info")
      {
         break;
      }
      var _loc10_ = _loc5_[_loc3_].split(";")[1];
      var _loc7_ = _loc5_[_loc3_].split(";")[5];
      this["item" + _loc2_] = _loc7_;
      if(_loc10_ == "item")
      {
         var _loc11_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         var _loc4_ = _loc5_[_loc3_].split(";")[7];
         var _loc14_ = _loc4_.split("^").join(",");
         var _loc13_ = new dofus.datacenter["\f\f"](_loc7_,_loc7_,1,-1,_loc14_);
         _loc11_.push(_loc13_);
         this["item" + _loc2_ + "nombre"] = this.descriItem(_loc13_);
         this["infoitem" + _loc2_]._visible = true;
         this["objeto" + _loc2_].dataProvider = _loc11_;
         this["objeto" + _loc2_]._visible = true;
      }
      else if(_loc10_ == "hechi")
      {
         var _loc12_ = new dofus.datacenter["\x1e\x0f\x02"](_loc7_,1);
         this["item" + _loc2_ + "nombre"] = "Sort: " + _loc12_.name;
         this["infoitem" + _loc2_]._visible = true;
         this["hechizo" + _loc2_].contentPath = _loc12_.iconFile;
         this["hechizo" + _loc2_]._visible = true;
      }
      var _loc6_ = _loc5_[_loc3_].split(";")[2];
      if(_loc6_ == 1)
      {
         this["candado" + _loc2_]._visible = false;
         this["completo" + _loc2_]._visible = true;
      }
      else
      {
         this["candado" + _loc2_]._visible = true;
         this["completo" + _loc2_]._visible = false;
      }
      var _loc15_ = _loc5_[_loc3_].split(";")[3];
      this["precio" + _loc2_].text = _loc15_;
      var _loc8_ = _loc5_[_loc3_].split(";")[4];
      _loc4_ = _loc5_[_loc3_].split(";")[6];
      if(_loc4_ == 1)
      {
         this["esvip" + _loc2_]._visible = true;
      }
      else
      {
         this["esvip" + _loc2_]._visible = false;
      }
      if(_loc6_ == 0 || _loc6_ == 1 && _loc8_ == 1)
      {
         this["reclama" + _loc2_]._visible = false;
      }
      if(_loc8_ == 1)
      {
         this["chek" + _loc2_]._visible = true;
      }
      if(_loc6_ == 1 && _loc8_ == 0)
      {
         if(_loc4_ == 1 && _loc9_ == 1 || _loc4_ == 0 && _loc9_ == 1 || _loc4_ == 0 && _loc9_ == 0)
         {
            this["reclama" + _loc2_]._visible = true;
            this["chek" + _loc2_]._visible = false;
            this["reclama" + _loc2_].enabled = true;
         }
         else if(_loc4_ == 1 && _loc9_ == 0)
         {
            this["reclama" + _loc2_]._visible = true;
            this["reclama" + _loc2_].enabled = false;
         }
      }
      _loc3_ = _loc3_ + 1;
   }
};
_loc1.todoOff = function()
{
   var _loc2_ = 1;
   while(_loc2_ < 9)
   {
      this["hechizo" + _loc2_]._visible = false;
      this["objeto" + _loc2_]._visible = false;
      this["chek" + _loc2_]._visible = false;
      this["reclama" + _loc2_]._visible = false;
      this["completo" + _loc2_]._visible = false;
      this["esvip" + _loc2_]._visible = false;
      this["infoitem" + _loc2_]._visible = false;
      this["precio" + _loc2_].text = "";
      _loc2_ += 1;
   }
};
_loc1.initData = function()
{
   this.cargaTodo(this._datos,true);
};
_loc1.addListeners = function()
{
   var _loc2_ = 1;
   while(_loc2_ < 9)
   {
      this["reclama" + _loc2_].addEventListener("click",this);
      this["infoitem" + _loc2_].addEventListener("over",this);
      this["infoitem" + _loc2_].addEventListener("out",this);
      _loc2_ += 1;
   }
   this.infopuntos.addEventListener("over",this);
   this.infopuntos.addEventListener("out",this);
   this.cerrar.addEventListener("click",this);
   this.btnDer.addEventListener("click",this);
   this.btnIza.addEventListener("click",this);
};
_loc1.out = function(oEvent)
{
   this.api.ui.hideTooltip();
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this.infopuntos:
         this.gapi.showTooltip("Tu as un total de " + this.mispts + " points de succées.",_root._xmouse,_root._ymouse - 25,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem1:
         this.gapi.showTooltip(this.item1nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem2:
         this.gapi.showTooltip(this.item2nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem3:
         this.gapi.showTooltip(this.item3nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem4:
         this.gapi.showTooltip(this.item4nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem5:
         this.gapi.showTooltip(this.item5nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem6:
         this.gapi.showTooltip(this.item6nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem7:
         this.gapi.showTooltip(this.item7nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem8:
         this.gapi.showTooltip(this.item8nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
   }
};
_loc1.initTexts = function()
{
   var _loc2_ = 1;
   while(_loc2_ < 9)
   {
      this["reclama" + _loc2_].label = this.api.lang.getText("RECLAMARBP");
      _loc2_ += 1;
   }
   this._lblInfos.text = this.api.lang.getText("INFORMATIONS");
   this._txtInfos.text = this.api.lang.getText("PASEBATALLA");
   this._txtInfos2.text = this.api.lang.getText("PASEBATALLA2");
   this.infoventana.title = this.api.lang.getText("PASEBATALLATITULO");
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this.btnDer:
         if(this.recibe)
         {
            return undefined;
         }
         this.recibe = true;
         this.desliza += 8;
         _global.API.network.send("wo" + this.desliza);
         break;
      case this.btnIza:
         if(this.recibe)
         {
            return undefined;
         }
         this.recibe = true;
         this.desliza -= 8;
         _global.API.network.send("wv" + this.desliza);
         break;
      case this.reclama1:
         this.reclama1._visible = false;
         _global.API.network.send("m" + this.item1);
         break;
      case this.reclama2:
         this.reclama2._visible = false;
         _global.API.network.send("m" + this.item2);
         break;
      case this.reclama3:
         this.reclama3._visible = false;
         _global.API.network.send("m" + this.item3);
         break;
      case this.reclama4:
         this.reclama4._visible = false;
         _global.API.network.send("m" + this.item4);
         break;
      case this.reclama5:
         this.reclama5._visible = false;
         _global.API.network.send("m" + this.item5);
         break;
      case this.reclama6:
         this.reclama6._visible = false;
         _global.API.network.send("m" + this.item6);
         break;
      case this.reclama7:
         this.reclama7._visible = false;
         _global.API.network.send("m" + this.item7);
         break;
      case this.reclama8:
         this.reclama8._visible = false;
         _global.API.network.send("m" + this.item8);
         break;
      case this.cerrar:
         _global.API.ui.unloadUIComponent("Prestigio");
   }
};
_loc1.addProperty("datos",function()
{
}
,_loc1.__set__datos);
_loc1._datos = "";
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Prestigio.CLASS_NAME = "Prestigio";
