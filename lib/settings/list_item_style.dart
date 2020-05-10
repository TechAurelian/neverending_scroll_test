import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/utils/color_utils.dart';
import 'package:neverendingscroll/utils/utils.dart';

class ListItemStyle {
  static const String _itemExtentDemoText = '1,000,000';

  /// Maximum item extent
  static const double _maxItemExtent = 200.0;

  // Content padding defaults
  static const double _defaultHorizontalPadding = 16.0;
  static const int _minPaddingFactor = 1;
  static const int _maxPaddingFactor = 5;

  static const _alignmentValues = [Alignment.centerLeft, Alignment.center, Alignment.centerRight];

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

//  double itemExtent;
  double itemExtent = 200.0;

  /// The text color
  Color _textColor;

  /// The content padding
  EdgeInsetsGeometry padding;

  /// The text alignment
  Alignment alignment;

  /// The text style
  TextStyle textStyle;

  void reset() {
    backColor = _textColor = padding = textStyle = alignment = null;
  }

  void shuffle() {
    // Shuffle background color
    backColor = _shuffleBackColor();

    // Shuffle content padding
//    double horizontalPadding =
//        _defaultHorizontalPadding * _random.nextIntInRange(_minPaddingFactor, _maxPaddingFactor);

//    double horizontalPadding = _random.doubleInRange(
//        _defaultHorizontalPadding, _defaultHorizontalPadding * _maxPaddingFactor);
//    padding = EdgeInsets.symmetric(horizontal: horizontalPadding);

    double leftPadding = _random.doubleInRange(0.0, 80.0);
    double rightPadding = _random.doubleInRange(0.0, 80.0);
    padding = EdgeInsets.only(left: leftPadding, right: rightPadding);
    print('$padding');

    // Shuffle text align
    alignment = _alignmentValues[_random.nextInt(_alignmentValues.length)];
    print('$alignment');

    // Shuffle text style and font features
    _textColor = _shuffleTextColor();
    final String fontFeature = _fontFeatures[_random.nextInt(_fontFeatures.length)];
    textStyle = _textStyles[_random.nextInt(_textStyles.length)].copyWith(
      color: _textColor,
      fontFeatures: [FontFeature(fontFeature)],
    );

    // Shuffle item extent
    final double minHeight = textStyle.calculateTextSize(_itemExtentDemoText).height;
    itemExtent = _random.doubleInRange(minHeight, _maxItemExtent);
    print('calc size: ${textStyle.calculateTextSize(_itemExtentDemoText)}');
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
