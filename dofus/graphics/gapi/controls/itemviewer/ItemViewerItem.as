var _loc1 = _global.dofus["\r\x14"].gapi.controls["\f\b"].ItemViewerItem.prototype;
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   this._oItem = oItem;
   this._cbStat._visible = false;
   this._cParam1._visible = false;
   this._cParam2._visible = false;
   this._cParam3._visible = false;
   this._itParam1._visible = false;
   this._itParam2._visible = false;
   this._itParam3._visible = false;
   this._btnC._visible = false;
   this._btnX._visible = false;
   this._btnM._visible = false;
   this._itParam1.removeEventListener("teclaEnter",this);
   this._itParam2.removeEventListener("teclaEnter",this);
   if(bUsed)
   {
      this.showButton(false);
      this.showLoader(false);
      if(oItem instanceof dofus.datacenter["\x0f\r"])
      {
         if(dofus.Constants.DEBUG || _global.CONFIG.skipLanguageVerification)
         {
            this._btnX._visible = true;
            this._btnM._visible = true;
            this._btnM.addEventListener("click",this);
            this._btnC.addEventListener("click",this);
            this._btnX.addEventListener("click",this);
         }
         this._lbl.text = oItem.description;
         switch(oItem.operator)
         {
            case "+":
               this._lbl.styleName = "GreenLeftSmallLabel";
               break;
            case "-":
               this._lbl.styleName = "RedLeftSmallLabel";
               break;
            case "!":
               this._lbl.styleName = "BlueLeftSmallLabel";
               break;
            default:
               this._lbl.styleName = "BrownLeftSmallLabel";
         }
         if((_loc0_ = oItem.type) !== 995)
         {
            this.showButton(false,"");
            this._btn.removeEventListener();
         }
         else
         {
            this.showButton(true,"ItemViewerUseHand");
            this._btn.addEventListener("click",this);
         }
         if(oItem.element != undefined)
         {
            switch(oItem.element)
            {
               case "W":
                  this.showLoader(true,"IconWaterDommage");
                  break;
               case "F":
                  this.showLoader(true,"IconFireDommage");
                  break;
               case "E":
                  this.showLoader(true,"IconEarthDommage");
                  break;
               case "A":
                  this.showLoader(true,"IconAirDommage");
                  break;
               case "N":
                  this.showLoader(true,"IconNeutralDommage");
            }
         }
         else
         {
            switch(Number(oItem.characteristic))
            {
               case 13:
                  this.showLoader(true,"IconWaterBonus");
                  break;
               case 35:
                  this.showLoader(true,"IconWater");
                  break;
               case 15:
                  this.showLoader(true,"IconFireBonus");
                  break;
               case 34:
                  this.showLoader(true,"IconFire");
                  break;
               case 10:
                  this.showLoader(true,"IconEarthBonus");
                  break;
               case 33:
                  this.showLoader(true,"IconEarth");
                  break;
               case 14:
                  this.showLoader(true,"IconAirBonus");
                  break;
               case 36:
                  this.showLoader(true,"IconAir");
                  break;
               case 37:
                  this.showLoader(true,"IconNeutral");
                  break;
               case 1:
                  this.showLoader(true,"Star");
                  break;
               case 11:
                  this.showLoader(true,"IconVita");
                  break;
               case 12:
                  this.showLoader(true,"IconWisdom");
                  break;
               case 44:
                  this.showLoader(true,"IconInit");
                  break;
               case 48:
                  this.showLoader(true,"IconPP");
                  break;
               case 2:
                  this.showLoader(true,"KamaSymbol");
                  break;
               case 23:
                  this.showLoader(true,"IconMP");
                  break;
               case 26:
                  this.showLoader(true,"IconSummons");
                  break;
               case 19:
                  this.showLoader(true,"IconAlcance");
                  break;
               case 100:
                  this.showLoader(true,"IconHuida");
                  break;
               case 101:
                  this.showLoader(true,"IconPlacaje");
            }
         }
      }
      else
      {
         this._lbl.text = sSuggested;
         this._lbl.styleName = "BrownLeftSmallLabel";
      }
   }
   else if(this._lbl.text != undefined)
   {
      this._lbl.text = "";
      this.showLoader(false,"");
   }
};
_loc1.change = function(oEvent)
{
   this._cbStat.mcListParent = this._itText.text;
   var _loc2_ = new ank["\x1e\n\x07"]["\x0e\x1c"](String(this._itText.text));
   var _loc3_ = _loc2_.replace("this",String(this));
};
_loc1.teclaEnter = function(oEvent)
{
   this.actualizar();
};
_loc1.actualizar = function()
{
   var _loc3_ = new dofus.datacenter["\x0f\r"](undefined,this._oItem.type,this._oItem.param1,this._oItem.param2,this._oItem.param3,this._oItem.param4);
   if(!_global.isNaN(Number(this._cbStat.selectedItem.id)))
   {
      this._oItem.type = Number(this._cbStat.selectedItem.id);
   }
   if(!_global.isNaN(Number(this._itParam1.text)))
   {
      this._oItem.param1 = Number(this._itParam1.text);
   }
   else
   {
      this._oItem.param1 = undefined;
   }
   if(!_global.isNaN(Number(this._itParam2.text)))
   {
      this._oItem.param2 = Number(this._itParam2.text);
   }
   else
   {
      this._oItem.param2 = undefined;
   }
   if(!_global.isNaN(Number(this._itParam3.text)))
   {
      this._oItem.param3 = Number(this._itParam3.text);
   }
   else
   {
      this._oItem.param3 = undefined;
   }
   if(this._oItem.compressedEffects.indexOf("3f8") != -1)
   {
      this._lblName.styleName = "LeftMediumBoldLabelLeg";
   }
   if(this._oItem.compressedEffects.indexOf("3f7") != -1)
   {
      this._lblName.styleName = "LeftMediumBoldLabelRare";
   }
   this._cbStat._visible = false;
   this._cParam1._visible = false;
   this._cParam2._visible = false;
   this._cParam3._visible = false;
   this._itParam1._visible = false;
   this._itParam2._visible = false;
   this._itParam3._visible = false;
   this._itParam1.removeEventListener("teclaEnter",this);
   this._itParam2.removeEventListener("teclaEnter",this);
   this._itParam3.removeEventListener("teclaEnter",this);
   this._btnC._visible = false;
   this._btnX._visible = true;
   this._btnM._visible = true;
   this._mcList._parent.modificarStat(_loc3_,this._oItem);
};
_loc1.ventanaModificar = function()
{
   this._cbStat._visible = true;
   this._cParam1._visible = true;
   this._cParam2._visible = true;
   this._cParam3._visible = true;
   this._itParam1._visible = true;
   this._itParam2._visible = true;
   this._itParam3._visible = true;
   this._itParam1.addEventListener("teclaEnter",this);
   this._itParam2.addEventListener("teclaEnter",this);
   this._itParam3.removeEventListener("teclaEnter",this);
   this._btnC._visible = true;
   this._btnX._visible = false;
   this._btnM._visible = false;
   var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   for(var _loc7_ in this.STATS)
   {
      var _loc3_ = new ank["\x1e\n\x07"]["\x0e\x1c"](this._mcList._parent.api.lang.getEffectText(this.STATS[_loc7_]).d).replace(["{~1~2 a }","{~1~2 à }","{~1~2 to }","{~1~2 de }","{~1~2 du }"],[" a "," a "," a "," a "," a "]);
      _loc6_.push({id:this.STATS[_loc7_],label:_loc3_});
   }
   _loc6_.reverse();
   this._cbStat.dataProvider = _loc6_;
   this._cbStat2.dataProvider = _loc6_;
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= this.STATS.length)
      {
         break;
      }
      if(this.STATS[_loc2_] == this._oItem.type)
      {
         this._cbStat.selectedIndex = _loc2_;
         break;
      }
   }
   this._itParam1.text = this._oItem.param1 != undefined ? this._oItem.param1 : "";
   this._itParam2.text = this._oItem.param2 != undefined ? this._oItem.param2 : "";
   this._itParam3.text = this._oItem.param3 != undefined ? this._oItem.param3 : "";
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btn:
         this._mcList.gapi.api.network.Mount.data(this._oItem.param1,this._oItem.param2);
         break;
      case this._btnX:
         this._mcList._parent.modificarStat(this._oItem);
         break;
      case this._btnM:
         this.ventanaModificar();
         break;
      case this._btnC:
         this.actualizar();
   }
};
_loc1.STATS = [91,92,93,94,95,96,97,98,99,100,101,108,111,112,115,117,118,119,123,124,125,126,128,138,142,158,160,161,174,176,178,182,210,211,212,213,214,220,225,226,240,241,242,243,244,410,413,415,416,417,418,419,7,10,146,148,188,197,201,221,222,229,230,333,335,501,513,600,602,603,604,605,612,613,614,615,616,620,622,624,627,640,641,642,643,645,647,648,649,669,699,700,701,705,710,715,716,717,720,724,725,730,731,751,760,765,791,795,800,805,806,807,808,810,811,813,814,825,900,901,902,905,915,930,931,932,933,934,935,936,937,939,940,946,947,948,949,950,960,961,962,963,964];
