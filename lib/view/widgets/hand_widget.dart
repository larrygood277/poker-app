import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pokergame/redux/actions.dart';
import 'package:pokergame/redux/app_state.dart';
import 'package:pokergame/store/card_model.dart';
import 'package:pokergame/store/hand_model.dart';
import 'package:pokergame/store/player_model.dart';
import 'package:pokergame/view/constants/context_extension.dart';

import '../constants/color.dart';
import 'card_widget.dart';

class HandWidget extends StatefulWidget {
  PlayerModel playerModel;
  bool compare;
  HandWidget(this.playerModel,this.compare);

  @override
  State<HandWidget> createState() => _HandWidgetState();
}

class _HandWidgetState extends State<HandWidget> {
  addCard(int index) {
    List<CardModel> handlist = widget.playerModel.playerHand.cardlist;
    StoreProvider.of<AppState>(context).dispatch(
      AddChosenCard(CardModel(kind: handlist[index].kind, index: handlist[index].index, isOpen: false), widget.playerModel.playerName),
    );
  }

  String getImage(int index) {
    List<CardModel> handlist = widget.playerModel.playerHand.cardlist;
    if (widget.playerModel.handOpen) {
      return 'assets/${handlist[index].kind}${handlist[index].index}.jpg';
    } else {
      return 'assets/back_card.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CardModel> handlist = widget.playerModel.playerHand.cardlist;
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: -1,
          child: CardWidget((widget.playerModel.handOpen && handlist[0].isOpen), getImage(0), () {
            addCard(0);
          },widget.compare),
        ),
        Positioned(
          left: context.dynamicMultiWidth(0.15),
          bottom: 4,
          child: CardWidget((widget.playerModel.handOpen && handlist[1].isOpen), getImage(1), () {
            addCard(1);
          },widget.compare),
        ),
        Positioned(
          left: context.dynamicMultiWidth(0.3),
          bottom: 6,
          child: CardWidget((widget.playerModel.handOpen && handlist[2].isOpen), getImage(2), (){
            addCard(2);
          },widget.compare),
        ),
        Positioned(
          left: context.dynamicMultiWidth(0.45),
          bottom: 4,
          child: CardWidget((widget.playerModel.handOpen && handlist[3].isOpen), getImage(3), (){
            addCard(3);
          },widget.compare),
        ),
        Positioned(
          left: context.dynamicMultiWidth(0.6),
          bottom: -1,
          child: CardWidget(
            (widget.playerModel.handOpen && handlist[4].isOpen),
            getImage(4),
                  (){
                addCard(4);
              },widget.compare
          ),
        ),
      ],
    );
  }
}
