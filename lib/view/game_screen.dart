import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pokergame/store/deck_model.dart';
import 'package:pokergame/store/player_model.dart';
import 'package:pokergame/view/constants/context_extension.dart';
import 'package:pokergame/view/splash_screen.dart';
import 'package:pokergame/view/widgets/background_widget.dart';
import 'package:pokergame/view/widgets/gradient_button.dart';
import 'package:pokergame/view/widgets/hand_widget.dart';

import '../main.dart';
import '../redux/actions.dart';
import '../redux/app_state.dart';
import 'constants/color.dart';
import 'constants/size.dart';
import 'constants/string_values.dart';

class GameScreen extends StatefulWidget {
  const GameScreen();

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundMain(
      bodyWidget: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, stateModel) => Column(
                children: <Widget>[
                  SizedBox(
                    width: context.dynamicMultiWidth(0.95),
                    height: context.dynamicMultiHeight(0.15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: context.dynamicMultiHeight(0.14),
                          width: context.dynamicMultiHeight(0.1),
                          child: Image.asset(
                            'assets/deck.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(StringValuesConstants.instance.deck + "\n"+ stateModel.deckModel.deckList.length.toString(),
                            style: Theme.of(context).textTheme.headline3),
                        Padding(
                          padding: PaddingConstants.instance.onlyTop,
                          child: GradientButton(
                            widthButton: context.dynamicMultiWidth(0.35),
                            heightButton: context.dynamicMultiHeight(0.06),
                            onPressFunc: () {
                              StoreProvider.of<AppState>(context).dispatch(
                                ComparePlayerAction(stateModel.players),
                              );
                            },
                            startColor: ColorConstants.instance.graStart2,
                            endColor: ColorConstants.instance.blueColor,
                            title: StringValuesConstants.instance.compHand,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            StoreProvider.of<AppState>(context).dispatch(
                              Replay(),
                            );
                            StoreProvider.of<AppState>(context).dispatch(
                              DistributeCardsAction(),
                            );
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SplashScreen()));
                          },
                          child: Container(
                            width: context.dynamicMultiWidth(0.1),
                            height: context.dynamicMultiHeight(0.05),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [ColorConstants.instance.graStart2,ColorConstants.instance.graEnd2 ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: Icon(
                              Icons.replay,
                              size: Sizes.iconSizeMax,
                              color: ColorConstants.instance.blueColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: stateModel.players.first.isWinner == false && stateModel.players[1].isWinner == false,
                    child: SizedBox(
                      width: context.dynamicMultiWidth(0.95),
                      height: context.dynamicMultiHeight(0.1),
                      child: Column(
                        children: [
                          Visibility(
                            visible: !stateModel.players.first.handOpen,
                            child: showCards(stateModel.players.first.playerName, () {
                              if (stateModel.players.first.playerChoosenCard.isNotEmpty) {
                                if (stateModel.players.first.playerChoosenCard.first.index != 0) {
                                  StoreProvider.of<AppState>(context).dispatch(
                                    ShowHandAction(stateModel.players.first.playerName),
                                  );
                                }
                              } else {
                                StoreProvider.of<AppState>(context).dispatch(
                                  ShowHandAction(stateModel.players.first.playerName),
                                );
                              }
                            }),
                          ),
                          Visibility(
                            visible: stateModel.players.first.handOpen,
                            child: chooseCard(stateModel.players.first.playerHand.name, () {
                              StoreProvider.of<AppState>(context).dispatch(
                                ChangeHandAction(stateModel.players.first),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: stateModel.players.first.isWinner == true || stateModel.players[1].isWinner == true,
                    child: SizedBox(
                      width: context.dynamicMultiWidth(0.95),
                      height: context.dynamicMultiHeight(0.05),
                      child: nameandHandName(stateModel.players.first.playerHand.name, stateModel.players.first.playerName),
                    ),
                  ),
                  SizedBox(
                    width: context.dynamicMultiWidth(0.95),
                    height: context.dynamicMultiHeight(0.25),
                    child: Padding(
                      padding: PaddingConstants.instance.onlyBottom,
                      child: HandWidget(stateModel.players.first,stateModel.players.first.isWinner == true || stateModel.players[1].isWinner == true,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: stateModel.players.first.isWinner != false || stateModel.players[1].isWinner != false,
                    child: SizedBox(
                      width: context.dynamicMultiWidth(0.95),
                      height: context.dynamicMultiHeight(0.07),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(getWinnerString(stateModel.players) + "  " + StringValuesConstants.instance.winner,
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: stateModel.players.first.isWinner == false && stateModel.players[1].isWinner == false,
                    child: SizedBox(
                      width: context.dynamicMultiWidth(0.95),
                      height: context.dynamicMultiHeight(0.1),
                      child: Padding(
                        padding: PaddingConstants.instance.onlyTopMin,
                        child: Column(
                          children: [
                            Visibility(
                              visible: !stateModel.players[1].handOpen,
                              child: showCards(stateModel.players[1].playerName, () {
                                if (stateModel.players[1].playerChoosenCard.isNotEmpty) {
                                  if (stateModel.players[1].playerChoosenCard.first.index != 0) {
                                    StoreProvider.of<AppState>(context).dispatch(
                                      ShowHandAction(stateModel.players[1].playerName),
                                    );
                                  }
                                } else {
                                  StoreProvider.of<AppState>(context).dispatch(
                                    ShowHandAction(stateModel.players[1].playerName),
                                  );
                                }
                              }),
                            ),
                            Visibility(
                              visible: stateModel.players[1].handOpen,
                              child: chooseCard(stateModel.players[1].playerHand.name, () {
                                StoreProvider.of<AppState>(context).dispatch(
                                  ChangeHandAction(stateModel.players[1]),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: stateModel.players.first.isWinner == true || stateModel.players[1].isWinner == true,
                    child: SizedBox(
                      width: context.dynamicMultiWidth(0.95),
                      height: context.dynamicMultiHeight(0.1),
                      child: nameandHandName(stateModel.players[1].playerHand.name, stateModel.players[1].playerName),
                    ),
                  ),
                  SizedBox(
                    width: context.dynamicMultiWidth(0.95),
                    height: context.dynamicMultiHeight(0.25),
                    child: HandWidget(stateModel.players[1],stateModel.players.first.isWinner == true || stateModel.players[1].isWinner == true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget chooseCard(String handName, Function tap) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("Hand: " + handName + "\n" + StringValuesConstants.instance.chooseCard, style: Theme.of(context).textTheme.headline2),
        Padding(
          padding: PaddingConstants.instance.onlyTop,
          child: GradientButton(
            widthButton: context.dynamicMultiWidth(0.4),
            heightButton: context.dynamicMultiHeight(0.05),
            onPressFunc: tap,
            startColor: ColorConstants.instance.button,
            endColor: ColorConstants.instance.button,
            title: StringValuesConstants.instance.changeCards,
          ),
        ),
      ],
    );
  }

  Widget nameandHandName(String handName, String name) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("Player :  $name", style: Theme.of(context).textTheme.headline2),
        Text("Hand: $handName", style: Theme.of(context).textTheme.headline2),
      ],
    );
  }

  Widget showCards(String name, Function tap) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(name, style: Theme.of(context).textTheme.headline3),
        Padding(
          padding: PaddingConstants.instance.onlyTop,
          child: GradientButton(
            widthButton: context.dynamicMultiWidth(0.4),
            heightButton: context.dynamicMultiHeight(0.05),
            onPressFunc: tap,
            startColor: ColorConstants.instance.graStart2,
            endColor: ColorConstants.instance.graEnd2,
            title: StringValuesConstants.instance.showhand,
          ),
        ),
      ],
    );
  }

  Widget cardWidget() {
    return FlipCard(
      fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        height: context.dynamicMultiWidth(0.2),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.instance.accentColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(
          right: 2,
        ),
        child: Image.asset(
          'assets/Clubs2.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
      back: Container(
        width: context.dynamicMultiWidth(0.3),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.instance.backgroudColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(
          right: 2,
        ),
        child: Image.asset(
          'assets/back_card.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  String getWinnerString(List<PlayerModel> players) {
    String winner = "";
    if (players.first.isWinner && players[1].isWinner == false) {
      winner = players.first.playerName;
    } else if (players.first.isWinner == false && players[1].isWinner) {
      winner = players[1].playerName;
    } else {
      winner = "No one ";
    }
    return winner;
  }
}
