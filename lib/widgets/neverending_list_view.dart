import 'package:flutter/material.dart';
import 'package:neverendingscroll/settings/list_item_style.dart';

class NeverendingListView extends StatelessWidget {
  final ListItemStyle listItemStyle;

  const NeverendingListView({Key key, @required this.listItemStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return Material(
      color: listItemStyle.backColor,
      child: InkWell(
        child: ListTileTheme(
          textColor: listItemStyle.textColor,
          contentPadding: listItemStyle.contentPadding,
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(
                localizations.formatDecimal(index),
                textAlign: listItemStyle.textAlign,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: listItemStyle.textStyle,
              ),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
