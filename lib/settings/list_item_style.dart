import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/utils/color_utils.dart';

class ListItemStyle {
  final Random random = Random();

//  BackColorStyle backColorStyle;
//  TextColorStyle textColorStyle;
  Color backColor;
  double fontSize;
  double contentPadding;
  FontWeight fontWeight;
  TextAlign textAlign;

  void shuffle() {
//    backColorStyle = BackColorStyle.values[random.nextInt(BackColorStyle.values.length)];
//    textColorStyle = TextColorStyle.values[random.nextInt(TextColorStyle.values.length)];
    backColor = _shuffleBackColor();

    fontSize = random.nextInt(48).toDouble() + 12.0;
//    contentPadding = random.nextInt(40).toDouble();
    contentPadding = random.nextInt(40) + 16.0;
    fontWeight = FontWeight.values[random.nextInt(FontWeight.values.length)];
    textAlign = TextAlign.values[random.nextInt(TextAlign.values.length)];
  }

  Color _shuffleBackColor() {
    switch (random.nextInt(3)) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.black;
      default:
//        return ColorX.random(random);
        return ColorX.randomPrimary(random);
//        return Colors.red;
    }
  }
}
