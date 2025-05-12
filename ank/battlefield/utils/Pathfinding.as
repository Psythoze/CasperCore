_global.ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkView = function(mapHandler, cell1, cell2)
{
   var _loc7_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(mapHandler,cell1);
   var _loc6_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(mapHandler,cell2);
   var _loc22_ = mapHandler.getCellData(cell1);
   var _loc21_ = mapHandler.getCellData(cell2);
   var _loc19_ = !_loc22_.spriteOnID ? 0 : 1.5;
   var _loc20_ = !_loc21_.spriteOnID ? 0 : 1.5;
   _loc19_ += !_loc22_.carriedSpriteOnId ? 0 : 1.5;
   _loc20_ += !_loc21_.carriedSpriteOnId ? 0 : 1.5;
   _loc7_.z = mapHandler.getCellHeight(cell1) + _loc19_;
   _loc6_.z = mapHandler.getCellHeight(cell2) + _loc20_;
   var _loc14_ = _loc6_.z - _loc7_.z;
   var _loc15_ = Math.max(Math.abs(_loc7_.y - _loc6_.y),Math.abs(_loc7_.x - _loc6_.x));
   var _loc16_ = (_loc7_.y - _loc6_.y) / (_loc7_.x - _loc6_.x);
   var _loc17_ = _loc7_.y - _loc16_ * _loc7_.x;
   var _loc9_ = _loc6_.x - _loc7_.x >= 0 ? 1 : -1;
   var _loc3_ = _loc6_.y - _loc7_.y >= 0 ? 1 : -1;
   var _loc12_ = _loc7_.y;
   var _loc25_ = _loc7_.x;
   var _loc18_ = _loc6_.x * _loc9_;
   var _loc24_ = _loc6_.y * _loc3_;
   var _loc4_ = _loc7_.x + 0.5 * _loc9_;
   if(cell2 == _global.NUMERO_CELDA)
   {
      _global.STR_PATH = "_loc5.x " + _loc7_.x + " _loc5.y " + _loc7_.y + " alto5 " + mapHandler.getCellHeight(cell1) + " _loc7.spriteOnID " + _loc22_.spriteOnID + " _loc7.carriedSpriteOnId " + _loc22_.carriedSpriteOnId + " _loc5.z " + _loc7_.z + " _loc6.x " + _loc6_.x + " _loc6.y " + _loc6_.y + " alto6 " + mapHandler.getCellHeight(cell2) + " _loc8.spriteOnID " + _loc21_.spriteOnID + " _loc8.carriedSpriteOnId " + _loc21_.carriedSpriteOnId + " _loc6.z " + _loc6_.z + " _loc9 " + _loc19_ + " _loc10 " + _loc20_ + " _loc11 " + _loc14_ + " _loc12 " + _loc15_ + " _loc13 " + _loc16_ + " _loc14 " + _loc17_ + " _loc15 " + _loc9_ + " _loc16 " + _loc3_ + " _loc17 " + _loc12_ + " _loc19 " + _loc18_ + " _loc27 " + _loc4_;
   }
   while(_loc4_ * _loc9_ <= _loc18_)
   {
      var _loc5_ = _loc16_ * _loc4_ + _loc17_;
      if(cell2 == _global.NUMERO_CELDA)
      {
         _global.STR_PATH = _global.STR_PATH + " ENTRA_loc25 " + _loc5_;
      }
      if(_loc3_ > 0)
      {
         var _loc10_ = Math.round(_loc5_);
         var _loc8_ = Math.ceil(_loc5_ - 0.5);
      }
      else
      {
         _loc10_ = Math.ceil(_loc5_ - 0.5);
         _loc8_ = Math.round(_loc5_);
      }
      if(cell2 == _global.NUMERO_CELDA)
      {
         _global.STR_PATH = _global.STR_PATH + " ENTRA_loc21 " + _loc10_ + " ENTRA_loc22 " + _loc8_;
      }
      var _loc2_ = _loc12_;
      while(_loc2_ * _loc3_ <= _loc8_ * _loc3_)
      {
         if(!ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkCellView(mapHandler,_loc4_ - _loc9_ / 2,_loc2_,false,_loc7_,_loc6_,_loc14_,_loc15_))
         {
            return false;
         }
         _loc2_ += _loc3_;
      }
      _loc12_ = _loc10_;
      if(cell2 == _global.NUMERO_CELDA)
      {
         _global.STR_PATH = _global.STR_PATH + " ENTRA_loc17 " + _loc12_;
      }
      _loc4_ += _loc9_;
   }
   _loc2_ = _loc12_;
   if(cell2 == _global.NUMERO_CELDA)
   {
      _global.STR_PATH = _global.STR_PATH + " _loc26 " + _loc2_;
   }
   while(_loc2_ * _loc3_ <= _loc6_.y * _loc3_)
   {
      if(cell2 == _global.NUMERO_CELDA)
      {
         _global.STR_PATH = _global.STR_PATH + " entro " + _loc2_;
      }
      if(!ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkCellView(mapHandler,_loc4_ - 0.5 * _loc9_,_loc2_,false,_loc7_,_loc6_,_loc14_,_loc15_))
      {
         return false;
      }
      _loc2_ += _loc3_;
   }
   if(!ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkCellView(mapHandler,_loc4_ - 0.5 * _loc9_,_loc2_ - _loc3_,true,_loc7_,_loc6_,_loc14_,_loc15_))
   {
      return false;
   }
   return true;
};
_global.ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].checkCellView = function(mapHandler, x, y, bool, p1, p2, zDiff, d)
{
   var _loc6_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseNum(mapHandler,x,y);
   var _loc5_ = mapHandler.getCellData(_loc6_);
   var _loc4_ = Math.max(Math.abs(p1.y - y),Math.abs(p1.x - x));
   var _loc3_ = _loc4_ / d * zDiff + p1.z;
   var _loc2_ = mapHandler.getCellHeight(_loc6_);
   var _loc7_ = !(_loc5_.spriteOnID == undefined || (_loc4_ == 0 || (bool || p2.x == x && p2.y == y))) ? true : false;
   if(_loc6_ == _global.NUMERO_CELDA)
   {
      _global.STR_PATH = _global.STR_PATH + " _loc11.lineOfSight " + _loc5_.lineOfSight + " _loc12 " + _loc4_ + " _loc13 " + _loc3_ + " _loc14 " + _loc2_ + " _loc15 " + _loc7_ + " _loc14 = _loc13 " + (_loc2_ <= _loc3_) + " (_loc14 = _loc13 && !_loc15) " + (_loc2_ <= _loc3_ && !_loc7_);
   }
   if(_loc5_.lineOfSight && (_loc2_ <= _loc3_ && !_loc7_))
   {
      return true;
   }
   if(bool)
   {
      return true;
   }
   return false;
};
_global.ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCeldasPorDistanciaAnillo = function(maphandler, celda, distancia, par, celdas)
{
   if(celdas == undefined)
   {
      celdas = new Object();
   }
   var _loc15_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(maphandler,celda);
   var _loc12_ = _loc15_.x;
   var _loc11_ = _loc15_.y;
   var _loc7_ = [[1,1],[1,-1],[-1,1],[-1,-1]];
   var _loc6_ = [[-1,0],[1,0],[-1,0],[1,0]];
   var _loc5_ = 0;
   while(_loc5_ <= distancia)
   {
      var _loc9_ = distancia - _loc5_;
      for(var _loc13_ in _loc7_)
      {
         var _loc4_ = _loc7_[_loc13_];
         var _loc3_ = _loc12_ + _loc4_[0] * _loc5_;
         var _loc2_ = _loc11_ + _loc4_[1] * _loc9_;
         if(p == 0)
         {
            _loc3_ += _loc6_[_loc13_][0];
            _loc2_ += _loc6_[_loc13_][1];
         }
         var _loc1_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseNum(maphandler,_loc3_,_loc2_);
         if(!(_loc1_ == undefined || _loc1_ < 0 || _loc1_ >= maphandler.getCellCount()))
         {
            celdas[_loc1_] = true;
         }
      }
      _loc5_ = _loc5_ + 1;
   }
   return celdas;
};
_global.ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCeldasPorDistancia = function(maphandler, celda, distancia, celdas)
{
   if(celdas == undefined)
   {
      celdas = new Object();
   }
   var _loc14_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(maphandler,celda);
   var _loc11_ = _loc14_.x;
   var _loc10_ = _loc14_.y;
   var _loc6_ = [[1,1],[1,-1],[-1,1],[-1,-1]];
   var _loc3_ = 0;
   while(_loc3_ <= distancia)
   {
      var _loc8_ = distancia - _loc3_;
      for(var _loc12_ in _loc6_)
      {
         var _loc2_ = _loc6_[_loc12_];
         var _loc5_ = _loc11_ + _loc2_[0] * _loc3_;
         var _loc4_ = _loc10_ + _loc2_[1] * _loc8_;
         var _loc1_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseNum(maphandler,_loc5_,_loc4_);
         if(!(_loc1_ == undefined || _loc1_ < 0 || _loc1_ >= maphandler.getCellCount()))
         {
            celdas[_loc1_] = true;
         }
      }
      _loc3_ = _loc3_ + 1;
   }
   return celdas;
};
_global.ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCeldasPorCruz = function(maphandler, celda, distancia, celdas)
{
   if(celdas == undefined)
   {
      celdas = new Object();
   }
   var _loc12_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(maphandler,celda);
   var _loc9_ = _loc12_.x;
   var _loc10_ = _loc12_.y;
   var _loc5_ = [[1,0],[0,1],[-1,0],[0,-1]];
   for(var _loc11_ in _loc5_)
   {
      var _loc2_ = _loc5_[_loc11_];
      var _loc4_ = _loc9_ + _loc2_[0] * distancia;
      var _loc3_ = _loc10_ + _loc2_[1] * distancia;
      var _loc1_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseNum(maphandler,_loc4_,_loc3_);
      if(!(_loc1_ == undefined || _loc1_ < 0 || _loc1_ >= maphandler.getCellCount()))
      {
         celdas[_loc1_] = true;
      }
   }
   return celdas;
};
_global.ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCeldasPorDireccion = function(maphandler, celda, distancia, celdas, direccion)
{
   if(celdas == undefined)
   {
      celdas = new Object();
   }
   while(direccion < 0)
   {
      direccion += 8;
   }
   while(direccion >= 8)
   {
      direccion -= 8;
   }
   var _loc4_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(maphandler,celda);
   var _loc9_ = _loc4_.x;
   var _loc8_ = _loc4_.y;
   var _loc5_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCoordPorDireccion(direccion);
   var _loc7_ = _loc9_ + _loc5_[0] * distancia;
   var _loc6_ = _loc8_ + _loc5_[1] * distancia;
   var _loc2_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseNum(maphandler,_loc7_,_loc6_);
   if(_loc2_ == undefined || _loc2_ < 0 || _loc2_ >= maphandler.getCellCount())
   {
   }
   celdas[_loc2_] = true;
   return celdas;
};
_global.ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseNum = function(mapHandler, x, y)
{
   var _loc1_ = mapHandler.getWidth();
   var _loc6_ = mapHandler.getHeight();
   var _loc5_ = x + y;
   if(x - Math.abs(y) < 0 || x - y > _loc1_ * 2 - 2)
   {
      return -1;
   }
   return x * _loc1_ + y * (_loc1_ - 1);
};
_global.ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCoordPorDireccion = function(dir)
{
   var _loc1_ = [[1,-1],[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1]];
   return _loc1_[dir];
};
