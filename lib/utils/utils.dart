import 'dart:math';

import 'dart:ui';

import 'package:flutter/cupertino.dart';

extension RandomX on Random {
  int nextIntInRange(int min, int max) => min + nextInt(max - min);

  double doubleInRange(double min, double max) => nextDouble() * (max - min) + min;
}

extension TextStyleX on TextStyle {
  Size calculateTextSize(String text) {
    final TextPainter painter = TextPainter()..textDirection = TextDirection.ltr;
    painter.text = TextSpan(text: text, style: this);
    painter.layout();
    return Size(painter.width, painter.height);
  }
}
