import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import '../utils/utils.dart';

class ListItemStyle {
  static const String _itemExtentDemoText = '1,000,000';

  /// Maximum item extent
  // static const double _maxItemExtent = 200.0;

  // Content padding defaults
  static const double _defaultPadding = 16.0;
  static const double _minHorizontalPadding = 0.0;
  static const double _maxHorizontalPadding = 16.0 * 5;

  static const _alignmentValues = [Alignment.centerLeft, Alignment.center, Alignment.centerRight];

  /// Available text styles (from [Typography.englishLike2018])
  static final _textStyles = [
    Typography.englishLike2021.displayLarge,
    Typography.englishLike2021.displayMedium,
    Typography.englishLike2021.displaySmall,
    Typography.englishLike2021.headlineLarge,
    Typography.englishLike2021.headlineMedium,
    Typography.englishLike2021.headlineSmall,
    Typography.englishLike2021.titleLarge,
    Typography.englishLike2021.titleMedium,
    Typography.englishLike2021.titleSmall,
    Typography.englishLike2021.labelLarge,
    Typography.englishLike2021.labelMedium,
    Typography.englishLike2021.labelSmall,
    Typography.englishLike2021.bodyLarge,
    Typography.englishLike2021.bodyMedium,
    Typography.englishLike2021.bodySmall,
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
  Color? backColor;

  /// The item extent
  double? itemExtent;

  /// The content padding
  EdgeInsetsGeometry? padding;

  /// The text alignment
  Alignment? alignment;

  /// The text style
  TextStyle? textStyle;

  void reset() {
//    backColor = padding = textStyle = alignment = null;
    backColor = textStyle = null;

    alignment = _alignmentValues[0];
    padding = const EdgeInsets.symmetric(horizontal: _defaultPadding);

    final double textHeight =
        textStyle != null ? textStyle!.calculateTextSize(_itemExtentDemoText).height : 100.0;
    itemExtent = textHeight + _defaultPadding * 2;
  }

  void shuffle() {
    // Shuffle background color
    backColor = _shuffleBackColor();

    // Shuffle text align
    alignment = _alignmentValues[_random.nextInt(_alignmentValues.length)];

    // Shuffle padding
    double horizontalPadding = _random.doubleInRange(_minHorizontalPadding, _maxHorizontalPadding);
    padding = alignment == Alignment.centerLeft
        ? EdgeInsets.only(left: horizontalPadding)
        : alignment == Alignment.centerRight
            ? EdgeInsets.only(right: horizontalPadding)
            : null;
    padding = EdgeInsets.all(horizontalPadding);

    // Shuffle text style and font features
    Color textColor = _shuffleTextColor();
    final String fontFeature = _fontFeatures[_random.nextInt(_fontFeatures.length)];
    textStyle = _textStyles[_random.nextInt(_textStyles.length)]!.copyWith(
      color: textColor,
      fontFeatures: [FontFeature(fontFeature)],
    );

    // Shuffle item extent
//    final double minHeight = textStyle.calculateTextSize(_itemExtentDemoText).height;
//    itemExtent = _random.doubleInRange(minHeight, _maxItemExtent);
    itemExtent = _random.doubleInRange(100, 200);
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
      ([Colors.white, Colors.black].contains(backColor) && _random.nextBool()) ||
              (backColor == null)
          ? ColorX.randomPrimary(_random)
          : backColor!.contrastOf();
}
