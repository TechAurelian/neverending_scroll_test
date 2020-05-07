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

    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(listItemStyle.contentPadding),
          title: Text(
            localizations.formatDecimal(index),
            textAlign: listItemStyle.textAlign,
            style: TextStyle(
              color: listItemStyle.textColor,
              fontSize: listItemStyle.fontSize,
              fontWeight: listItemStyle.fontWeight,
            ),
          ),
          onTap: () {},
        ),
        Divider(
//          color: listItemStyle.textColor.withAlpha(0x33),
//          color: listItemStyle.textColor.withAlpha(0x22),
        ),
      ],
    );
  }
}
