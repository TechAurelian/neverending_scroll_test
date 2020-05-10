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
      child: ListWheelScrollView.useDelegate(
//      diameterRatio: 10,
        diameterRatio: 100000,
        itemExtent: listItemStyle.itemExtent,
        controller: scrollController,
        onSelectedItemChanged: (_) {},
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) => Container(
            padding: listItemStyle.padding,
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
