import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/utils/color_utils.dart';

class ListItemStyle {
  final Random random = Random();

  Color backColor;

  Color textColor;

  double fontSize;
  double contentPadding;
  FontWeight fontWeight;
  TextAlign textAlign;

  void shuffle() {
    backColor = _shuffleBackColor();
    textColor = backColor.contrastOf();

    fontSize = random.nextInt(48).toDouble() + 14.0;
    contentPadding = random.nextInt(48) + 16.0;
//    contentPadding = random.nextInt(33) + 16.0;
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
        return ColorX.randomPrimary(random);
    }
  }
}
