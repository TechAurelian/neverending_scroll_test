import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/common/app_strings.dart';
import 'package:neverendingscroll/settings/list_item_style.dart';
import 'package:neverendingscroll/widgets/listitems/decimal_backcolor.dart';
import 'package:neverendingscroll/widgets/listitems/decimal_random_backcolor.dart';
import 'package:neverendingscroll/widgets/listitems/decimal_textcolor.dart';

//class HomeScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(AppStrings.appName),
//      ),
//      body: ListView.builder(
////        itemBuilder: (context, index) => DecimalBackColorListItem(index),
//        itemBuilder: (context, index) => DecimalRandomBackColorListItem(index),
////        itemBuilder: (context, index) => DecimalTextColorListItem(index),
//      ),
//    );
//  }
//}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random random = Random();
  final ListItemStyle listItemStyle = ListItemStyle();

//  BackColorStyle backColorStyle;
//  TextColorStyle textColorStyle;
//  double fontSize;
//  double contentPadding;
//  FontWeight fontWeight;

  void _shuffleStyles() {
    setState(() {
//      backColorStyle = BackColorStyle.values[random.nextInt(BackColorStyle.values.length)];
//      textColorStyle = TextColorStyle.values[random.nextInt(TextColorStyle.values.length)];
//      fontSize = random.nextInt(48).toDouble() + 12.0;
//      contentPadding = random.nextInt(40).toDouble();
//      fontWeight = FontWeight.values[random.nextInt(FontWeight.values.length)];
      listItemStyle.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: _shuffleStyles,
          )
        ],
      ),
      body: ListView.builder(
//        itemBuilder: (context, index) => DecimalBackColorListItem(index),
        itemBuilder: (context, index) => DecimalRandomBackColorListItem(
          index,
          listItemStyle: listItemStyle,
//          backColorStyle: backColorStyle,
//          textColorStyle: textColorStyle,
//          fontSize: fontSize,
//          contentPadding: contentPadding,
        ),
//        itemBuilder: (context, index) => DecimalTextColorListItem(index),
      ),
    );
  }
}
