import 'package:flutter/material.dart';

import 'package:neverendingscroll/utils/color_utils.dart';

class DecimalBackColorListItem extends StatelessWidget {
  final int index;

  const DecimalBackColorListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color backColor = Color(index).withAlpha(0xFF);
    final Color textColor = backColor.contrastOf();
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return Material(
      color: backColor,
      child: ListTile(
//        contentPadding: EdgeInsets.all(40.0),
        title: Text(
          localizations.formatDecimal(index),
          style: TextStyle(color: textColor),
//              style: Theme.of(context).textTheme.display3.copyWith(color: textColor)),
        ),
        onTap: () {},
      ),
    );
  }
}
