import 'package:flutter/material.dart';
import 'package:pokergame/view/constants/color.dart';
import 'package:pokergame/view/constants/context_extension.dart';

class BackgroundMain extends StatelessWidget {
  final Widget bodyWidget;
   BackgroundMain({required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicMultiWidth(1),
      height: context.dynamicHeight(1),
      color: ColorConstants.instance.backgroudColor,
      child: bodyWidget,
    );
  }
}
