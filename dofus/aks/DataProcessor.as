var _loc1 = dofus.aks["\x11\f"].prototype;
_loc1.proceso = function(sData)
{
   if(_global.VECES_INTERVALO >= _global.MAX_VECES_INTERVALO)
   {
      _global.clearInterval(this._nIntervalo);
      _global.MAX_VECES_INTERVALO = Number(0);
      _global.VECES_INTERVALO = Number(0);
      return undefined;
   }
   _global.VECES_INTERVALO = _global.VECES_INTERVALO + 1;
   this.process(sData);
};
_loc1.process = function(sData)
{
   var _loc3_ = sData.charAt(0);
   var _loc4_ = sData.charAt(1);
   var _loc5_ = sData.charAt(2) == "E";
   this.postProcess(_loc3_,_loc4_,_loc5_,sData);
};
_loc1.defaultProcessAction = function(sType, sAction, bError, sData)
{
};
_loc1.postProcess = function(sType, sAction, bError, sData)
{
   switch(sType)
   {
      case "H":
         switch(sAction)
         {
            case "C":
               this.aks.onHelloConnectionServer(sData.substr(2));
               break;
            case "F":
               if(this.api.ui.getUIComponent("CambiarPass") != undefined)
               {
                  this.api.ui.getUIComponent("CambiarPass").confirmar(sData.substr(2));
               }
               break;
            case "G":
               this.aks.onHelloGameServer(sData.substr(2));
               break;
            case "R":
               if(sData.substr(2) == undefined || sData.substr(2).length == 0 || sData.substr(2) == "")
               {
                  var _loc23_ = this.api.lang.getText("NOT_PLAYER");
                  this.api.kernel.showMessage(this.api.lang.getText("RECUPERAR_PASS"),_loc23_ == undefined ? "La cuenta no existe" : _loc23_,"ERROR_BOX");
                  this.aks.disconnect(false,false);
               }
               else
               {
                  this.api.ui.loadUIAutoHideComponent("RecuperarPass","RecuperarPass",{pregunta:sData.substr(2)});
               }
               break;
            case "N":
               this.api.ui.loadUIAutoHideComponent("CambiarPass","CambiarPass",{pregunta:sData.substr(2)});
               break;
            case "O":
               _root.getURL(sData.substr(2),"_blank");
               break;
            case "P":
               if(this.api.ui.getUIComponent("RecuperarPass") != undefined)
               {
                  this.api.ui.getUIComponent("RecuperarPass").confirmar(sData.substr(2));
               }
               break;
            case "u":
               this.api.ui.unloadUIComponent("CompletarDatos");
               break;
            case "Y":
               Cerebro.process(sData.substr(2));
               break;
            default:
               this.aks.disconnect(false,true);
         }
         break;
      case "p":
         this.aks.onPong();
         break;
      case "q":
         this.aks.onQuickPong();
         break;
      case "r":
         this.aks.send("rpong" + sData.substr(5),false);
         break;
      case "M":
         this.aks.onServerMessage(sData.substr(1));
         break;
      case "B":
         switch(sAction)
         {
            case "N":
               return undefined;
            case "A":
               switch(sData.charAt(2))
               {
                  case "T":
                     this.aks.Basics.onAuthorizedCommand(true,sData.substr(3));
                     break;
                  case "L":
                     this.aks.Basics.onAuthorizedLine(sData.substr(3));
                     break;
                  case "P":
                     this.aks.Basics.onAuthorizedCommandPrompt(sData.substr(3));
                     break;
                  case "C":
                     this.aks.Basics.onAuthorizedCommandClear();
                     break;
                  case "E":
                     this.aks.Basics.onAuthorizedCommand(false);
                     break;
                  case "I":
                     switch(sData.charAt(3))
                     {
                        case "O":
                           this.aks.Basics.onAuthorizedInterfaceOpen(sData.substr(4));
                           break;
                        case "C":
                           this.aks.Basics.onAuthorizedInterfaceClose(sData.substr(4));
                           break;
                        default:
                           this.aks.defaultProcessAction(sType,sAction,bError,sData);
                     }
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "T":
               this.aks.Basics.onReferenceTime(sData.substr(2));
               break;
            case "D":
               this.aks.Basics.onDate(sData.substr(2));
               break;
            case "W":
               this.aks.Basics.onWhoIs(!bError,sData.substr(3));
               break;
            case "P":
               this.aks.Basics.onSubscriberRestriction(sData.substr(2));
               break;
            case "C":
               this.aks.Basics.onFileCheck(sData.substr(2));
               break;
            case "p":
               this.aks.Basics.onAveragePing(sData.substr(2));
               break;
            case "v":
               dofus.Sonidos.SONIDO_GENERAL.playSound(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "A":
         switch(sAction)
         {
            case "A":
               this.aks.Account.onCharacterAdd(!bError,sData.substr(3));
               break;
            case "E":
               var _loc24_ = false;
               var _loc25_ = false;
               var _loc21_ = false;
               switch(sData.charAt(2))
               {
                  case "n":
                     _loc24_ = true;
                     break;
                  case "c":
                     _loc25_ = true;
                     break;
                  case "i":
                     _loc21_ = sData.charAt(3) != undefined && sData.charAt(3) == "f";
                     if(this.api.ui.getUIComponent("MakeMimibiote") == undefined)
                     {
                        this.api.ui.loadUIComponent("MakeMimibiote","MakeMimibiote");
                     }
                     return undefined;
                  default:
                     if(this.api.ui.getUIComponent("MakeMimibiote") == undefined)
                     {
                        this.api.ui.loadUIComponent("MakeMimibiote","MakeMimibiote");
                     }
                     return undefined;
               }
               _loc21_ = sData.charAt(3) != undefined && sData.charAt(3) == "f";
               if(this.api.ui.getUIComponent("EditPlayer") == undefined)
               {
                  this.api.ui.loadUIComponent("EditPlayer","EditPlayer",{editName:_loc24_,editColors:_loc25_,force:_loc21_});
               }
               break;
            case "a":
               this.aks.Game.onTurnLider(sData.substr(2));
               break;
            case "b":
               if(this.api.ui.getUIComponent("Banner") != undefined)
               {
                  this.api.ui.getUIComponent("Banner").activarCirculoXP();
               }
               break;
            case "B":
               this.aks.Account.onCharacterSelectedLeader(sData.substr(2));
               break;
            case "C":
               this.aks.Account.cambiarClase(sData.substr(2));
               break;
            case "c":
               this.aks.Account.onCommunity(sData.substr(2));
               break;
            case "d":
               this.aks.Account.onDofusPseudo(sData.substr(2));
               break;
            case "D":
               this.aks.Account.onCharacterDelete(!bError,sData.substr(3));
               break;
            case "F":
               this.aks.Account.onFriendServerList(sData.substr(2));
               break;
            case "f":
               this.aks.Account.onNewQueue(sData.substr(2));
               break;
            case "g":
               this.aks.Account.onGiftsList(sData.substr(2));
               break;
            case "G":
               this.aks.Account.onGiftStored(!bError);
               break;
            case "H":
               this.aks.Account.onHosts(sData.substr(2));
               break;
            case "I":
               this.aks.Account.cambiarID(sData.substr(2));
               break;
            case "k":
               this.aks.Account.onStats2(sData.substr(2));
               break;
            case "K":
               this.aks.Account.onKey(sData.substr(2));
               break;
            case "l":
               this.aks.Account.onLogin(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Account.onCharactersList(!bError,sData.substr(3));
               break;
            case "M":
               _loc0_ = _loc0_ = sData.charAt(2);
               if(_loc0_ !== "?")
               {
                  this.aks.Account.onCharactersList(!bError,sData.substr(3),true);
               }
               else
               {
                  this.aks.Account.onCharactersMigrationAskConfirm(sData.substr(3));
               }
               break;
            case "m":
               if(!_global.CONFIG.isStreaming)
               {
                  this.aks.Account.onMiniClipInfo();
               }
               else
               {
                  var _loc20_ = _global.parseInt(sData.charAt(2),10);
                  if(_global.isNaN(_loc20_))
                  {
                     _loc20_ = 3;
                  }
                  getURL("FSCommand:GoToCongratulation",_loc20_);
               }
               break;
            case "N":
               this.aks.Account.onNewLevel(sData.substr(2));
               break;
            case "n":
               this.aks.Account.onNewReset(sData.substr(2));
               break;
            case "p":
               this.aks.Account.onNewOmega(sData.substr(2));
               break;
            case "P":
               this.aks.Account.onCharacterNameGenerated(!bError,sData.substr(3));
               break;
            case "q":
               this.aks.Account.onQueue(sData.substr(2));
               break;
            case "Q":
               this.aks.Account.onSecretQuestion(sData.substr(2));
               break;
            case "r":
               this.aks.Account.onRescue(!bError);
               break;
            case "R":
               this.aks.Account.onRestrictions(sData.substr(2));
               break;
            case "S":
               this.aks.Account.onCharacterSelected(!bError,sData.substr(4));
               this.aks.electron(true);
               break;
            case "s":
               this.aks.Account.onStats(sData.substr(2));
               break;
            case "T":
               this.aks.Account.onTicketResponse(!bError,sData.substr(3));
               break;
            case "t":
               _loc0_ = _loc0_ = sData.charAt(2);
               if(_loc0_ === "S")
               {
                  this.aks.send("AtS");
               }
            case "V":
               this.aks.Account.onRegionalVersion(sData.substr(2));
               this.iniciarVoto();
               break;
            case "x":
               this.aks.Account.onServersList(!bError,sData.substr(3));
               break;
            case "X":
               this.aks.Account.onSelectServer(!bError,true,sData.substr(3));
               break;
            case "Y":
               this.aks.Account.onSelectServer(!bError,false,sData.substr(3));
         }
         break;
      case "G":
         switch(sAction)
         {
            case "ñ":
               this.api.ui.getUIComponent("Banner").modoCriatura(sData.substr(2));
               break;
            case "H":
               this.aks.Game.cambiarModoTactico();
               break;
            case "Z":
               switch(sData.charAt(2))
               {
                  case "A":
                     var _loc16_ = sData.substr(3).split(";");
                     if(_loc16_.length == 4)
                     {
                        this.aks.Game.propuestaOgrinas({vendedor:_loc16_[0],comprador:_loc16_[1],ogrinas:_loc16_[2],kamas:_loc16_[3]});
                     }
                     break;
                  case "C":
                     this.aks.Game.cerrarPropuesta();
               }
               break;
            case "C":
               this.aks.Game.onCreate(!bError,sData.substr(4));
               break;
            case "J":
               this.aks.Game.onJoin(sData.substr(3));
               break;
            case "P":
               this.aks.Game.onPositionStart(sData.substr(2));
               break;
            case "R":
               this.aks.Game.onReady(sData.substr(2));
               break;
            case "s":
               this.aks.Game.onStopSpriteMove(sData.substr(2));
               break;
            case "S":
               this.aks.Game.onStartToPlay();
               break;
            case "E":
               this.aks.Game.onEnd(sData.substr(2));
               break;
            case "M":
               this.aks.Game.onMovement(sData.substr(3));
               break;
            case "c":
               this.aks.Game.onChallenge(sData.substr(2));
               break;
            case "t":
               this.aks.Game.onTeam(sData.substr(2));
               break;
            case "V":
               this.aks.Game.onLeave(true,sData.substr(2));
               break;
            case "f":
               this.aks.Game.onFlag(sData.substr(2));
               break;
            case "I":
               switch(sData.charAt(2))
               {
                  case "C":
                     this.aks.Game.onPlayersCoordinates(sData.substr(4));
                     break;
                  case "E":
                     this.aks.Game.onEffect(sData.substr(3));
                     break;
                  case "e":
                     this.aks.Game.onClearAllEffect(sData.substr(3));
                     break;
                  case "P":
                     this.aks.Game.onPVP(sData.substr(3),false);
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "D":
               switch(sData.charAt(2))
               {
                  case "C":
                     this.aks.Game.onCellData(sData.substr(3));
                     break;
                  case "D":
                     this.aks.Game.onDescripcion(sData.substr(3));
                     break;
                  case "E":
                     this.aks.Game.onFrameObjectExternal(sData.substring(4));
                     break;
                  case "F":
                     this.aks.Game.onFrameObject2(sData.substring(4));
                     break;
                  case "K":
                     this.aks.Game.onMapLoaded();
                     break;
                  case "M":
                     this.aks.Game.onMapData(sData.substr(4));
                     break;
                  case "O":
                     this.aks.Game.onCellObject(sData.substring(3));
                     break;
                  case "Z":
                     this.aks.Game.onZoneData(sData.substring(3));
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "d":
               switch(sData.charAt(3))
               {
                  case "K":
                     this.aks.Game.onFightChallengeUpdate(sData.substr(4),true);
                     break;
                  case "O":
                     this.aks.Game.onFightChallengeUpdate(sData.substr(4),false);
                     break;
                  default:
                     this.aks.Game.onFightChallenge(sData.substr(2));
               }
               break;
            case "A":
               switch(sData.charAt(2))
               {
                  case "S":
                     this.aks.GameActions.onActionsStart(sData.substr(3));
                     break;
                  case "F":
                     this.aks.GameActions.onActionsFinish(sData.substr(3));
                     break;
                  case "C":
                     this.aks.GameActions.onCleanGameActions();
                     break;
                  default:
                     this.aks.GameActions.onActions(sData.substr(2));
               }
               break;
            case "T":
               switch(sData.charAt(2))
               {
                  case "S":
                     this.aks.Game.onTurnStart(sData.substr(3));
                     break;
                  case "F":
                     this.aks.Game.onTurnFinish(sData.substr(3));
                     break;
                  case "L":
                     this.aks.Game.onTurnlist(sData.substr(4));
                     break;
                  case "M":
                     this.aks.Game.onTurnMiddle(sData.substr(4));
                     break;
                  case "U":
                     this.aks.Game.onTurnUpdate(sData.substr(4));
                     break;
                  case "R":
                     this.aks.Game.onTurnReady(sData.substr(3));
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "X":
               this.aks.Game.onExtraClip(sData.substr(2));
               break;
            case "o":
               this.aks.Game.onFightOption(sData.substr(2));
               break;
            case "O":
               this.aks.Game.onGameOver();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "c":
         switch(sAction)
         {
            case "M":
               this.aks.Chat.onMessage(!bError,sData.substr(3));
               break;
            case "s":
               this.aks.Chat.onServerMessage(sData.substr(2));
               break;
            case "S":
               this.aks.Chat.onSmiley(sData.substr(2));
               break;
            case "C":
               this.aks.Chat.onSubscribeChannel(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "D":
         switch(sAction)
         {
            case "A":
               this.aks.Dialog.onCustomAction(sData.substr(2));
               break;
            case "C":
               this.aks.Dialog.onCreate(!bError,sData.substr(3));
               break;
            case "Q":
               this.aks.Dialog.onQuestion(sData.substr(2));
               break;
            case "V":
               this.aks.Dialog.onLeave();
               break;
            case "P":
               this.aks.Dialog.onPause();
               break;
            case "B":
               this.api.kernel.DebugConsole.buscarDialogos(sData.charAt(2),sData.substr(3));
               break;
            case "L":
               var _loc18_ = sData.substr(3).split("|");
               var _loc27_ = Number(_loc18_[0]);
               _loc18_.splice(0,1);
               var _loc28_ = _loc18_.join("|");
               this.api.kernel.DebugConsole.cargarDialogo(sData.charAt(2),_loc27_,_loc28_);
               break;
            case "X":
               this.api.kernel.DebugConsole.imprimirDialogos();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "I":
         switch(sAction)
         {
            case "M":
               this.aks.Infos.onInfoMaps(sData.substr(2));
               break;
            case "C":
               this.aks.Infos.onInfoCompass(sData.substr(2));
               break;
            case "H":
               this.aks.Infos.onInfoCoordinatespHighlight(sData.substr(2));
               break;
            case "m":
               this.aks.Infos.onMessage(sData.substr(2));
               break;
            case "Q":
               this.aks.Infos.onQuantity(sData.substr(2));
               break;
            case "O":
               this.aks.Infos.onObject(sData.substr(2));
               break;
            case "P":
               this.aks.Infos.onPathWorld(sData.substr(2));
               break;
            case "p":
               this.aks.Infos.onShow(sData.substr(2));
               break;
            case "L":
               switch(sData.charAt(2))
               {
                  case "S":
                     this.aks.Infos.onLifeRestoreTimerStart(sData.substr(3));
                     break;
                  case "F":
                     this.aks.Infos.onLifeRestoreTimerFinish(sData.substr(3));
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "S":
         switch(sAction)
         {
            case "L":
               switch(sData.charAt(2))
               {
                  case "o":
                     this.aks.Spells.onChangeOption(sData.substr(3));
                     break;
                  case "A":
                     this.aks.Spells.onList2(sData.substr(3));
                     break;
                  case "a":
                     this.aks.Spells.onList3(sData.substr(3));
                     break;
                  default:
                     this.aks.Spells.onList(sData.substr(2));
               }
               break;
            case "P":
               _loc0_ = _loc0_ = sData.charAt(2);
               if(_loc0_ === "X")
               {
                  this.aks.send("RPX");
               }
               break;
            case "D":
               this.aks.Spells.onDowngradeSpell(!_loc4,sData.substr(3));
               break;
            case "M":
               this.aks.Spells.onMoveToUsed(sData.substr(2));
               break;
            case "U":
               this.aks.Spells.onUpgradeSpell(!bError,sData.substr(3));
               break;
            case "B":
               this.aks.Spells.onSpellBoost(sData.substr(2));
               break;
            case "F":
               this.aks.Spells.onSpellForget(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "O":
         switch(sAction)
         {
            case "a":
               this.aks.Items.onAccessories(sData.substr(2));
               break;
            case "D":
               this.aks.Items.onDrop(!bError,sData.substr(3));
               break;
            case "A":
               this.aks.Items.onAdd(!bError,sData.substr(3));
               break;
            case "C":
               this.aks.Items.onChange(sData.substr(3));
               break;
            case "R":
               this.aks.Items.onRemove(sData.substr(2));
               break;
            case "Q":
               this.aks.Items.onQuantity(sData.substr(2));
               break;
            case "M":
               this.aks.Items.onMovement(sData.substr(2));
               break;
            case "T":
               this.aks.Items.onTool(sData.substr(2));
               break;
            case "w":
               this.aks.Items.onWeight(sData.substr(2));
               break;
            case "r":
               switch(sData.charAt(2))
               {
                  case "A":
                     this.aks.InventoryShortcuts.onInventoryShortcutAdded(sData.substr(3));
                     break;
                  case "R":
                     this.aks.InventoryShortcuts.onInventoryShortcutRemoved(sData.substr(3));
               }
               break;
            case "o":
               api = _global.API;
               if(api.ui.getUIComponent("Prestigio") != undefined)
               {
                  api.ui.getUIComponent("Prestigio").cargaTodo(sData.substr(2),false);
               }
               else if(_global.Panoramico)
               {
                  api.ui.loadUIAutoHideComponent("Prestigio2","Prestigio2",{datos:sData.substr(2)});
               }
               else
               {
                  api.ui.loadUIAutoHideComponent("Prestigio","Prestigio",{datos:sData.substr(2)});
               }
               break;
            case "S":
               this.aks.Items.onItemSet(sData.substr(2));
               break;
            case "K":
               this.aks.Items.onItemUseCondition(sData.substr(2));
               break;
            case "F":
               this.aks.Items.onItemFound(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "F":
         switch(sAction)
         {
            case "A":
               this.aks.Friends.onAddFriend(!bError,sData.substr(3));
               break;
            case "D":
               this.aks.Friends.onRemoveFriend(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Friends.onFriendsList(sData.substr(3));
               break;
            case "S":
               this.aks.Friends.onSpouse(sData.substr(2));
               break;
            case "O":
               this.aks.Friends.onNotifyChange(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "i":
         switch(sAction)
         {
            case "A":
               this.aks.Enemies.onAddEnemy(!bError,sData.substr(3));
               break;
            case "D":
               this.aks.Enemies.onRemoveEnemy(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Enemies.onEnemiesList(sData.substr(3));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "K":
         switch(sAction)
         {
            case "C":
               this.aks.Key.onCreate(sData.substr(3));
               break;
            case "K":
               this.aks.Key.onKey(!bError);
               break;
            case "V":
               this.aks.Key.onLeave();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "J":
         switch(sAction)
         {
            case "S":
               this.aks.Job.onSkills(sData.substr(3));
               break;
            case "X":
               this.aks.Job.onXP(sData.substr(3));
               break;
            case "N":
               this.aks.Job.onLevel(sData.substr(2));
               break;
            case "R":
               this.aks.Job.onRemove(sData.substr(2));
               break;
            case "O":
               this.aks.Job.onOptions(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "E":
         switch(sAction)
         {
            case "R":
               this.aks.Exchange.onRequest(!bError,sData.substr(3));
               break;
            case "K":
               this.aks.Exchange.onReady(sData.substr(2));
               break;
            case "V":
               this.aks.Exchange.onLeave(!bError,sData.substr(2));
               break;
            case "C":
               this.aks.Exchange.onCreate(!bError,sData.substr(3));
               break;
            case "c":
               this.aks.Exchange.onCraft(!bError,sData.substr(3));
               break;
            case "M":
               this.aks.Exchange.onLocalMovement(!bError,sData.substr(3));
               break;
            case "m":
               this.aks.Exchange.onDistantMovement(!bError,sData.substr(3));
               break;
            case "r":
               this.aks.Exchange.onCoopMovement(!bError,sData.substr(3));
               break;
            case "p":
               this.aks.Exchange.onPayMovement(!bError,sData.substr(2));
               break;
            case "s":
               this.aks.Exchange.onStorageMovement(!bError,sData.substr(3));
               break;
            case "i":
               this.aks.Exchange.onPlayerShopMovement(!bError,sData.substr(3));
               break;
            case "W":
               this.aks.Exchange.onCraftPublicMode(sData.substr(2));
               break;
            case "e":
               this.aks.Exchange.onMountStorage(sData.substr(2));
               break;
            case "f":
               this.aks.Exchange.onMountPark(sData.substr(2));
               break;
            case "w":
               this.aks.Exchange.onMountPods(sData.substr(2));
               break;
            case "L":
               this.aks.Exchange.onList(sData.substr(2));
               break;
            case "l":
               this.aks.Exchange.onList2(sData.substr(2));
               break;
            case "S":
               this.aks.Exchange.onSell(!bError);
               break;
            case "B":
               this.aks.Exchange.onBuy(!bError);
               break;
            case "q":
               this.aks.Exchange.onAskOfflineExchange(sData.substr(2));
               break;
            case "H":
               switch(sData.charAt(2))
               {
                  case "S":
                     this.aks.Exchange.onSearch(sData.substr(3));
                     break;
                  case "L":
                     this.aks.Exchange.onBigStoreTypeItemsList(sData.substr(3));
                     break;
                  case "M":
                     this.aks.Exchange.onBigStoreTypeItemsMovement(sData.substr(3));
                     break;
                  case "l":
                     this.aks.Exchange.onBigStoreItemsList(sData.substr(3));
                     break;
                  case "m":
                     this.aks.Exchange.onBigStoreItemsMovement(sData.substr(3));
                     break;
                  case "P":
                     this.aks.Exchange.onItemMiddlePriceInBigStore(sData.substr(3));
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "J":
               this.aks.Exchange.onCrafterListChanged(sData.substr(2));
               break;
            case "j":
               this.aks.Exchange.onCrafterReference(sData.substr(2));
               break;
            case "A":
               this.aks.Exchange.onCraftLoop(sData.substr(2));
               break;
            case "a":
               this.aks.Exchange.onCraftLoopEnd(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "h":
         switch(sAction)
         {
            case "L":
               this.aks.Houses.onList(sData.substr(2));
               break;
            case "P":
               this.aks.Houses.onProperties(sData.substr(2));
               break;
            case "X":
               this.aks.Houses.onLockedProperty(sData.substr(2));
               break;
            case "C":
               this.aks.Houses.onCreate(sData.substr(3));
               break;
            case "S":
               this.aks.Houses.onSell(!bError,sData.substr(3));
               break;
            case "B":
               this.aks.Houses.onBuy(!bError,sData.substr(3));
               break;
            case "V":
               this.aks.Houses.onLeave();
               break;
            case "G":
               this.aks.Houses.onGuildInfos(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "s":
         switch(sAction)
         {
            case "L":
               this.aks.Storages.onList(sData.substr(2));
               break;
            case "e":
               this.api.ui.loadUIAutoHideComponent("MakeExo","MakeExo");
               break;
            case "X":
               this.aks.Storages.onLockedProperty(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "e":
         switch(sAction)
         {
            case "U":
               this.aks.Emotes.onUse(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Emotes.onList(sData.substr(2));
               break;
            case "A":
               this.aks.Emotes.onAdd(sData.substr(2));
               break;
            case "R":
               this.aks.Emotes.onRemove(sData.substr(2));
               break;
            case "D":
               this.aks.Emotes.onDirection(sData.substr(2));
               break;
            case "F":
               this.aks.Emotes.onDirection2(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "d":
         switch(sAction)
         {
            case "C":
               this.aks.Documents.onCreate(!bError,sData.substr(3));
               break;
            case "V":
               this.aks.Documents.onLeave();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "g":
         switch(sAction)
         {
            case "n":
               this.aks.Guild.onNew();
               break;
            case "C":
               this.aks.Guild.onCreate(!bError,sData.substr(3));
               break;
            case "S":
               this.aks.Guild.onStats(sData.substr(2));
               break;
            case "I":
               switch(sData.charAt(2))
               {
                  case "G":
                     this.aks.Guild.onInfosGeneral(sData.substr(3));
                     break;
                  case "M":
                     this.aks.Guild.onInfosMembers(sData.substr(3));
                     break;
                  case "B":
                     this.aks.Guild.onInfosBoosts(sData.substr(3));
                     break;
                  case "F":
                     this.aks.Guild.onInfosMountPark(sData.substr(3));
                     break;
                  case "I":
                     this.aks.Guild.onInfos(sData.substr(3));
                     break;
                  case "T":
                     switch(sData.charAt(3))
                     {
                        case "M":
                           this.aks.Guild.onInfosTaxCollectorsMovement(sData.substr(4));
                           break;
                        case "P":
                           this.aks.Guild.onInfosTaxCollectorsPlayers(sData.substr(4));
                           break;
                        case "p":
                           this.aks.Guild.onInfosTaxCollectorsAttackers(sData.substr(4));
                           break;
                        default:
                           this.aks.defaultProcessAction(sType,sAction,bError,sData);
                     }
                     break;
                  case "H":
                     this.aks.Guild.onInfosHouses(sData.substr(3));
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "J":
               switch(sData.charAt(2))
               {
                  case "E":
                     this.aks.Guild.onJoinError(sData.substr(3));
                     break;
                  case "R":
                     this.aks.Guild.onRequestLocal(sData.substr(3));
                     break;
                  case "r":
                     this.aks.Guild.onRequestDistant(sData.substr(3));
                     break;
                  case "K":
                     this.aks.Guild.onJoinOk(sData.substr(3));
                     break;
                  case "C":
                     this.aks.Guild.onJoinDistantOk();
                     break;
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "V":
               this.aks.Guild.onLeave();
               break;
            case "K":
               this.aks.Guild.onBann(!bError,sData.substr(3));
               break;
            case "H":
               this.aks.Guild.onHireTaxCollector(!bError,sData.substr(3));
               break;
            case "A":
               this.aks.Guild.onTaxCollectorAttacked(sData.substr(2));
               break;
            case "T":
               this.aks.Guild.onTaxCollectorInfo(sData.substr(2));
               break;
            case "U":
               this.aks.Guild.onUserInterfaceOpen(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "W":
         switch(sAction)
         {
            case "C":
               this.aks.Waypoints.onCreate(sData.substr(2));
               break;
            case "V":
               this.aks.Waypoints.onLeave();
               break;
            case "U":
               this.aks.Waypoints.onUseError();
               break;
            case "c":
               this.aks.Subway.onCreate(sData.substr(2));
               break;
            case "v":
               this.aks.Subway.onLeave();
               break;
            case "u":
               this.aks.Subway.onUseError();
               break;
            case "p":
               this.aks.Subway.onPrismCreate(sData.substr(2));
               break;
            case "w":
               this.aks.Subway.onPrismLeave();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "t":
         switch(sAction)
         {
            case "s":
               this.aks.Ttg.onList(sData.substr(2));
               break;
            case "d":
               this.aks.Ttg.onDates(sData.substr(2));
               break;
            case "a":
               this.aks.Ttg.onAdd(sData.substr(2));
               break;
            case "r":
               this.aks.Ttg.onOpenCardsRecycler();
               break;
            case "u":
               this.aks.Ttg.onOpenCardsUpgrader();
               break;
            case "o":
               this.aks.Ttg.onCreate(!_loc4_,sData.substr(2));
               break;
            case "c":
               this.aks.Ttg.onLeave(!_loc4_);
               break;
            case "i":
               this.aks.Ttg.onOpenMyCollection();
         }
         break;
      case "V":
         switch(sAction)
         {
            case "A":
               this.aks.Items.onAdd2(!bError,sData.substr(3));
               break;
            case "C":
               this.aks.Items.onChange2(sData.substr(3));
               break;
            case "R":
               this.aks.Items.onRemove2(sData.substr(2));
               break;
            case "Q":
               this.aks.Items.onQuantity2(sData.substr(2));
         }
         break;
      case "z":
         switch(sAction)
         {
            case "C":
               this.aks.Zones.onCreate(sData.substr(2));
               break;
            case "V":
               this.aks.Zones.onLeave();
               break;
            case "U":
               this.aks.Zones.onUseError();
         }
         break;
      case "a":
         switch(sAction)
         {
            case "l":
               this.aks.Subareas.onList(sData.substr(3));
               break;
            case "m":
               this.aks.Subareas.onAlignmentModification(sData.substr(2));
               break;
            case "M":
               this.aks.Conquest.onAreaAlignmentChanged(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "C":
         switch(sAction)
         {
            case "F":
               _loc0_ = _loc0_ = sData.charAt(2);
               if(_loc0_ === "P")
               {
                  this.api.network.Game.triggerCellFightPos(sData.substr(3));
               }
               break;
            case "I":
               switch(sData.charAt(2))
               {
                  case "J":
                     this.aks.Conquest.onPrismInfosJoined(sData.substr(3));
                     break;
                  case "V":
                     this.aks.Conquest.onPrismInfosClosing(sData.substr(3));
                  default:
                     this.aks.defaultProcessAction(sType,sAction,bError,sData);
               }
               break;
            case "B":
               this.aks.Conquest.onConquestBonus(sData.substr(2));
               break;
            case "A":
               this.aks.Conquest.onPrismAttacked(sData.substr(2));
               break;
            case "S":
               this.aks.Conquest.onPrismSurvived(sData.substr(2));
               break;
            case "D":
               this.aks.Conquest.onPrismDead(sData.substr(2));
               break;
            case "P":
               this.aks.Conquest.onPrismFightAddPlayer(sData.substr(2));
               break;
            case "p":
               this.aks.Conquest.onPrismFightAddEnemy(sData.substr(2));
               break;
            case "W":
               this.aks.Conquest.onWorldData(sData.substr(2));
               break;
            case "b":
               this.aks.Conquest.onConquestBalance(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "f":
         switch(sAction)
         {
            case "C":
               this.aks.Fights.onCount(sData.substr(2));
               break;
            case "L":
               this.aks.Fights.onList(sData.substr(2));
               break;
            case "D":
               this.aks.Fights.onDetails(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "T":
         switch(sAction)
         {
            case "C":
               this.aks.Tutorial.onCreate(sData.substr(2));
               break;
            case "T":
               this.aks.Tutorial.onShowTip(sData.substr(2));
               break;
            case "B":
               this.aks.Tutorial.onGameBegin();
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "Q":
         switch(sAction)
         {
            case "L":
               this.aks.Quests.onList(sData.substr(3));
               break;
            case "S":
               this.aks.Quests.onStep(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "P":
         switch(sAction)
         {
            case "I":
               this.aks.Party.onInvite(!bError,sData.substr(3));
               break;
            case "L":
               this.aks.Party.onLeader(sData.substr(2));
               break;
            case "R":
               this.aks.Party.onRefuse(sData.substr(2));
               break;
            case "A":
               this.aks.Party.onAccept(sData.substr(2));
               break;
            case "C":
               this.aks.Party.onCreate(!bError,sData.substr(3));
               break;
            case "V":
               this.aks.Party.onLeave(sData.substr(2));
               break;
            case "F":
               this.aks.Party.onFollow(!bError,sData.substr(3));
               break;
            case "M":
               this.aks.Party.onMovement(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "R":
         switch(sAction)
         {
            case "e":
               this.aks.Mount.onEquip(sData.substr(2));
               break;
            case "x":
               this.aks.Mount.onXP(sData.substr(2));
               break;
            case "n":
               this.aks.Mount.onName(sData.substr(2));
               break;
            case "d":
               this.aks.Mount.onData(sData.substr(2));
               break;
            case "p":
               this.aks.Mount.onMountPark(sData.substr(2));
               break;
            case "D":
               this.aks.Mount.onMountParkBuy(sData.substr(2));
               break;
            case "v":
               this.aks.Mount.onLeave(sData.substr(2));
               break;
            case "r":
               this.aks.Mount.onRidingState(sData.substr(2));
               break;
            default:
               this.aks.defaultProcessAction(sType,sAction,bError,sData);
         }
         break;
      case "k":
         switch(sAction)
         {
            case "a":
               this.api.ui.loadUIAutoHideComponent("Market","Market",{MarketOgrinas:sData.substr(2)});
               break;
            case "A":
               if(this.api.ui.getUIComponent("Market") != undefined)
               {
                  this.api.ui.getUIComponent("Market").Actualiza(sData.substr(2));
               }
               break;
            case "n":
               api = _global.API;
               api.ui.loadUIAutoHideComponent("LootBox","LootBox",{loot:sData.substr(2)});
               break;
            case "N":
               api = _global.API;
               api.ui.getUIComponent("LootBox").updateItems(sData.substr(2));
               break;
            case "f":
               api = _global.API;
               api.ui.getUIComponent("LootBox").reiniciame();
               break;
            case "B":
               api = _global.API;
               api.ui.getUIComponent("Banner").KoloOK(sData.substr(2));
               break;
            case "M":
               this.aks.Spells.onList2(sData.substr(2));
               break;
            case "O":
               this.aks.Account.onCharacterSelectedLeader(sData.substr(2));
               break;
            case "I":
               this.aks.Account.cambiarID(sData.substr(2));
               break;
            case "i":
               if(this.api.ui.getUIComponent("StatsJob") != undefined)
               {
                  this.api.ui.getUIComponent("StatsJob").initPrestige(sData.substr(2));
               }
               break;
            case "S":
               if(this.api.ui.getUIComponent("PanelMaitre") != undefined)
               {
                  this.api.ui.getUIComponent("PanelMaitre").initPrestige(sData.substr(2));
               }
               break;
            case "H":
               this.api.ui.loadUIAutoHideComponent("PanelPrestige","PanelPrestige",{initPrestige:sData.substr(2)});
               if(this.api.ui.getUIComponent("PanelPrestige") != undefined)
               {
                  this.api.ui.getUIComponent("PanelPrestige").initPrestige(sData.substr(2));
               }
               break;
            case "U":
               this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc1","PanelPrestigeDesc1");
               break;
            case "P":
               this.api.ui.loadUIAutoHideComponent("PanelNew","PanelNew");
               break;
            case "W":
               this.api.ui.loadUIAutoHideComponent("PanelPrestigeDesc2","PanelPrestigeDesc2");
               break;
            case "s":
               this.aks.Items.setsRapidos(sData.substr(2));
               break;
            case "p":
               var _loc13_ = sData.substr(2).split(";");
               this.api.ui.loadUIAutoHideComponent("Koliseum","Koliseum",{inscritos:Number(_loc13_[0]),tiempo:Number(_loc13_[1]),detalles:_loc13_[2],puntos:_loc13_[3],rango:_loc13_[4]});
               break;
            case "T":
               if((_loc0_ = sData.charAt(2)) === "U")
               {
                  this.aks.Game.onTurnUpdate(sData.substr(4));
               }
               break;
            case "c":
               this.api.ui.loadUIAutoHideComponent("CambioNombre","CambioNombre",{puntos:sData.substr(2)});
         }
         break;
      case "?":
         switch(sAction)
         {
            case "M":
               var _loc12_ = sData.substr(2);
               this.api.ui.loadUIAutoHideComponent("MarketShop","MarketShop",{miembros:_loc12_});
               break;
            case "m":
               _loc12_ = sData.substr(2);
               this.api.ui.getUIComponent("MarketShop").registrarItems(_loc12_);
               break;
            case "r":
               _loc12_ = sData.substr(2);
               this.api.ui.getUIComponent("MarketShop").RefreshPoints(_loc12_);
         }
         break;
      case "w":
         switch(sAction)
         {
            case "Y":
               var _loc22_ = sData.substr(2).split("#");
               this.api.ui.loadUIComponent("Temporis","Temporis",{temporichas:_loc22_[0],normalchallenge:_loc22_[1],exoticchallenge:_loc22_[2]});
               break;
            case "y":
               _global.TEMPORIS = true;
               break;
            case "l":
               this.api.ui.loadUIAutoHideComponent("Ornamento","Ornamento",{ornamentos:sData.substr(2)});
               break;
            case "O":
               this.api.ui.loadUIAutoHideComponent("Size","Size",{precio:sData.substr(2)});
               break;
            case "o":
               api = _global.API;
               if(api.ui.getUIComponent("Prestigio") != undefined)
               {
                  api.ui.getUIComponent("Prestigio").cargaTodo(sData.substr(2),false);
               }
               else if(_global.Panoramico)
               {
                  api.ui.loadUIAutoHideComponent("Prestigio2","Prestigio2",{datos:sData.substr(2)});
               }
               else
               {
                  api.ui.loadUIAutoHideComponent("Prestigio","Prestigio",{datos:sData.substr(2)});
               }
               break;
            case "E":
               this.api.ui.getUIComponent("CardsCollection").visualizar(sData.substr(2));
               break;
            case "F":
               this.api.ui.loadUIAutoHideComponent("CardsCollection","CardsCollection",{mobs:sData.substr(2)});
               break;
            case "f":
               this.api.ui.getUIComponent("CardsCollection").mostrarMobsDrops(sData.substr(2));
               break;
            case "r":
               var _loc4 = sData.substr(2).split(";");
               api = _global.API;
               var _loc11_ = this.api.ui.getUIComponent("Banner");
               var _loc6_ = new Object();
               var _loc10_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
               var _loc5_ = -1;
               while(true)
               {
                  _loc5_ += 1;
                  if(_loc5_ >= _loc4.length)
                  {
                     break;
                  }
                  if(_loc4[_loc5_].split(",")[2] == 2)
                  {
                     _loc6_.position = Number(_loc4[_loc5_].split(",")[0]);
                     _loc6_.name = _loc4[_loc5_].split(",")[1];
                     _loc6_.estado = _loc4[_loc5_].split(",")[4] + "/" + _loc4[_loc5_].split(",")[3];
                     _loc6_.finalizado = _loc4[_loc5_].split(",")[5];
                     _loc10_.push(_loc6_);
                  }
                  else if(_loc4[_loc5_].split(",")[2] == 1)
                  {
                     _loc6_.position = Number(_loc4[_loc5_].split(",")[0]);
                     _loc6_.name = _loc4[_loc5_].split(",")[1];
                     _loc6_.estado = _loc4[_loc5_].split(",")[4] + "/" + _loc4[_loc5_].split(",")[3];
                     _loc6_.finalizado = _loc4[_loc5_].split(",")[5];
                     _loc10_.push(_loc6_);
                  }
                  else if(_loc4[_loc5_].split(",")[2] == 4)
                  {
                     _loc6_.position = Number(_loc4[_loc5_].split(",")[0]);
                     _loc6_.name = _loc4[_loc5_].split(",")[1];
                     _loc6_.estado = _loc4[_loc5_].split(",")[4] + "/" + _loc4[_loc5_].split(",")[3];
                     _loc6_.finalizado = _loc4[_loc5_].split(",")[5];
                     _loc10_.push(_loc6_);
                  }
                  else
                  {
                     _loc6_.position = Number(_loc4[_loc5_].split(",")[0]);
                     _loc6_.name = _loc4[_loc5_].split(",")[1];
                     _loc6_.estado = _loc4[_loc5_].split(",")[4] + "/" + _loc4[_loc5_].split(",")[3];
                     _loc6_.finalizado = _loc4[_loc5_].split(",")[5];
                     _loc10_.push(_loc6_);
                  }
                  _loc6_ = new Object();
               }
               _loc11_.objetivodesc.btncompletar._visible = false;
               _loc11_.panelobjev.generalObjetivos._winBackground.title = "Objectifs quotidiens";
               _loc11_.panelobjev.generalObjetivos._dgMembers.columnsNames = ["Nº","Objectifs","%"];
               _loc11_.panelobjev.generalObjetivos._dgMembers.dataProvider = _loc10_;
               _loc11_.panelobjev.gotoAndPlay(2);
               _loc11_.Objetivos = true;
               break;
            case "g":
               _loc5_ = this.api.datacenter.Player;
               this.api.sounds.events.onBannerRoundButtonClick();
               if(_loc5_.isMutant)
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("CANT_U_ARE_MUTANT"),"ERROR_CHAT");
                  return undefined;
               }
               if(_loc5_.guildInfos != undefined)
               {
                  this.showSmileysEmotesPanel(false);
                  this.api.ui.loadUIAutoHideComponent("Guild","Guild",{currentTab:"Members",anuncio:sData.substr(2)});
               }
               else
               {
                  this.api.kernel.showMessage(undefined,this.api.lang.getText("UI_ONLY_FOR_GUILD"),"ERROR_CHAT");
               }
               break;
            case "P":
               this.api.ui.getUIComponent("Contenido").CargaObj(sData.substr(2));
               break;
            case "x":
               _loc6_ = sData.substr(2).split(",");
               api = _global.API;
               _loc5_ = this.api.ui.getUIComponent("Banner");
               _loc5_.objetivodesc._winBackground.title = _loc6_[0];
               var _loc49_ = _loc6_[9];
               _loc11_ = _loc6_[2];
               _loc10_ = _loc6_[3];
               _loc4 = "Inconnue";
               _loc5_.objetivodesc._cgOriginal._visible = false;
               _loc5_.objetivodesc.puntosvip._visible = false;
               _loc5_.objetivodesc.experiencia._visible = false;
               _loc5_.objetivodesc.honorpuntos._visible = false;
               _loc5_.objetivodesc.kamass._visible = false;
               _loc5_.objetivodesc.btnentregar._visible = false;
               if(_loc6_[7] == 3)
               {
                  _loc5_.objetivodesc.btnentregar._visible = true;
                  _loc5_.Posicion = _loc6_[6];
               }
               if(_loc11_ == 1)
               {
                  _loc5_.objetivodesc.experiencia._visible = true;
                  _loc4 = "+" + _loc10_ + " Expérience";
               }
               else if(_loc11_ == 3)
               {
                  var _loc15_ = _loc6_[5];
                  _loc12_ = _loc15_;
                  var _loc19_ = _loc15_;
                  var _loc26_ = _loc6_[4];
                  var _loc17_ = "";
                  var _loc14_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
                  _loc14_.push(new dofus.datacenter["\f\f"](0,_loc19_,1,-1,_loc17_));
                  _loc5_.objetivodesc._cgOriginal.dataProvider = _loc14_;
                  _loc5_.objetivodesc._cgOriginal._visible = true;
                  _loc4 = "+ " + _loc10_ + " " + _loc26_ + " Item(s)";
               }
               else if(_loc11_ == 2)
               {
                  _loc5_.objetivodesc.kamass._visible = true;
                  _loc4 = "+" + _loc10_ + " Kamas";
               }
               _loc15_ = _loc6_[8];
               _loc12_ = _loc15_;
               _loc19_ = _loc15_;
               _loc17_ = "";
               _loc14_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
               _loc14_.push(new dofus.datacenter["\f\f"](_loc12_,_loc19_,1,-1,_loc17_));
               _loc5_.objetivodesc._cgOriginal2.dataProvider = _loc14_;
               _loc5_.objetivodesc._cgOriginal2._visible = true;
               _loc5_.objetivodesc._txtDescription.text = _loc6_[1] + "\n\nType de récompense:: " + _loc4;
               _loc5_.objetivodesc._txtDescription2.text = "En remplissant tous les objectifs quotidiens, vous obtiendrez une quantité de cet objet mystérieux légendaire.";
               _loc5_.objetivodesc._lblStep.text = "Description de l\'objectif: " + _loc6_[0];
               _loc5_.objetivodesc._visible = true;
         }
         break;
      case "b":
         switch(sAction)
         {
            case "l":
               this.api.ui.loadUIAutoHideComponent("Titulos","Titulos",{titulos:sData.substr(2)});
               break;
            case "T":
               _loc0_ = _loc0_ = sData.charAt(2);
               if(_loc0_ === "U")
               {
                  this.aks.Game.onTurnUpdate(sData.substr(4));
               }
               break;
            case "L":
               this.api.ui.loadUIAutoHideComponent("CreateTitle","CreateTitle");
               break;
            case "x":
               this.api.ui.loadUIComponent("LadderCard");
               break;
            case "f":
               this.api.ui.loadUIAutoHideComponent("Ladder","Ladder",{data:sData.substr(2)});
               break;
            case "D":
               if(this.api.ui.getUIComponent("Ladder") != undefined)
               {
                  this.api.ui.getUIComponent("Ladder").updateDatas();
               }
               break;
            case "e":
               if(this.api.ui.getUIComponent("Ladder") != undefined)
               {
                  this.api.ui.getUIComponent("Ladder").registrar(sData.substr(2));
               }
               break;
            case "Z":
               this.api.ui.loadUIAutoHideComponent("Logros","Logros",{data:sData.substr(2)});
               break;
            case "F":
               this.api.ui.loadUIAutoHideComponent("CardsCollection","CardsCollection",{mobs:sData.substr(2)});
               break;
            case "E":
               this.api.ui.getUIComponent("CardsCollection").visualizar(sData.substr(2));
               break;
            case "C":
               this.api.ui.loadUIAutoHideComponent("CambiarColor","CambiarColor");
         }
   }
};
