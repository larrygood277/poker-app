import 'package:pokergame/store/deck_model.dart';
import 'package:pokergame/store/player_model.dart';

class AppState {
  List<PlayerModel> players;
  DeckModel deckModel;
  //should be define deck(can be change) and players(hands and winner)
  AppState({
    required this.players, required this.deckModel
  });
}