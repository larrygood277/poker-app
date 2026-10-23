import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final String title;
  final Function onPressFunc;
  final double heightButton;
  final double widthButton;

  GradientButton(
      {required this.title,
       required this.endColor,
       required this.startColor,
       required this.onPressFunc,
       required this.heightButton,
       required this.widthButton,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightButton,
      width: widthButton,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [startColor, endColor],
          stops: [0.0, 1.0],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          onPressFunc();
        },
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
