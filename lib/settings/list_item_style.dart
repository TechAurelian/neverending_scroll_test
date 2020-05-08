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

  // Font size defaults
  static const double _materialHeadline1FontSize = 96.0;
  static const double _materialHeadline2FontSize = 60.0;
  static const double _materialHeadline3FontSize = 48.0;
  static const double _materialHeadline4FontSize = 34.0;
  static const double _materialHeadline5FontSize = 24.0;
  static const double _materialHeadline6FontSize = 20.0;
  static const double _materialBodyText1FontSize = 16.0;
  static const double _materialBodyText2FontSize = 14.0;
  static const double _materialSubtitle1FontSize = 16.0;
  static const double _materialSubtitle2FontSize = 14.0;
  static const double _materialButtonFontSize = 14.0;
  static const double _materialCaptionFontSize = 12.0;
  static const double _materialOverlineFontSize = 10.0;

  static const _fontSizes = [
    _materialHeadline1FontSize,
    _materialHeadline2FontSize,
    _materialHeadline3FontSize,
    _materialHeadline4FontSize,
    _materialHeadline5FontSize,
    _materialHeadline6FontSize,
    _materialBodyText1FontSize,
    _materialBodyText2FontSize,
    _materialSubtitle1FontSize,
    _materialSubtitle2FontSize,
    _materialButtonFontSize,
    _materialCaptionFontSize,
    _materialOverlineFontSize
  ];

  static final _letterSpacings = [
    Typography.englishLike2018.display4.letterSpacing,
    Typography.englishLike2018.display3.letterSpacing,
    Typography.englishLike2018.display2.letterSpacing,
    Typography.englishLike2018.display1.letterSpacing,
    Typography.englishLike2018.headline.letterSpacing,
    Typography.englishLike2018.title.letterSpacing,
    Typography.englishLike2018.subhead.letterSpacing,
    Typography.englishLike2018.body2.letterSpacing,
    Typography.englishLike2018.body1.letterSpacing,
    Typography.englishLike2018.button.letterSpacing,
    Typography.englishLike2018.caption.letterSpacing,
    Typography.englishLike2018.subtitle.letterSpacing,
    Typography.englishLike2018.overline.letterSpacing,
  ];

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
  double letterSpacing;
  TextAlign textAlign;

  TextStyle textStyle;

  void shuffle() {
    // Shuffle background and text colors
    backColor = _shuffleBackColor();
    textColor = _shuffleTextColor();

    // Shuffle content padding
    _horizontalPadding =
        _defaultHorizontalPadding * _random.nextIntInRange(_minPaddingFactor, _maxPaddingFactor);
    _verticalPadding =
        _defaultVerticalPadding * _random.nextIntInRange(_minPaddingFactor, _maxPaddingFactor);

    // Shuffle text align
    textAlign = TextAlign.values[_random.nextInt(TextAlign.values.length)];

    // Shuffle font attributes
    fontSize = _fontSizes[_random.nextInt(_fontSizes.length)];
    fontWeight = FontWeight.values[_random.nextInt(FontWeight.values.length)];
    letterSpacing = _letterSpacings[_random.nextInt(_letterSpacings.length)];

    textStyle = _textStyles[_random.nextInt(_textStyles.length)];
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
