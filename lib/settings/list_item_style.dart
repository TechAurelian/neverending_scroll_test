import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/utils/color_utils.dart';
import 'package:neverendingscroll/utils/utils.dart';

class ListItemStyle {
  // The minimum font size
  static const int _minFontSize = 14;
  static const int _maxFontSizeFactor = 4;

  final Random _random = Random();

  /// The background color
  Color backColor;

  /// The text color
  Color textColor;

  double fontSize;

  double _horizontalPadding;
  double _verticalPadding;

  EdgeInsetsGeometry get contentPadding =>
      EdgeInsets.symmetric(horizontal: _horizontalPadding, vertical: _verticalPadding);

  FontWeight fontWeight;
  TextAlign textAlign;

  void shuffle() {
    // Shuffle background and text colors
    backColor = _shuffleBackColor();
    textColor = _shuffleTextColor();

//    _horizontalPadding = _random.nextInt(48) + 16.0;
//    _horizontalPadding = 16.0 * _random.nextInt(5);
    _horizontalPadding = _random.nextIntInRange(16, 16 * 4).toDouble();

//    _verticalPadding = _random.nextInt(48) + 16.0;
//    _verticalPadding = 12.0 * _random.nextInt(5);
    _verticalPadding = _random.nextIntInRange(12, 12 * 4).toDouble();

//    fontSize = _random.nextInt(48).toDouble() + 14.0;
    fontSize = _random.nextIntInRange(_minFontSize, _minFontSize * _maxFontSizeFactor).toDouble();

    //    contentPadding = random.nextInt(33) + 16.0;
    fontWeight = FontWeight.values[_random.nextInt(FontWeight.values.length)];
    textAlign = TextAlign.values[_random.nextInt(TextAlign.values.length)];
  }

  Color _shuffleBackColor() {
    switch (_random.nextInt(3)) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.black;
      default:
        return ColorX.randomPrimary(_random);
    }
  }

  Color _shuffleTextColor() =>
      [Colors.white, Colors.black].contains(backColor) && _random.nextBool()
          ? ColorX.randomPrimary(_random)
          : backColor.contrastOf();
}
