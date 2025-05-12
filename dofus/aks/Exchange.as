var _loc1 = dofus.aks.Exchange.prototype;
_loc1.transfertItems = function(_loc2_, _loc3_)
{
   this.aks.send("EMA" + _loc2_ + _loc3_,true);
};
_loc1.movementOgrine = function(_loc2_)
{
   this.aks.send("EMS" + _loc2_,true);
};
_loc1.getItemActualPriceInBigStore = function(_loc2_)
{
   this.aks.send(_loc2_);
};
_loc1.repeatCraft = function(nHowManyTimes)
{
   if(Number(nHowManyTimes) == 1)
   {
      this.aks.send("EMR1",false);
   }
   else
   {
      this._nItemsToCraft = nHowManyTimes - 1;
      this.aks.send("EMR" + nHowManyTimes,false);
      this.api.datacenter.Basics.isCraftLooping = true;
   }
};
_loc1.onBigStoreItemsList = function(_loc2_)
{
   var _loc10_ = _loc2_.split("|");
   var _loc17_ = Number(_loc10_[0]);
   _loc10_.shift();
   var _loc16_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   for(var _loc18_ in _loc10_)
   {
      var _loc2_ = _loc10_[_loc18_].split(";");
      var _loc4_ = Number(_loc2_[0]);
      var _loc5_ = _loc2_[1];
      var _loc9_ = Number(_loc2_[2]);
      var _loc7_ = Number(_loc2_[3]);
      var _loc6_ = Number(_loc2_[4]);
      var _loc8_ = new dofus.datacenter["\f\f"](_loc4_,_loc17_,0,-1,_loc5_,0);
      var _loc3_ = {id:_loc4_,item:_loc8_,priceSet1:_loc9_,priceSet2:_loc7_,priceSet3:_loc6_};
      if(this.api.ui.getUIComponent("BigStoreSell") != null)
      {
         this.api.ui.getUIComponent("BigStoreSell").setItemStats(_loc3_);
         return undefined;
      }
      _loc16_.push(_loc3_);
   }
   this.api.datacenter.Temporary.Shop.inventory2 = _loc16_;
   this.api.ui.getUIComponent("BigStoreBuy").setItem(_loc17_);
};
_loc1.onList = function(sExtraData)
{
   switch(this.api.datacenter.Basics.aks_exchange_echangeType)
   {
      case 0:
      case 20:
         var _loc29_ = sExtraData.split("|");
         var _loc32_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(var _loc34_ in _loc29_)
         {
            var _loc2_ = _loc29_[_loc34_].split(";");
            var _loc21_ = Number(_loc2_[0]);
            var _loc25_ = _loc2_[1];
            var _loc8_ = _loc2_[2];
            var _loc4_ = new dofus.datacenter["\f\f"](0,_loc21_,undefined,undefined,_loc25_,_loc8_);
            _loc4_.priceMultiplicator = this.api.lang.getConfigText("BUY_PRICE_MULTIPLICATOR");
            _loc4_.itemPago = _loc2_[3] != undefined ? Number(_loc2_[3]) : 0;
            _loc4_.chapa = _loc2_[4] != undefined ? Number(_loc2_[4]) : 0;
            _loc32_.push(_loc4_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc32_;
         break;
      case 5:
      case 15:
      case 8:
         var _loc11_ = sExtraData.split(";");
         _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc11_)
         {
            var _loc5_ = _loc11_[_loc34_];
            var _loc9_ = _loc5_.charAt(0);
            var _loc7_ = _loc5_.substr(1);
            switch(_loc9_)
            {
               case "O":
                  var _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc7_);
                  _loc8_.push(_loc10_);
                  break;
               case "G":
                  this.onStorageKama(_loc7_);
            }
         }
         this.api.datacenter.Temporary.Storage.inventory = _loc8_;
         if(dofus["\x12\x03"].SAVING_THE_WORLD)
         {
            dofus["\x1e\x14\x10"].getInstance().newItems(sExtraData);
            dofus["\x1e\x14\x10"].getInstance().nextAction();
         }
         break;
      case 4:
      case 6:
         var _loc28_ = sExtraData.split("|");
         var _loc31_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc28_)
         {
            var _loc6_ = _loc28_[_loc34_].split(";");
            var _loc23_ = Number(_loc6_[0]);
            var _loc13_ = Number(_loc6_[1]);
            var _loc15_ = Number(_loc6_[2]);
            var _loc26_ = _loc6_[3];
            var _loc17_ = Number(_loc6_[4]);
            var _loc19_ = new dofus.datacenter["\f\f"](_loc23_,_loc15_,_loc13_,-1,_loc26_,_loc17_);
            _loc4_.itemPago = _loc2_[5] != undefined ? Number(_loc2_[5]) : 0;
            _loc31_.push(_loc19_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc31_;
         break;
      case 10:
         var _loc27_ = sExtraData.split("|");
         var _loc30_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         if(sExtraData.length != 0)
         {
            for(_loc34_ in _loc27_)
            {
               var _loc3_ = _loc27_[_loc34_].split(";");
               var _loc16_ = Number(_loc3_[0]);
               var _loc14_ = Number(_loc3_[1]);
               var _loc18_ = Number(_loc3_[2]);
               var _loc24_ = _loc3_[3];
               var _loc22_ = Number(_loc3_[4]);
               var _loc20_ = Number(_loc3_[5]);
               var _loc12_ = new dofus.datacenter["\f\f"](_loc16_,_loc18_,_loc14_,-1,_loc24_,_loc22_);
               _loc4_.itemPago = _loc2_[6] != undefined ? Number(_loc2_[6]) : 0;
               _loc12_.remainingHours = _loc20_;
               _loc30_.push(_loc12_);
            }
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc30_;
         break;
      case 30:
         _loc11_ = sExtraData.split(";");
         _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc11_)
         {
            _loc5_ = _loc11_[_loc34_];
            _loc9_ = _loc5_.charAt(0);
            _loc7_ = _loc5_.substr(1);
            var _loc0_ = null;
            if((_loc0_ = _loc9_) === "O")
            {
               _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc7_);
               _loc8_.push(_loc10_);
            }
         }
         this.api.datacenter.Player.Bank = _loc8_;
   }
};
_loc1.transfertToExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO+" + _loc2_);
   a += 1;
};
_loc1.transfertToNoExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO-" + _loc2_);
   a += 1;
};
