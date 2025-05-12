var _loc1 = dofus["\r\x14"].gapi.ui.CardsCollection.prototype;
_loc1.__set__Mobs = function(sMobs)
{
   this._realMobs = new Array();
   this._aMobs = new Array();
   this._aMobs.contains();
   var _loc9_ = this.api.lang.getMonsters();
   var _loc4_ = sMobs.split(",");
   for(var _loc10_ in _loc9_)
   {
      var _loc2_ = this.api.lang.getMonstersText(_loc10_);
      var _loc3_ = false;
      for(var _loc8_ in _loc4_)
      {
         if(_loc4_[_loc8_] == _loc10_)
         {
            _loc3_ = true;
            break;
         }
      }
      if(!_loc3_)
      {
         this._realMobs.push({id:_loc10_,name:_loc2_.n,gfxFile:_loc2_.g});
         this._aMobs.push({id:_loc10_,name:_loc2_.n,gfxFile:_loc2_.g});
      }
   }
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initAnimList});
};
_loc1.initTexts = function()
{
   this._lblSpells.text = this.api.lang.getText("SPELLS");
   this._lblDrops.text = this.api.lang.getText("DROPS");
   this._btnSearchMob.label = this.api.lang.getText("MOB");
   this._btnSearchDrop.label = this.api.lang.getText("DROP");
   this._btnUbicacion.label = this.api.lang.getText("UBICACION");
   this._tiSearch.text = "";
   this._tiSearch.setFocus();
   this._tiSearch.borderColor3 = 65280;
   this._txtInvestigados.text = this._realMobs.length + " " + this.api.lang.getText("MOBS_INVESTIGADOS");
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   var _loc3_ = 1;
   while(_loc3_ <= 9)
   {
      var _loc2_ = this["_ctr" + _loc3_];
      _loc2_.addEventListener("click",this);
      _loc2_.addEventListener("over",this);
      _loc2_.addEventListener("out",this);
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 1;
   while(_loc3_ <= 6)
   {
      _loc2_ = this["_btnLevel" + _loc3_];
      _loc2_.addEventListener("click",this);
      _loc2_.enabled = false;
      _loc3_ = _loc3_ + 1;
   }
   this._btnSearchMob.addEventListener("click",this);
   this._btnSearchDrop.addEventListener("click",this);
   this._btnDer.addEventListener("click",this);
   this._btnIzq.addEventListener("click",this);
   this._lstSpells.addEventListener("itemSelected",this);
   this._lstDrops.addEventListener("itemSelected",this);
   this._cbAnim.addEventListener("itemSelected",this);
   this._btnUbicacion.addEventListener("click",this);
};
_loc1.initAnimList = function(eaTypes)
{
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 0;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= dofus["\r\x14"].gapi.ui.MonsterAndLookSelector.ANIM_LIST.length)
      {
         break;
      }
      _loc4_.push({label:dofus["\r\x14"].gapi.ui.MonsterAndLookSelector.ANIM_LIST[_loc2_]});
   }
   this._cbAnim.dataProvider = _loc4_;
};
_loc1.initData = function()
{
   this._cciSprite.deleteButton = false;
   this._btnIzq._visible = false;
   this._mcSpellFullInfosPlacer._visible = false;
   this.infoDrop(false);
   this._nMaxPages = _global.parseInt(this._realMobs.length / 9) + 1;
   if(this._nMaxPages > Number(1))
   {
      this._btnDer._visible = true;
   }
   else
   {
      this._btnDer._visible = false;
   }
   this.actualizarData();
   this._aDrops = new Array();
   var _loc6_ = this.api.lang.getItemUnics();
   for(var _loc7_ in _loc6_)
   {
      var _loc3_ = this.api.lang.getItemUnicText(_loc7_);
      this._aDrops.push({id:_loc7_,name:_loc3_.n});
   }
   this._btnUbicacion._visible = false;
};
_loc1.buscarMob = function(sFilter)
{
   this._aMobs = new Array();
   for(var _loc8_ in this._realMobs)
   {
      var _loc2_ = this._realMobs[_loc8_];
      var _loc3_ = _loc2_.name;
      if(!(sFilter.length > 0 && _loc3_.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))
      {
         this._aMobs.push({id:_loc2_.id,name:_loc2_.name,gfxFile:_loc2_.gfxFile});
      }
   }
   this._aMobs.sortOn("name");
   this._nPage = 1;
   this.actualizarData();
};
_loc1.buscarDrop = function(sFilter)
{
   if(sFilter == undefined || sFilter == "")
   {
      this.buscarMob("");
      return undefined;
   }
   var _loc2_ = "";
   for(var _loc6_ in this._aDrops)
   {
      var _loc3_ = this._aDrops[_loc6_];
      var _loc4_ = _loc3_.name;
      if(!(sFilter.length > 0 && _loc4_.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))
      {
         if(_loc2_.length > 0)
         {
            _loc2_ += ",";
         }
         _loc2_ += _loc3_.id;
      }
   }
   this.api.network.send("Ze" + _loc2_);
};
_loc1.mostrarMobsDrops = function(sMobs)
{
   this._aMobs = new Array();
   var _loc4_ = sMobs.split(",");
   var _loc3_ = new Object();
   for(var _loc8_ in _loc4_)
   {
      var _loc2_ = Number(_loc4_[_loc8_]);
      _loc3_[_loc2_] = true;
   }
   for(_loc8_ in this._realMobs)
   {
      _loc2_ = this._realMobs[_loc8_];
      if(_loc3_[_loc2_.id])
      {
         this._aMobs.push({id:_loc2_.id,name:_loc2_.name,gfxFile:_loc2_.gfxFile});
      }
   }
   this._aMobs.sortOn("name");
   this._nPage = 1;
   this.actualizarData();
};
_loc1.actualizarData = function()
{
   var _loc2_ = 1;
   while(_loc2_ <= 9)
   {
      var _loc4_ = Number((this._nPage - 1) * 9) + _loc2_;
      this["_ctr" + _loc2_].forceNextLoad();
      if(_loc4_ > this._aMobs.length)
      {
         this["_ctr" + _loc2_].contentData = {iconFile:"Card",params:{name:"",background:0,gfxFile:""}};
      }
      else
      {
         var _loc3_ = this._aMobs[_loc4_ - 1];
         this["_ctr" + _loc2_].contentData = {iconFile:"Card",params:{name:_loc3_.name,background:5,gfxFile:dofus.Constants.ARTWORKS_BIG_PATH + _loc3_.gfxFile + ".swf"},id:_loc3_.id,gfxId:_loc3_.gfxFile,name:_loc3_.name};
      }
      _loc2_ = _loc2_ + 1;
   }
   if(this._nPage == this._nMaxPages)
   {
      this._btnDer._visible = false;
   }
   else if(this._nPage == 1)
   {
      this._btnIzq._visible = false;
   }
   this._txtPage.text = this._nPage;
};
_loc1.visualizar = function(sPacket)
{
   var _loc5_ = sPacket.split("|");
   var _loc7_ = Number(_loc5_[0]);
   var _loc6_ = _loc5_[1];
   var _loc2_ = 1;
   while(_loc2_ <= 6)
   {
      this["_btnLevel" + _loc2_].enabled = false;
      _loc2_ = _loc2_ + 1;
   }
   this._oStats = new Object();
   var _loc4_ = 1;
   var _loc3_ = 2;
   while(_loc3_ < _loc5_.length)
   {
      this._oStats[_loc4_] = _loc5_[_loc3_];
      this["_btnLevel" + _loc4_].enabled = true;
      _loc4_ = _loc4_ + 1;
      _loc3_ = _loc3_ + 1;
   }
   this._lblTipo.text = this.api.lang.getMonstersRaceText(_loc7_).n;
   this.cargarDrops(_loc6_);
   this.cambiarNivel(1);
};
_loc1.cargarDrops = function(sS)
{
   var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   if(sS.length > 0)
   {
      var _loc3_ = sS.split(";");
      for(var _loc6_ in _loc3_)
      {
         var _loc2_ = _loc3_[_loc6_].split(",");
         _loc5_.push({id:_loc2_[0],label:this.api.lang.getItemUnicText(_loc2_[0]).n + (!this.api.datacenter.Player.isAuthorized ? "" : " (" + _loc2_[0] + ")"),drop:_loc2_[1]});
      }
   }
   else
   {
      _loc5_.push({id:-1,label:this.api.lang.getText("NONE")});
   }
   this._lstDrops.dataProvider = _loc5_;
};
_loc1.cargarHechizos = function(sS)
{
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   if(sS.length > 0)
   {
      var _loc3_ = sS.split(",");
      for(var _loc5_ in _loc3_)
      {
         var _loc2_ = _loc3_[_loc5_].split("@")[0];
         _loc4_.push({id:_loc2_,label:this.api.lang.getSpellText(_loc2_).n + (!this.api.datacenter.Player.isAuthorized ? "" : " (" + _loc2_ + ")")});
      }
   }
   else
   {
      _loc4_.push({id:-1,label:this.api.lang.getText("NONE")});
   }
   this._lstSpells.dataProvider = _loc4_;
};
_loc1.cambiarNivel = function(nNumber)
{
   if(this._oStats[nNumber] == undefined)
   {
      return undefined;
   }
   var _loc2_ = 1;
   while(_loc2_ <= 6)
   {
      this["_btnLevel" + _loc2_].selected = _loc2_ == Number(nNumber);
      _loc2_ = _loc2_ + 1;
   }
   var _loc3_ = this._oStats[nNumber].split("~");
   this._lblLP.text = _loc3_[0];
   this._lblAP.text = _loc3_[1];
   this._lblMP.text = _loc3_[2];
   var _loc6_ = _loc3_[3].split(",");
   this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + _loc6_[0];
   var _loc5_ = _loc6_[1].split(";");
   this._lblNeutral.text = _loc5_[0];
   this._lblEarth.text = _loc5_[1];
   this._lblFire.text = _loc5_[2];
   this._lblWater.text = _loc5_[3];
   this._lblAir.text = _loc5_[4];
   this.cargarHechizos(_loc3_[4]);
   this._lblExp.text = _loc3_[5];
   this._lblKamas.text = _loc3_[6];
};
_loc1.close = function(oEvent)
{
   this.showDetails(false);
};
_loc1.click = function(oEvent)
{
   this.infoDrop(false);
   switch(oEvent.target._name)
   {
      case "_btnSearchMob":
         this.buscarMob(this._tiSearch.text);
         break;
      case "_btnSearchDrop":
         this.buscarDrop(this._tiSearch.text);
         break;
      case "_btnDer":
         if(this._nPage + 1 > this._nMaxPages)
         {
            this._btnDer._visible = false;
            return undefined;
         }
         this._btnIzq._visible = true;
         this._nPage = this._nPage + 1;
         this.actualizarData();
         break;
      case "_btnIzq":
         if(this._nPage - 1 <= 0)
         {
            this._btnIzq._visible = false;
            return undefined;
         }
         this._btnDer._visible = true;
         this._nPage = this._nPage - 1;
         this.actualizarData();
         break;
      case "_btnClose":
         this.callClose();
         break;
      case "_btnLevel1":
      case "_btnLevel2":
      case "_btnLevel3":
      case "_btnLevel4":
      case "_btnLevel5":
      case "_btnLevel6":
         this.cambiarNivel(Number(oEvent.target._name.substr(9)));
         break;
      case "_btnUbicacion":
         if(this.ActualMobId != 0)
         {
            this.api.network.send("Zf" + this.ActualMobId);
         }
         break;
      case "_ctr1":
      case "_ctr2":
      case "_ctr3":
      case "_ctr4":
      case "_ctr5":
      case "_ctr6":
      case "_ctr7":
      case "_ctr8":
      case "_ctr9":
         if(oEvent.target.contentData.id == undefined)
         {
            return undefined;
         }
         this.api.network.send("ZE" + oEvent.target.contentData.id);
         var _loc3_ = oEvent.target.contentData;
         if(_loc3_ != undefined)
         {
            this._cciSprite.data = {name:_loc3_.name,gfxFile:dofus.Constants.CLIPS_PERSOS_PATH + _loc3_.gfxId + ".swf",title:_loc3_.id};
            this._cciSprite.enabled = true;
         }
         else
         {
            this._cciSprite.data = undefined;
            this._cciSprite.enabled = false;
         }
         this._btnUbicacion._visible = true;
         this.ActualMobId = oEvent.target.contentData.id;
         break;
   }
};
_loc1.ActualMobId = 0;
_loc1.showDetails = function(bShow)
{
   this._sfivSpellFullInfosViewer.removeMovieClip();
   if(bShow)
   {
      this.attachMovie("SpellFullInfosViewer","_sfivSpellFullInfosViewer",this.getNextHighestDepth(),{_x:this._mcSpellFullInfosPlacer._x,_y:this._mcSpellFullInfosPlacer._y});
      this._sfivSpellFullInfosViewer.addEventListener("close",this);
   }
};
_loc1.itemSelected = function(oEvent)
{
   if(oEvent.target.selectedItem.id == -1 || oEvent.target.selectedItem.id == Number(-1))
   {
      return undefined;
   }
   switch(oEvent.target._name)
   {
      case "_cbAnim":
         this._cciSprite.setAnim(this._cbAnim.selectedItem.label,true);
         break;
      case "_lstSpells":
         this.infoDrop(false);
         if(oEvent.row.item != undefined)
         {
            if(this._sfivSpellFullInfosViewer.spell.ID != oEvent.target.selectedItem.id)
            {
               this.showDetails(true);
               this._sfivSpellFullInfosViewer.spell = new dofus.datacenter["\x1e\x0e\x1c"](oEvent.target.selectedItem.id,1);
            }
            else
            {
               this.showDetails(false);
            }
         }
         break;
      case "_lstDrops":
         if(this._nItem == oEvent.target.selectedItem.id)
         {
            this._nItem = 0;
            this.infoDrop(false);
         }
         else
         {
            this.showDetails(false);
            this._nItem = oEvent.target.selectedItem.id;
            this.infoDrop(true);
            this._itvItemViewer.itemData = new dofus.datacenter["\f\f"](0,oEvent.target.selectedItem.id,1,-1,"");
            var _loc3_ = oEvent.target.selectedItem.drop.split("#");
            this._lblPP.text = _loc3_[0];
            this._lblPorcentaje.text = Number(_loc3_[1]) / 1000;
            this._lblMax.text = _loc3_[2];
         }
   }
};
_loc1.infoDrop = function(bVisible)
{
   this._itvItemViewer._visible = bVisible;
   this._winItemViewer._visible = bVisible;
   this._infoPP._visible = bVisible;
   this._lblPP._visible = bVisible;
   this._lblPorcentaje._visible = bVisible;
   this._lblMax._visible = bVisible;
};
_loc1._nItem = Number(0);
_loc1._oStats = new Object();
_loc1._nPage = Number(1);
_loc1._nMaxPages = Number(1);
_loc1._aMobs = new Array();
_loc1._realMobs = new Array();
_loc1.addProperty("mobs",function()
{
}
,_loc1.__set__Mobs);
