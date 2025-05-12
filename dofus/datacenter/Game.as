var _loc1 = dofus.datacenter.Game.prototype;
_loc1.addSprite = function(nID)
{
   this.arraySprites.push(nID);
};
_loc1.clearSprites = function()
{
   this.arraySprites = new Array();
};
_loc1.getSprites = function()
{
   return this.arraySprites;
};
_loc1.setInteractionType = function(sType)
{
   switch(sType)
   {
      case "move":
         this._nInteractionType = 1;
         break;
      case "spell":
         this._nInteractionType = 2;
         break;
      case "cc":
         this._nInteractionType = 3;
         break;
      case "place":
         this._nInteractionType = 4;
         break;
      case "target":
         this._nInteractionType = 5;
         break;
      case "flag":
         this._nInteractionType = 6;
         break;
      case "fightpos":
         this._nInteractionType = 7;
         break;
      case "trigger":
         this._nInteractionType = 8;
   }
};
_loc1.arraySprites = new Array();
