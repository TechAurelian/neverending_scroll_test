import 'dart:math';

import 'package:flutter/material.dart';

import 'package:neverendingscroll/utils/color_utils.dart';

class DecimalRandomBackColorListItem extends StatelessWidget {
  final int index;

  const DecimalRandomBackColorListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final Color backColor = Color(random.nextInt(0xFFFFFF)).withAlpha(0xFF);
    final Color textColor = backColor.contrastOf();
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return Material(
      color: backColor,
      child: ListTile(
//        contentPadding: EdgeInsets.all(10.0),
        title: Text(
          localizations.formatDecimal(index),
          style: TextStyle(color: textColor),
//            style: TextStyle(color: textColor, fontWeight: FontWeight.w900, fontSize: 24.0),
//            style: Theme.of(context).textTheme.subhead.copyWith(color: textColor),
        ),
        onTap: () {},
      ),
    );
  }
}
