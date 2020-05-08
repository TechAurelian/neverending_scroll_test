import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neverendingscroll/settings/list_item_style.dart';

class IndexListItem extends StatelessWidget {
  final int index;
  final ListItemStyle listItemStyle;

  const IndexListItem(
    this.index, {
    Key key,
    @required this.listItemStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return ListTile(
      title: Text(
        localizations.formatDecimal(index),
        textAlign: listItemStyle.textAlign,
        style: TextStyle(
            fontSize: listItemStyle.fontSize,
            fontWeight: listItemStyle.fontWeight,
            fontFeatures: [
//              FontFeature.tabularFigures(),
//              FontFeature.oldstyleFigures(),
//              FontFeature.stylisticSet(6),
              FontFeature('c2sc')
            ]),
      ),
      onTap: () {},
    );
  }
}
