import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neverendingscroll/settings/list_item_style.dart';

import 'package:neverendingscroll/utils/color_utils.dart';

enum BackColorStyle { white, black, colorIndex, random }
enum TextColorStyle { contrast, random }

class DecimalRandomBackColorListItem extends StatelessWidget {
  final int index;
  final ListItemStyle listItemStyle;

//  final BackColorStyle backColorStyle;
//  final TextColorStyle textColorStyle;
//  final double fontSize;
//  final double contentPadding;

  const DecimalRandomBackColorListItem(
    this.index, {
    Key key,
    @required this.listItemStyle,
//      this.backColorStyle = BackColorStyle.white,
//      this.textColorStyle = TextColorStyle.contrast,
//      this.fontSize = 16.0,
//      this.contentPadding = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

//    Color backColor;
//    switch (backColorStyle) {
//      case BackColorStyle.white:
//        backColor = Colors.white;
//        break;
//      case BackColorStyle.black:
//        backColor = Colors.black;
//        break;
//      case BackColorStyle.colorIndex:
//        backColor = Color(index).withAlpha(0xFF);
//        break;
//      case BackColorStyle.random:
//        backColor = Color(random.nextInt(0xFFFFFF)).withAlpha(0xFF);
//        break;
//    }

//    Color textColor;
//
//    switch (textColorStyle) {
//      case TextColorStyle.contrast:
//        textColor = backColor.contrastOf();
//        break;
//      case TextColorStyle.random:
//        textColor = Color(random.nextInt(0xFFFFFF)).withAlpha(0xFF);
//        break;
//    }

//    final Color backColor = Color(random.nextInt(0xFFFFFF)).withAlpha(0xFF);
//    final Color textColor = backColor.contrastOf();
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return Material(
      color: listItemStyle.backColor,
      child: ListTile(
//        contentPadding: EdgeInsets.symmetric(vertical: listItemStyle.contentPadding, horizontal: 16.0),
        contentPadding: EdgeInsets.all(listItemStyle.contentPadding),
        title: Text(
          localizations.formatDecimal(index),
          textAlign: listItemStyle.textAlign,
          style: TextStyle(
//            color: textColor,
            color: listItemStyle.backColor.contrastOf(),
            fontSize: listItemStyle.fontSize,
            fontWeight: listItemStyle.fontWeight,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
