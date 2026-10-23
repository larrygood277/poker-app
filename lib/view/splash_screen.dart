import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pokergame/store/deck_model.dart';
import 'package:pokergame/view/constants/context_extension.dart';
import 'package:pokergame/view/widgets/background_widget.dart';
import 'package:pokergame/view/widgets/gradient_button.dart';
import 'package:pokergame/view/widgets/textfield_custom.dart';
import 'package:toast/toast.dart';

import '../redux/actions.dart';
import '../redux/app_state.dart';
import 'constants/color.dart';
import 'constants/size.dart';
import 'constants/string_values.dart';
import 'game_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController player1 = new TextEditingController();
  TextEditingController player2 = new TextEditingController();

  playGame(){
    if (player1.text != "" && player2.text != ""&&player2.text!=player1.text) {
      StoreProvider.of<AppState>(context).dispatch(DefinePlayerNameAction(player1.text, player2.text),);
      StoreProvider.of<AppState>(context).dispatch(
        DistributeCardsAction(),
      );
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => GameScreen()), (route) => false);
    } else {
      Toast.show(StringValuesConstants.instance.enterName, duration: Toast.lengthShort, gravity: Toast.center);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundMain(
        bodyWidget: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: context.dynamicMultiHeight(0.2),
                width: context.dynamicMultiHeight(0.2),
                child: Image.asset(
                  'assets/logo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  width: context.dynamicMultiWidth(0.7),
                  height: context.dynamicMultiHeight(0.4),
                  padding: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.3), offset: Offset(0, 10), blurRadius: 20)]),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            style: Theme.of(context).textTheme.headline1,
                            keyboardType: TextInputType.text,
                            controller: player1,
                            textInputAction: TextInputAction.next,
                            decoration: TextFieldAuth().decoration(
                              context,
                              StringValuesConstants.instance.player1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            style: Theme.of(context).textTheme.headline1,
                            keyboardType: TextInputType.text,
                            controller: player2,
                            decoration: TextFieldAuth().decoration(
                              context,
                              StringValuesConstants.instance.player2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: PaddingConstants.instance.onlyTop,
                          child: GradientButton(
                              widthButton: context.dynamicMultiWidth(0.3),
                              heightButton: context.dynamicMultiHeight(0.07),
                              onPressFunc: playGame,
                              startColor: ColorConstants.instance.graStart,
                              endColor: ColorConstants.instance.graEnd,
                              title: StringValuesConstants.instance.startGame,
                            ),)
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
