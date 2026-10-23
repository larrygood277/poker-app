import 'package:flutter_test/flutter_test.dart';

import 'package:pokergame/redux/actions.dart';
import 'package:pokergame/redux/app_state.dart';
import 'package:pokergame/redux/reducer.dart';
import 'package:pokergame/store/card_model.dart';
import 'package:pokergame/store/deck_model.dart';
import 'package:pokergame/store/hand_model.dart';
import 'package:pokergame/store/player_model.dart';

void main() {
  test('Distrubition cards test', () {
    final distrubitionstate = PlayGame(
        AppState(players: [
          PlayerModel(
            playerChoosenCard: [],
            playerHand: HandModel(name: "", cardlist: []),
            playerName: "Player1",
            isWinner: false,
            handOpen: false,
          ),
          PlayerModel(
            playerChoosenCard: [],
            playerHand: HandModel(name: "", cardlist: []),
            playerName: "Player2",
            isWinner: false,
            handOpen: false,
          ),
        ], deckModel: DeckModel(deckList: AppStatic.generalList)),
        DistributeCardsAction());

    expect(distrubitionstate.deckModel.deckList.length, 42);
  });

  test('Define Player Name test', () {
    final nameState = PlayGame(
        AppState(players: PlayerModel.players, deckModel: DeckModel(deckList: AppStatic.generalList)),
        DefinePlayerNameAction("Player A", "Player B"));

    expect(nameState.players.first.playerName, "Player A");
  });

  test('Hand Name test', () {
    List<CardModel> hand = [
      CardModel(kind: "Spades", index: 14, isOpen: false),
      CardModel(kind: "Hearts", index: 14, isOpen: false),
      CardModel(kind: "Clubs", index: 14, isOpen: false),
      CardModel(kind: "Diamonds", index: 5, isOpen: false),
      CardModel(kind: "Spades", index: 5, isOpen: false)
    ];
    final nameState = defineHandName(
   hand
     );

    expect(nameState, "Full House");
  });

  test('Changing Hand Cards test', () {
    DeckModel deckModelInitial = DeckModel(deckList: AppStatic.generalList);
    //Hearts A-Spades A- Spades 4
    List<CardModel> hand = [
      CardModel(kind: "Spades", index: 14, isOpen: false),
      CardModel(kind: "Hearts", index: 14, isOpen: false),
      CardModel(kind: "Clubs", index: 7, isOpen: false),
      CardModel(kind: "Diamonds", index: 5, isOpen: false),
      CardModel(kind: "Spades", index: 2, isOpen: false)
    ];

    PlayerModel testPlayer = PlayerModel(
      playerChoosenCard: [CardModel(kind: "Diamonds", index: 5, isOpen: false), CardModel(kind: "Spades", index: 2, isOpen: false)],
      playerHand: HandModel(name: "Pair", cardlist: hand),
      playerName: "Player A",
      isWinner: false,
      handOpen: true,
    );
    deckModelInitial.deckList.removeRange(0, 5);
    for (var item in hand) {
      deckModelInitial.deckList.removeWhere((element) => element.index == item.index && element.kind == item.kind);
    }

    final changingState = PlayGame(
        AppState(players: [
          testPlayer,
          PlayerModel(
            playerChoosenCard: [],
            playerHand: HandModel(name: "", cardlist: []),
            playerName: "Player B",
            isWinner: false,
            handOpen: false,
          ),
        ], deckModel: DeckModel(deckList: deckModelInitial.deckList)),
        ChangeHandAction(testPlayer));

    expect(changingState.players.first.playerHand.cardlist.contains(CardModel(kind: "Spades", index: 2, isOpen: false)), false);
  });

  test('Show Hand Test', () {
    DeckModel deckModelInitial = DeckModel(deckList: AppStatic.generalList);
    //Hearts A-Spades A- Spades 4
    List<CardModel> hand1 = [
      CardModel(kind: "Spades", index: 14, isOpen: false),
      CardModel(kind: "Hearts", index: 14, isOpen: false),
      CardModel(kind: "Clubs", index: 7, isOpen: false),
      CardModel(kind: "Diamonds", index: 5, isOpen: false),
      CardModel(kind: "Spades", index: 2, isOpen: false)
    ];
    List<CardModel> hand2 = [
      CardModel(kind: "Spades", index: 13, isOpen: false),
      CardModel(kind: "Hearts", index: 11, isOpen: false),
      CardModel(kind: "Clubs", index: 5, isOpen: false),
      CardModel(kind: "Diamonds", index: 6, isOpen: false),
      CardModel(kind: "Spades", index: 3, isOpen: false)
    ];

    List<CardModel> handtotal = [];
    handtotal.addAll(hand1);
    handtotal.addAll(hand2);
    for (var item in handtotal) {
      deckModelInitial.deckList.removeWhere((element) => element.index == item.index && element.kind == item.kind);
    }

    final showHand = PlayGame(
        AppState(players: [
          PlayerModel(
            playerChoosenCard: [],
            playerHand: HandModel(name: "", cardlist: hand1),
            playerName: "Player A",
            isWinner: false,
            handOpen: false,
          ),
          PlayerModel(
            playerChoosenCard: [],
            playerHand: HandModel(name: "", cardlist: hand2),
            playerName: "Player B",
            isWinner: false,
            handOpen: false,
          ),
        ], deckModel: DeckModel(deckList: deckModelInitial.deckList)),
        ShowHandAction("Player A"));

    expect(showHand.players.first.playerHand.cardlist[2].isOpen, true);
  });

  test('Compare Hand test', () {
    DeckModel deckModelInitial = DeckModel(deckList: AppStatic.generalList);
    //Hearts A-Spades A- Spades 4
    List<CardModel> hand1 = [
      CardModel(kind: "Spades", index: 14, isOpen: false),
      CardModel(kind: "Hearts", index: 14, isOpen: false),
      CardModel(kind: "Clubs", index: 7, isOpen: false),
      CardModel(kind: "Diamonds", index: 5, isOpen: false),
      CardModel(kind: "Spades", index: 2, isOpen: false)
    ];
    List<CardModel> hand2 = [
      CardModel(kind: "Spades", index: 13, isOpen: false),
      CardModel(kind: "Hearts", index: 11, isOpen: false),
      CardModel(kind: "Clubs", index: 5, isOpen: false),
      CardModel(kind: "Diamonds", index: 6, isOpen: false),
      CardModel(kind: "Spades", index: 3, isOpen: false)
    ];
    List<CardModel> handtotal = [];
    handtotal.addAll(hand1);
    handtotal.addAll(hand2);
    for (var item in handtotal) {
      deckModelInitial.deckList.removeWhere((element) => element.index == item.index && element.kind == item.kind);
    }
    List<PlayerModel> players=[
      PlayerModel(
        playerChoosenCard: [],
        playerHand: HandModel(name: "", cardlist: hand1),
        playerName: "Player A",
        isWinner: false,
        handOpen: false,
      ),
      PlayerModel(
        playerChoosenCard: [],
        playerHand: HandModel(name: "", cardlist: hand2),
        playerName: "Player B",
        isWinner: false,
        handOpen: false,
      ),
    ];

    final winnerState = PlayGame(
        AppState(players: players, deckModel: DeckModel(deckList: deckModelInitial.deckList)),
        ComparePlayerAction(players));

    expect(winnerState.players.first.isWinner, true);
  });
}
