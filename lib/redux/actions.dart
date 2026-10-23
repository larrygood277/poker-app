import 'package:pokergame/store/card_model.dart';
import 'package:pokergame/store/deck_model.dart';
import 'package:pokergame/store/hand_model.dart';

import '../store/player_model.dart';

class DistributeCardsAction {
  DistributeCardsAction();
}

class Replay {
  Replay();
}

class ChangeHandAction {
  final PlayerModel playerModel;
  ChangeHandAction(this.playerModel);
}
class AddChosenCard {
  final CardModel card;
  final String playerName;
  AddChosenCard(this.card,this.playerName);
}
class ShowHandAction {
  final String showPlayerName;
  ShowHandAction(this.showPlayerName);
}

class ComparePlayerAction {
  final List<PlayerModel> players;
  ComparePlayerAction(this.players);
}


class DefinePlayerNameAction {
  String playerName1,playerName2;
  DefinePlayerNameAction(this.playerName1,this.playerName2);
}


