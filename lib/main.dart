import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pokergame/redux/app_state.dart';
import 'package:pokergame/redux/reducer.dart';
import 'package:pokergame/store/deck_model.dart';
import 'package:pokergame/store/player_model.dart';
import 'package:pokergame/view/constants/theme.dart';
import 'package:pokergame/view/splash_screen.dart';
import 'package:redux/redux.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final Store<AppState> _store = Store<AppState>(
    PlayGame,
    initialState: AppState(
      deckModel: DeckModel(deckList: AppStatic.generalList),
      players: PlayerModel.players
    ),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: _store,
      child: MaterialApp(
        theme: AppTheme().theme,
        debugShowCheckedModeBanner: false,
        title: 'Poker Game',
        home:  SplashScreen()
      ),
    );
  }
}
