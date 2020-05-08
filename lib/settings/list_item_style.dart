import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/utils/color_utils.dart';
import 'package:neverendingscroll/utils/utils.dart';

class ListItemStyle {
  // Content padding defaults
  static const double _defaultHorizontalPadding = 16.0;
  static const double _defaultVerticalPadding = 12.0;
  static const int _minPaddingFactor = 1;
  static const int _maxPaddingFactor = 5;

  /// Available text styles (from [Typography.englishLike2018])
  static final _textStyles = [
    Typography.englishLike2018.display4,
    Typography.englishLike2018.display3,
    Typography.englishLike2018.display2,
    Typography.englishLike2018.display1,
    Typography.englishLike2018.headline,
    Typography.englishLike2018.title,
    Typography.englishLike2018.subhead,
    Typography.englishLike2018.body2,
    Typography.englishLike2018.body1,
    Typography.englishLike2018.button,
    Typography.englishLike2018.caption,
    Typography.englishLike2018.subtitle,
    Typography.englishLike2018.overline,
  ];

  /// Available font features
  ///
  /// [List source](https://github.com/googlefonts/roboto/blob/master/scripts/subset_for_web.py)
  static const _fontFeatures = [
    'c2sc',
    'ccmp',
    'cpsp',
    'dlig',
    'dnom',
    'frac',
    'kern',
    'liga',
    'lnum',
    'locl',
    'numr',
    'onum',
    'pnum',
    'smcp',
    'ss01',
    'ss02',
    'ss03',
    'ss04',
    'ss05',
    'ss06',
    'ss07',
    'tnum'
  ];

  final Random _random = Random();

  /// The background color
  Color backColor;

  /// The text color
  Color textColor;

  /// The content padding
  EdgeInsetsGeometry contentPadding;

  /// The text align
  TextAlign textAlign;

  /// The text style
  TextStyle textStyle;

  void reset() {
    backColor = textColor = contentPadding = textAlign = textStyle = null;
//    backColor = _defaultBackColor;
//    backColor = null;
//    textColor = _defaultBackColor.contrastOf();
//    textColor = null;
//    contentPadding = null;
//    textAlign = null;
//    textStyle = null;
  }

  void shuffle() {
    // Shuffle background and text colors
    backColor = _shuffleBackColor();
    textColor = _shuffleTextColor();

    // Shuffle content padding
    double horizontalPadding =
        _defaultHorizontalPadding * _random.nextIntInRange(_minPaddingFactor, _maxPaddingFactor);
    double verticalPadding =
        _defaultVerticalPadding * _random.nextIntInRange(_minPaddingFactor, _maxPaddingFactor);
    contentPadding = EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding);

    // Shuffle text align
    textAlign = TextAlign.values[_random.nextInt(TextAlign.values.length)];

    // Shuffle text style and font features
    final String fontFeature = _fontFeatures[_random.nextInt(_fontFeatures.length)];
    textStyle = _textStyles[_random.nextInt(_textStyles.length)]
        .copyWith(fontFeatures: [FontFeature(fontFeature)]);
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
