import 'package:pokergame/store/card_model.dart';

import 'card_model.dart';

class HandModel{
  //Hand contains five card
  List<CardModel> cardlist;
  //Hand Name
  // Poker-Full House - Four of a Kind -Three of a Kind-Two pairs-Pair
  String name;
  HandModel({required this.cardlist,required this.name});
}