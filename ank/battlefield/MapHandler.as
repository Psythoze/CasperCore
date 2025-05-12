var _loc1 = _global.ank.battlefield["\x0b\x06"].prototype;
_loc1.build = function(var2, var3, var4)
{
   this._oDatacenter.Map = var2;
   var _loc26_ = ank.battlefield.Constants.CELL_WIDTH;
   var _loc35_ = ank.battlefield.Constants.CELL_HALF_WIDTH;
   var _loc25_ = ank.battlefield.Constants.CELL_HALF_HEIGHT;
   var _loc34_ = ank.battlefield.Constants.LEVEL_HEIGHT;
   var _loc13_ = -1;
   var _loc19_ = 0;
   var _loc17_ = 0;
   var _loc32_ = var2.data;
   var _loc31_ = _loc32_.length;
   var _loc16_ = var2.width - 1;
   var _loc6_ = this._mcContainer.ExternalContainer;
   var _loc18_ = var3 != undefined;
   var _loc15_ = false;
   var _loc33_ = this._nLastCellCount == _loc31_;
   this._nLoadRequest = 0;
   if(!_loc18_ && (ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod"))
   {
      this._mcContainer.applyMask(false);
   }
   if(var2.backgroundNum != 0)
   {
      if(ank.battlefield.Constants.USE_STREAMING_FILES && (ank.battlefield.Constants.STREAMING_METHOD == "explod" && !_loc18_))
      {
         var _loc37_ = _loc6_.Ground.createEmptyMovieClip("background",-1);
         _loc37_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
         this._mclLoader.loadClip(ank.battlefield.Constants.STREAMING_GROUNDS_DIR + var2.backgroundNum + ".swf",_loc37_);
         this._nLoadRequest = this._nLoadRequest + 1;
      }
      else if(ank.battlefield.Constants.STREAMING_METHOD != "")
      {
         _loc6_.Ground.attachMovie(var2.backgroundNum,"background",-1).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
      }
      else
      {
         _loc6_.Ground.attach(var2.backgroundNum,"background",-1).cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/BACKGROUND"];
      }
   }
   var _loc4_ = -1;
   while(true)
   {
      _loc4_ += 1;
      if(_loc4_ >= _loc31_)
      {
         break;
      }
      if(_loc13_ == _loc16_)
      {
         _loc13_ = 0;
         _loc19_ += 1;
         if(_loc17_ == 0)
         {
            _loc17_ = _loc35_;
            _loc16_ -= 1;
         }
         else
         {
            _loc17_ = 0;
            _loc16_ += 1;
         }
      }
      else
      {
         _loc13_ += 1;
      }
      if(_loc18_)
      {
         if(_loc4_ < var3)
         {
            continue;
         }
         if(_loc4_ > var3)
         {
            return undefined;
         }
      }
      var _loc3_ = _loc32_[_loc4_];
      if(_loc3_.active)
      {
         var _loc9_ = _loc13_ * _loc26_ + _loc17_;
         var _loc10_ = _loc19_ * _loc25_ - _loc34_ * (_loc3_.groundLevel - 7);
         _loc3_.x = _loc9_;
         _loc3_.y = _loc10_;
         if(_loc3_.movement || var4)
         {
            if(!_loc33_ && !_loc6_.InteractionCell["cell" + _loc4_])
            {
               if(!_loc15_)
               {
                  if(ank.battlefield.Constants.STREAMING_METHOD != "")
                  {
                     var _loc11_ = _loc6_.InteractionCell.attachMovie("i" + _loc3_.groundSlope,"cell" + _loc4_,_loc4_,{_x:_loc9_,_y:_loc10_});
                  }
                  else
                  {
                     _loc11_ = _loc6_.InteractionCell.attachMovie("i" + _loc3_.groundSlope,"cell" + _loc4_,_loc4_,{_x:_loc9_,_y:_loc10_});
                  }
               }
               else
               {
                  _loc11_ = _loc6_.InteractionCell.createEmptyMovieClip("cell" + _loc4_,_loc4_,{_x:_loc9_,_y:_loc10_});
               }
               _loc11_.__proto__ = ank.battlefield.mc["\x13\n"].prototype;
               _loc11_.initialize(this._mcBattlefield);
            }
            else
            {
               _loc11_ = _loc6_.InteractionCell["cell" + _loc4_];
            }
            _loc3_.mc = _loc11_;
            _loc11_.data = _loc3_;
         }
         else
         {
            _loc6_.InteractionCell["cell" + _loc4_].removeMovieClip();
         }
         if(_loc3_.layerGroundNum != 0)
         {
            if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
            {
               var _loc21_ = true;
               if(_loc18_)
               {
                  var _loc5_ = _loc6_.Ground["cell" + _loc4_];
                  if(_loc5_ != undefined && _loc5_.lastGroundID == _loc3_.layerGroundNum)
                  {
                     _loc21_ = false;
                     _loc5_.fullLoaded = false;
                     this._oLoadingCells[_loc5_] = _loc3_;
                     this.onLoadInit(_loc5_);
                  }
               }
               if(_loc21_)
               {
                  _loc5_ = _loc6_.Ground.createEmptyMovieClip("cell" + _loc4_,_loc4_);
                  _loc5_.fullLoaded = false;
                  this._oLoadingCells[_loc5_] = _loc3_;
                  this._mclLoader.loadClip(ank.battlefield.Constants.STREAMING_GROUNDS_DIR + _loc3_.layerGroundNum + ".swf",_loc5_);
                  this._nLoadRequest = this._nLoadRequest + 1;
               }
            }
            else
            {
               if(!_loc15_)
               {
                  if(ank.battlefield.Constants.STREAMING_METHOD != "")
                  {
                     _loc5_ = _loc6_.Ground.attachMovie(_loc3_.layerGroundNum,"cell" + _loc4_,_loc4_);
                  }
                  else
                  {
                     _loc5_ = _loc6_.Ground.attach(_loc3_.layerGroundNum,"cell" + _loc4_,_loc4_);
                  }
               }
               else
               {
                  _loc5_ = new MovieClip();
               }
               _loc5_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Ground"];
               _loc5_._x = _loc9_;
               _loc5_._y = _loc10_;
               if(_loc3_.groundSlope != 1)
               {
                  _loc5_.gotoAndStop(_loc3_.groundSlope);
               }
               else if(_loc3_.layerGroundRot != 0)
               {
                  _loc5_._rotation = _loc3_.layerGroundRot * 90;
                  if(_loc5_._rotation % 180)
                  {
                     _loc5_._yscale = 192.86;
                     _loc5_._xscale = 51.85;
                  }
               }
               if(_loc3_.layerGroundFlip)
               {
                  _loc5_._xscale *= -1;
               }
            }
         }
         else
         {
            _loc6_.Ground["cell" + _loc4_].removeMovieClip();
         }
         if(_loc3_.layerObject1Num != 0)
         {
            if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
            {
               var _loc20_ = true;
               if(_loc18_)
               {
                  var _loc7_ = _loc6_.Object1["cell" + _loc4_];
                  if(_loc7_ != undefined && _loc7_.lastObject1ID == _loc3_.layerObject1Num)
                  {
                     _loc20_ = false;
                     _loc7_.fullLoaded = false;
                     this._oLoadingCells[_loc7_] = _loc3_;
                     this.onLoadInit(_loc7_);
                  }
               }
               if(_loc20_)
               {
                  _loc7_ = _loc6_.Object1.createEmptyMovieClip("cell" + _loc4_,_loc4_);
                  _loc7_.fullLoaded = false;
                  this._oLoadingCells[_loc7_] = _loc3_;
                  this._mclLoader.loadClip(ank.battlefield.Constants.STREAMING_OBJECTS_DIR + _loc3_.layerObject1Num + ".swf",_loc7_);
                  this._nLoadRequest = this._nLoadRequest + 1;
               }
            }
            else
            {
               if(!_loc15_)
               {
                  _loc7_ = _loc6_.Object1.attachMovie(_loc3_.layerObject1Num,"cell" + _loc4_,_loc4_);
               }
               else
               {
                  _loc7_ = new MovieClip();
               }
               _loc7_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Object1"];
               _loc7_._x = _loc9_;
               _loc7_._y = _loc10_;
               if(_loc3_.groundSlope == 1 && _loc3_.layerObject1Rot != 0)
               {
                  _loc7_._rotation = _loc3_.layerObject1Rot * 90;
                  if(_loc7_._rotation % 180)
                  {
                     _loc7_._yscale = 192.86;
                     _loc7_._xscale = 51.85;
                  }
               }
               if(_loc3_.layerObject1Flip)
               {
                  _loc7_._xscale *= -1;
               }
            }
            _loc3_.mcObject1 = _loc7_;
         }
         else
         {
            _loc6_.Object1["cell" + _loc4_].removeMovieClip();
         }
         if(_loc3_.layerObjectExternal != "")
         {
            if(!_loc15_)
            {
               var _loc12_ = _loc6_.Object2.attachClassMovie(ank.battlefield.mc["\f\x11"],"cellExt" + _loc4_,_loc4_ * 100 + 1);
            }
            _loc12_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/ObjectExternal"];
            _loc12_.initialize(this._mcBattlefield,_loc3_,_loc3_.layerObjectExternalInteractive);
            _loc12_.loadExternalClip(_loc3_.layerObjectExternal,_loc3_.layerObjectExternalAutoSize);
            _loc12_._x = _loc9_;
            _loc12_._y = _loc10_;
            _loc3_.mcObjectExternal = _loc12_;
         }
         else
         {
            _loc6_.Object2["cellExt" + _loc4_].removeMovieClip();
            delete register21.mcObjectExternal;
         }
         if(_loc3_.layerObject2Num != 0)
         {
            if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
            {
               var _loc24_ = true;
               if(_loc18_)
               {
                  var _loc8_ = _loc6_.Object2["cell" + _loc4_];
                  if(_loc8_ != undefined && _loc8_.lastObject2ID == _loc3_.layerObject2Num)
                  {
                     _loc24_ = false;
                     _loc8_.fullLoaded = false;
                     this._oLoadingCells[_loc8_] = _loc3_;
                     this.onLoadInit(_loc8_);
                  }
               }
               if(_loc24_)
               {
                  _loc8_ = _loc6_.Object2.createEmptyMovieClip("cell" + _loc4_,_loc4_ * 100);
                  _loc8_.fullLoaded = false;
                  this._oLoadingCells[_loc8_] = _loc3_;
                  this._mclLoader.loadClip(ank.battlefield.Constants.STREAMING_OBJECTS_DIR + _loc3_.layerObject2Num + ".swf",_loc8_);
                  this._nLoadRequest = this._nLoadRequest + 1;
               }
            }
            else
            {
               if(!_loc15_)
               {
                  _loc8_ = _loc6_.Object2.attachMovie(_loc3_.layerObject2Num,"cell" + _loc4_,_loc4_ * 100);
               }
               else
               {
                  _loc8_ = new MovieClip();
               }
               if(_loc8_)
               {
                  _loc8_.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["mapHandler/Cell/Object2"];
                  if(_loc3_.layerObject2Interactive)
                  {
                     _loc8_.__proto__ = ank.battlefield.mc["\f\x11"].prototype;
                     _loc8_.initialize(this._mcBattlefield,_loc3_,true);
                  }
                  _loc8_._x = _loc9_;
                  _loc8_._y = _loc10_;
                  if(_loc3_.layerObject2Flip)
                  {
                     _loc8_._xscale = -100;
                  }
               }
            }
            if(_loc8_)
            {
               _loc3_.mcObject2 = _loc8_;
            }
            else
            {
               _loc3_.layerObject2Num = 0;
               _loc6_.Object2["cell" + _loc4_].removeMovieClip();
               delete register21.mcObject2;
            }
         }
         else
         {
            _loc6_.Object2["cell" + _loc4_].removeMovieClip();
            delete register21.mcObject2;
         }
      }
      else if(var4)
      {
         var _loc23_ = _loc13_ * _loc26_ + _loc17_;
         var _loc22_ = _loc19_ * _loc25_;
         _loc3_.x = _loc23_;
         _loc3_.y = _loc22_;
         var _loc14_ = _loc6_.InteractionCell.attachMovie("i1","cell" + _loc4_,_loc4_,{_x:_loc23_,_y:_loc22_});
         _loc14_.__proto__ = ank.battlefield.mc["\x13\n"].prototype;
         _loc14_.initialize(this._mcBattlefield);
         _loc3_.mc = _loc14_;
         _loc14_.data = _loc3_;
      }
   }
   if(!_loc18_)
   {
      if(ank.battlefield.Constants.USE_STREAMING_FILES && ank.battlefield.Constants.STREAMING_METHOD == "explod")
      {
         if(this._nAdjustTimer != undefined)
         {
            return undefined;
         }
         this._nAdjustTimer = _global.setInterval(this,"adjustAndMaskMap",ank.battlefield.MapHandler.TIME_BEFORE_AJUSTING_MAP);
      }
      else
      {
         this.adjustAndMaskMap();
      }
   }
};
_loc1.showFightCells = function(_loc2_, _loc3_)
{
   if(!this.api.datacenter.Game.isFight)
   {
      this._bShowingFightCells = true;
      if(this.api.kernel.OptionsManager.getOption("CellFightPos") == true)
      {
         this.api.kernel.OptionsManager.setOption("CellFightPos",false);
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.gfx.unSelect(true);
         return undefined;
      }
      this.api.kernel.OptionsManager.setOption("CellFightPos",true);
      this.api.sounds.events.onBannerChatButtonClick();
      this.api.network.Game.sendPacketCFP();
   }
   else
   {
      if(_loc2_ == undefined || _loc3_ == undefined)
      {
         var _loc8_ = this.api.lang.getMapText(this._oDatacenter.Map.id);
         if(_loc8_.p1 == undefined || _loc8_.p2 == undefined)
         {
            return undefined;
         }
         _loc2_ = _loc8_.p1;
         _loc3_ = _loc8_.p2;
      }
      this._bShowingFightCells = true;
      var _loc2_ = 0;
      while(_loc2_ < _loc2_.length)
      {
         var _loc5_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc2_.charAt(_loc2_)) << 6;
         _loc5_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc2_.charAt(_loc2_ + 1));
         this.api.gfx.select(_loc5_,dofus.Constants.TEAMS_COLOR[0],"startPosition");
         _loc2_ += 2;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc3_.length)
      {
         var _loc4_ = ank["\x1e\n\x07"]["\x12\r"].decode64(_loc3_.charAt(_loc3_)) << 6;
         _loc4_ += ank["\x1e\n\x07"]["\x12\r"].decode64(_loc3_.charAt(_loc3_ + 1));
         this.api.gfx.select(_loc4_,dofus.Constants.TEAMS_COLOR[1],"startPosition");
         _loc3_ += 2;
      }
   }
};
_loc1.setObject2Interactive = function(nCellNum, bInteractive, nPermanentLevel, nEstrellas)
{
   if(nCellNum > this.getCellCount())
   {
      return undefined;
   }
   var _loc4_ = this._oDatacenter.Map.data[nCellNum];
   _loc4_.mcObject2.select(false);
   var _loc2_ = new ank.battlefield.datacenter["\x13\n"]();
   _loc2_.layerObject2Interactive = bInteractive;
   _loc2_.estrellas = nEstrellas;
   this.updateCell(nCellNum,_loc2_,"1",nPermanentLevel);
};
_loc1.adjustAndMaskMap = function()
{
   if(this._nAdjustTimer != undefined)
   {
      _global.clearInterval(this._nAdjustTimer);
      this._nAdjustTimer = undefined;
   }
   this._mcContainer.adjusteMap();
   if(_global.API.kernel.OptionsManager.getOption("tactico"))
   {
      this.api.datacenter.Game.isTacticMode = true;
   }
};
_loc1.initializeCell = function(var2, var3, var4)
{
   if(var3 == undefined)
   {
      var3 = Infinity;
   }
   else
   {
      var3 = Number(var3);
   }
   var _loc4_ = this._oDatacenter.Map;
   var _loc7_ = _loc4_.data;
   var _loc2_ = _loc4_.originalsCellsBackup.getItemAt(String(var2));
   if(_loc2_ == undefined)
   {
      ank.utils.Logger.err("La case est déjà dans son état init");
      return undefined;
   }
   if(_loc7_[var2].nPermanentLevel <= var3)
   {
      if(var4 == true)
      {
         var _loc9_ = _loc7_[var2].isTactic(_loc4_);
         var _loc3_ = new ank.battlefield.datacenter["\x13\n"]();
         for(var _loc6_ in _loc2_)
         {
            _loc3_[_loc6_] = _loc2_[_loc6_];
         }
         if(_loc9_)
         {
            _loc3_.turnTactic(this,_loc4_);
         }
         _loc7_[var2] = _loc3_;
         this.build(_loc4_,var2);
         if(!_loc9_)
         {
            _loc4_.originalsCellsBackup.removeItemAt(String(var2));
         }
      }
      else
      {
         _loc7_[var2] = _loc2_;
         this.build(_loc4_,var2);
         _loc4_.originalsCellsBackup.removeItemAt(String(var2));
      }
   }
};
_loc1.tacticModeRefreshCell = function(var2, var3)
{
   if(var2 > this.getCellCount())
   {
      ank.utils.Logger.err("[updateCell] Cellule " + var2 + " inexistante");
      return undefined;
   }
   var _loc5_ = this._oDatacenter.Map;
   var _loc2_ = _loc5_.data[var2];
   if(!_loc2_.active)
   {
      return undefined;
   }
   if(!var3)
   {
      var _loc4_ = _loc5_.originalsCellsBackup.getItemAt(String(var2));
      if(_loc4_ == undefined)
      {
         ank.utils.Logger.err("La case est déjà dans son état init");
         return undefined;
      }
      _loc2_.layerGroundNum = _loc4_.layerGroundNum;
      _loc2_.groundSlope = _loc4_.groundSlope;
      _loc2_.layerObject1Rot = _loc4_.layerObject1Rot;
      _loc2_.layerObject1Num = _loc4_.layerObject1Num;
      if(_loc2_.layerObject2Num != 25)
      {
         _loc2_.layerObject2Num = _loc4_.layerObject2Num;
      }
   }
   else
   {
      if(_loc2_.nPermanentLevel == 0)
      {
         var _loc3_ = new ank.battlefield.datacenter["\x13\n"]();
         for(var _loc7_ in _loc2_)
         {
            _loc3_[_loc7_] = _loc2_[_loc7_];
         }
         _loc5_.originalsCellsBackup.addItemAt(String(var2),_loc3_);
      }
      _loc2_.turnTactic(this,_loc5_);
   }
   this.build(_loc5_,var2);
};
_loc1.RecursosOnlye = function(_loc2_)
{
   this.bInteractive = _loc2_;
   var _loc3_ = this._oDatacenter.Map.data;
   for(var _loc5_ in _loc3_)
   {
      var _loc2_ = _loc3_[_loc5_].mcObject2;
      if(_loc3_[_loc5_].layerObject2Interactive)
      {
         if(_loc2_ != undefined)
         {
            if(_loc2_)
            {
               _loc2_._rollOver2();
               continue;
            }
            _loc2_._rollOut();
         }
      }
   }
};
_loc1.updateCell = function(nCellNum, oNewCell, sMaskHex, nPermanentLevel)
{
   if(nCellNum > this.getCellCount())
   {
      ank.utils.Logger.err("[updateCell] Cellule " + nCellNum + " inexistante");
      return undefined;
   }
   if(nPermanentLevel == undefined || _global.isNaN(nPermanentLevel))
   {
      nPermanentLevel = 0;
   }
   else
   {
      nPermanentLevel = Number(nPermanentLevel);
   }
   var _loc5_ = _global.parseInt(sMaskHex,16);
   var _loc10_ = (_loc5_ & 65536) != 0;
   var _loc23_ = (_loc5_ & 32768) != 0;
   var _loc16_ = (_loc5_ & 16384) != 0;
   var _loc19_ = (_loc5_ & 8192) != 0;
   var _loc11_ = (_loc5_ & 4096) != 0;
   var _loc18_ = (_loc5_ & 2048) != 0;
   var _loc25_ = (_loc5_ & 1024) != 0;
   var _loc20_ = (_loc5_ & 512) != 0;
   var _loc14_ = (_loc5_ & 256) != 0;
   var _loc26_ = (_loc5_ & 128) != 0;
   var _loc24_ = (_loc5_ & 64) != 0;
   var _loc17_ = (_loc5_ & 32) != 0;
   var _loc15_ = (_loc5_ & 16) != 0;
   var _loc12_ = (_loc5_ & 8) != 0;
   var _loc21_ = (_loc5_ & 4) != 0;
   var _loc13_ = (_loc5_ & 2) != 0;
   var _loc22_ = (_loc5_ & 1) != 0;
   var _loc3_ = this._oDatacenter.Map.data[nCellNum];
   if(nPermanentLevel > 0)
   {
      if(_loc3_.nPermanentLevel == 0)
      {
         var _loc6_ = new ank.battlefield.datacenter["\x13\n"]();
         for(var _loc8_ in _loc3_)
         {
            _loc6_[_loc8_] = _loc3_[_loc8_];
         }
         this._oDatacenter.Map.originalsCellsBackup.addItemAt(nCellNum,_loc6_);
         _loc3_.nPermanentLevel = nPermanentLevel;
      }
   }
   if(_loc19_)
   {
      _loc3_.active = oNewCell.active;
   }
   if(_loc11_)
   {
      _loc3_.lineOfSight = oNewCell.lineOfSight;
   }
   if(_loc18_)
   {
      _loc3_.movement = oNewCell.movement;
   }
   if(_loc25_)
   {
      _loc3_.groundLevel = oNewCell.groundLevel;
   }
   if(_loc20_)
   {
      _loc3_.groundSlope = oNewCell.groundSlope;
   }
   if(_loc14_)
   {
      _loc3_.layerGroundNum = oNewCell.layerGroundNum;
   }
   if(_loc26_)
   {
      _loc3_.layerGroundFlip = oNewCell.layerGroundFlip;
   }
   if(_loc24_)
   {
      _loc3_.layerGroundRot = oNewCell.layerGroundRot;
   }
   if(_loc17_)
   {
      _loc3_.layerObject1Num = oNewCell.layerObject1Num;
   }
   if(_loc12_)
   {
      _loc3_.layerObject1Rot = oNewCell.layerObject1Rot;
   }
   if(_loc15_)
   {
      _loc3_.layerObject1Flip = oNewCell.layerObject1Flip;
   }
   if(_loc13_)
   {
      _loc3_.layerObject2Flip = oNewCell.layerObject2Flip;
   }
   if(_loc22_)
   {
      _loc3_.layerObject2Interactive = oNewCell.layerObject2Interactive;
   }
   if(_loc21_)
   {
      _loc3_.layerObject2Num = oNewCell.layerObject2Num;
   }
   if(_loc16_)
   {
      _loc3_.layerObjectExternal = oNewCell.layerObjectExternal;
   }
   if(_loc23_)
   {
      _loc3_.layerObjectExternalInteractive = oNewCell.layerObjectExternalInteractive;
   }
   if(_loc10_)
   {
      _loc3_.layerObjectExternalAutoSize = oNewCell.layerObjectExternalAutoSize;
   }
   _loc3_.layerObjectExternalData = oNewCell.layerObjectExternalData;
   _loc3_.estrellas = oNewCell.estrellas;
   this.build(this._oDatacenter.Map,nCellNum);
};
_loc1.bInteractive = false;
