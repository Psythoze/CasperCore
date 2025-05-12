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
_global.dofus["\r\x14"].gapi.ui.Ladder = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Ladder.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Ladder.prototype;
_loc1.__set__data = function(sData)
{
   this._sData = sData;
};
_loc1.__set__dung = function(sData)
{
   this.sDungs = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Ladder.CLASS_NAME);
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
   this._btnNivel.addEventListener("click",this);
   this._btnPVP.addEventListener("click",this);
   this._btnGremio.addEventListener("click",this);
   this._btnSucces.addEventListener("click",this);
   this._btnKoliseo.addEventListener("click",this);
   this._btnPrestige.addEventListener("click",this);
   this._btnOmega.addEventListener("click",this);
   this._btnTempoton.addEventListener("click",this);
   this._btncoeur.addEventListener("click",this);
   this._btnDiaXP.addEventListener("click",this);
   this._btnDuplum.addEventListener("click",this);
   this._btnCerrar.addEventListener("click",this);
   this._btnSearch.addEventListener("click",this);
   this._btnNext.addEventListener("click",this);
   this._btnBack.addEventListener("click",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = "Classement";
   this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("EXPERIMENT"),""];
   this._btnNivel.label = this.api.lang.getText("LEVEL");
   this._btnPVP.label = "PvP";
   this._btnPrestige.label = "Prestige";
   this._btnOmega.label = "Oméga";
   this._btnTempoton.label = "Tempotons";
   this._btncoeur.label = "Coeurs";
   this._btnGremio.label = this.api.lang.getText("GUILD");
   this._btnSucces.label = this.api.lang.getText("STAFF");
   this._btnKoliseo.label = "Kolizeum";
   this._btnDiaXP.label = this.api.lang.getText("DIA_XP");
   this._btnDuplum.label = this.api.lang.getText("DUPLUM");
   this._btnNext.label = "Suivant";
   this._btnBack.label = this.api.lang.getText("BACK");
   this._lblSearch.text = this.api.lang.getText("SEARCH");
   this._btnSearch.label = "OK";
};
_loc1.initData = function()
{
   this._oTipos = new Object();
   var _loc5_ = this._sData.split("|");
   this._btnNivel._visible = false;
   this._btnPVP._visible = false;
   this._btnGremio._visible = false;
   this._btnSucces._visible = false;
   this._btnKoliseo._visible = false;
   this._btnPrestige._visible = false;
   this._btnOmega._visible = false;
   this._btnTempoton._visible = false;
   this._btncoeur._visible = false;
   this._btnDiaXP._visible = false;
   this._btnDuplum._visible = false;
   this._btnNext._visible = false;
   this._btnBack._visible = false;
   if(_loc5_.length == 0)
   {
      return undefined;
   }
   var _loc6_ = 530 / _loc5_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      var _loc4_ = _loc5_[_loc3_];
      var _loc2_ = this["_btn" + _loc4_];
      _loc2_.width = _loc6_;
      _loc2_._y = 116.4;
      _loc2_._x = 109 + _loc3_ * _loc6_;
      _loc2_._visible = true;
      _loc3_ = _loc3_ + 1;
   }
};
_loc1.registrar = function(sData)
{
   var _loc12_ = sData.split("|");
   var _loc6_ = _loc12_[0];
   var _loc13_ = _loc12_[1];
   var _loc9_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc10_ = true;
   var _loc11_ = 0;
   var _loc8_ = 0;
   if(_loc13_.length > 1)
   {
      _loc10_ = false;
      var _loc4_ = 0;
      var _loc5_ = _loc13_.split("#");
      while(_loc4_ < _loc5_.length)
      {
         var _loc2_ = new Object();
         var _loc3_ = _loc5_[_loc4_].split(";");
         _loc2_.nro = Number(_loc3_[0]);
         if(_loc6_ == "GREMIO")
         {
            _loc2_.emblema = _loc3_[1];
         }
         else
         {
            _loc2_.gfx = _loc3_[1];
         }
         _loc2_.nombre = _loc3_[2];
         _loc2_.titulo = _loc3_[3];
         _loc2_.nivel = _loc3_[4];
         _loc2_.experiencia = _loc3_[5];
         _loc2_.estado = _loc3_[6];
         _loc2_.alineacion = _loc3_[7];
         _loc2_.buscado = _loc3_[8] == "1";
         _loc2_.prestigio = _loc3_[9];
         _loc2_.abono = _loc3_[10];
         _loc2_.ptsLogros = _loc3_[11];
         _loc9_.push(_loc2_);
         _loc4_ = _loc4_ + 1;
         if(_loc4_ == 1)
         {
            _loc11_ = _loc2_.nro;
         }
         if(_loc4_ == _loc5_.length)
         {
            _loc8_ = _loc2_.nro;
         }
      }
   }
   if(this._oTipos[_loc6_] == undefined)
   {
      this._oTipos[_loc6_] = new Object();
   }
   var _loc7_ = this._oTipos[_loc6_];
   _loc7_.back = _loc12_[2] == "1";
   _loc7_.next = _loc12_[3] == "1";
   if(!_loc10_ || _loc10_ && !_loc7_.back)
   {
      _loc7_.inicio = _loc11_;
   }
   if(!_loc10_ || _loc10_ && !_loc7_.next)
   {
      _loc7_.fin = _loc8_;
   }
   if(!_loc10_ || _loc10_ && (!_loc7_.back && !_loc7_.next))
   {
      _loc7_.data = _loc9_;
   }
   _loc7_.tipo = _loc6_;
   this.updateData(_loc6_);
};
_loc1.updateData = function(sTipo)
{
   this._oData = this._oTipos[sTipo];
   var _loc2_ = this._oData.data;
   if(_loc2_ == undefined)
   {
      this.api.network.send("ZF" + sTipo);
   }
   else
   {
      this._tiSearch.text = this._oData.search != undefined ? this._oData.search : "";
      this._dgMembers.dataProvider = _loc2_;
      this._btnNext._visible = this._oData.next;
      this._btnBack._visible = this._oData.back;
   }
};
_loc1.updateDatas = function()
{
   this._tiSearch.text = this._oData.search != undefined ? this._oData.search : "";
   this._dgMembers.dataProvider = undefined;
   this._btnNext._visible = false;
   this._btnBack._visible = false;
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_ = oEvent.row.item;
   if(_loc2_.emblema != undefined)
   {
      return undefined;
   }
   if(_loc2_.nombre != this.api.datacenter.Player.Name)
   {
      if(_loc2_.estado == 0)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("USER_NOT_CONNECTED",[_loc2_.nombre]),"ERROR_CHAT");
      }
      else
      {
         var _loc4_ = "Neutre";
         if(_loc2_.alineacion == 1)
         {
            _loc4_ = "Bontarien";
         }
         if(_loc2_.alineacion == 2)
         {
            _loc4_ = "Brakmarien";
         }
         if(_loc2_.alineacion == 3)
         {
            _loc4_ = "Mercenaire";
         }
         var _loc5_ = "En Ligne";
         if(_loc2_.estado == 2)
         {
            _loc5_ = "En Combat";
         }
         if(_loc2_.estado == 3)
         {
            _loc5_ = "Déconnecté";
         }
         var _loc6_ = "Ninguno";
         if(_loc2_.titulo == 0)
         {
            _loc6_ = "Ninguno";
         }
         else
         {
            _loc6_ = _loc2_.titulo;
         }
         var _loc3_ = "Non-Acquis";
         if(_loc2_.abono == 1)
         {
            _loc3_ = "Bronce";
         }
         if(_loc2_.abono == 2)
         {
            _loc3_ = "Non-Acquis";
         }
         if(_loc2_.abono == 3)
         {
            _loc3_ = "Acquis";
         }
         this.api.ui.loadUIComponent("LadderCard").actualizarInfo(_loc2_.nombre,_loc2_.experiencia,_loc2_.nivel,_loc6_,"Prestige " + _loc2_.prestigio,_loc4_,_loc5_,_loc3_,_loc2_.alineacion,_loc2_.gfx,_loc2_.ptsLogros);
      }
   }
};
_loc1.click = function(oEvent)
{
   var _loc2_ = oEvent.target;
   switch(_loc2_)
   {
      case this._btnCerrar:
         this.api.ui.unloadUIComponent("Ladder");
         return undefined;
      case this._btnSearch:
         if(this._oData == undefined)
         {
            return undefined;
         }
         this._oData.search = this._tiSearch.text;
         this.api.network.send("ZF" + this._oData.tipo + "|" + this._oData.search);
         return undefined;
         break;
      case this._btnNext:
         if(this._oData == undefined)
         {
            return undefined;
         }
         this._oData.search = this._tiSearch.text;
         this.api.network.send("ZF" + this._oData.tipo + "|" + this._oData.search + "|" + (this._oData.fin + 1));
         return undefined;
         break;
      case this._btnBack:
         if(this._oData == undefined)
         {
            return undefined;
         }
         this._oData.search = this._tiSearch.text;
         this.api.network.send("ZF" + this._oData.tipo + "|" + this._oData.search + "|" + (- this._oData.inicio));
         return undefined;
         break;
      default:
         this._btnNivel.selected = true;
         this._btnPVP.selected = true;
         this._btnGremio.selected = true;
         this._btnSucces.selected = true;
         this._btnKoliseo.selected = true;
         this._btnPrestige.selected = true;
         this._btnOmega.selected = true;
         this._btnTempoton.selected = true;
         this._btncoeur._visible = true;
         this._btnDiaXP.selected = true;
         this._btnDuplum.selected = true;
         switch(_loc2_)
         {
            case this._btnNivel:
               this.updateData("NIVEL");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("EXPERIMENT"),"",""];
               break;
            case this._btnPVP:
               this.updateData("PVP");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),"Vic.    Der.","",""];
               break;
            case this._btnGremio:
               this.updateData("GREMIO");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Membres",this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("EXPERIMENT"),"",""];
               break;
            case this._btnKoliseo:
               this.updateData("KOLISEO");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),"Vic.    Der.","",""];
               break;
            case this._btnDiaXP:
               this.updateData("DIA");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("EXPERIMENT_DIA"),"",""];
               break;
            case this._btnPrestige:
               this.updateData("PRESTIGE");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),"Prestige","",""];
               break;
            case this._btnOmega:
               this.updateData("OMEGA");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre","Omg.","Prestige","",""];
               break;
            case this._btnTempoton:
               this.updateData("TEMPOTON");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),"Tempo.","",""];
               break;
            case this._btncoeur:
               this.updateData("COEUR");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),"Coeurs.","",""];
               break;
            case this._btnSucces:
               this.updateData("SUCCESS");
               this._dgMembers.columnsNames = ["#","",this.api.lang.getText("NAME_BIG"),"Titre",this.api.lang.getText("LEVEL_SMALL"),this.api.lang.getText("POINTS_SUCCES"),"",""];
         }
         _loc2_.selected = false;
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
_loc1._oTipos = new Object();
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Ladder.CLASS_NAME = "Ladder";
