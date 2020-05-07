import 'dart:math';

import 'package:flutter/material.dart';

import 'package:neverendingscroll/utils/color_utils.dart';

class DecimalTextColorListItem extends StatelessWidget {
  final int index;

  const DecimalTextColorListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
//    final Color textColor = Color(index).withAlpha(0xFF);
//    final Color textColor = Color(random.nextInt(index)).withAlpha(0xFF);
    final Color textColor = Color(random.nextInt(0xFFFFFF)).withAlpha(0xFF);
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return ListTile(
//        contentPadding: EdgeInsets.all(40.0),
      title: Text(
        localizations.formatDecimal(index),
        style: TextStyle(color: textColor),
//              style: Theme.of(context).textTheme.display3.copyWith(color: textColor)),
      ),
      onTap: () {},
    );
  }
}
