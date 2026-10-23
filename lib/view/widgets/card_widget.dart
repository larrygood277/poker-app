import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokergame/view/constants/context_extension.dart';

import '../constants/color.dart';

class CardWidget extends StatefulWidget {
  bool onTouch=false;
  String image;
  Function chooseCard;
  bool compare;
   CardWidget(this.onTouch,this.image,this.chooseCard,this.compare);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return  FlipCard(
        flipOnTouch:widget.onTouch ,
        onFlip: (){
          widget.chooseCard();
        },
        fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        front:  Container(
          width:context.dynamicMultiWidth(0.3),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConstants.instance.backgroudColor,width: 0,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.only(right: 2,),
          child: Image.asset(
            widget.image,
            fit: BoxFit.fitHeight,
          ),
        ),
        back:Container(
          width:context.dynamicMultiWidth(0.3),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConstants.instance.accentColor
              ,width: 3,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.only(right: 2,),
          child: Image.asset(
            widget.compare?widget.image:'assets/back_card.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      );
  }
}
