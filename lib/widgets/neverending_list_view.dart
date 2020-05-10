import 'package:flutter/material.dart';
import 'package:neverendingscroll/settings/list_item_style.dart';

class NeverendingListView extends StatelessWidget {
  final ListItemStyle listItemStyle;
  final ScrollController scrollController;

  NeverendingListView({Key key, @required this.listItemStyle, @required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return Material(
      color: listItemStyle.backColor,
      child: ListView.builder(
        itemExtent: listItemStyle.itemExtent,
//        itemExtent: 100.0,
        controller: scrollController,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: listItemStyle.alignment,
            child: Text(
              localizations.formatDecimal(index),
              softWrap: false,
              overflow: TextOverflow.fade,
              style: listItemStyle.textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
