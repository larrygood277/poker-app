import 'package:pokergame/store/hand_model.dart';

import 'card_model.dart';

class PlayerModel{
  //replace cards from their hand
  List<CardModel> playerChoosenCard;
  //player hand
  HandModel playerHand;
  //player name
  String playerName;
  //player is winner situaition;
  bool isWinner;

  bool handOpen;
  PlayerModel({required this.playerChoosenCard,required this.playerHand,required this.playerName,required this.isWinner,required this.handOpen});

  static List<PlayerModel> players=[
    PlayerModel(
      playerChoosenCard: [],
      playerHand: HandModel(name: "", cardlist: []),
      playerName: "",
      isWinner: false,
      handOpen: false,
    ),
    PlayerModel(
      playerChoosenCard: [],
      playerHand: HandModel(name: "", cardlist: []),
      playerName: "",
      isWinner: false,
      handOpen: false,
    ),
  ];
}
