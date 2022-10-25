import 'package:flutter/material.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../settings/list_item_style.dart';

class NeverendingListView extends StatelessWidget {
  final ListItemStyle listItemStyle;

//  final ScrollController scrollController;
  final ItemScrollController itemScrollController;
  final int initialScrollIndex;
  final ItemPositionsListener? itemPositionsListener;

//  NeverendingListView({Key key, @required this.listItemStyle, @required this.scrollController})
  const NeverendingListView(
      {super.key,
      required this.listItemStyle,
      required this.itemScrollController,
      this.initialScrollIndex = 0,
      this.itemPositionsListener});

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return Material(
      color: listItemStyle.backColor,
      child:
//      ListWheelScrollView.useDelegate(
          ScrollablePositionedList.builder(
        itemCount: 1000000,

//        initialScrollIndex: 500000,
        initialScrollIndex: initialScrollIndex,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
//      diameterRatio: 10,
//        diameterRatio: 100000,
//        itemExtent: listItemStyle.itemExtent,
//        itemExtent: 100,
//        controller: scrollController,
//        onSelectedItemChanged: (_) {},
//        childDelegate: ListWheelChildBuilderDelegate(
//          builder: (context, index) => Container(
        itemBuilder: (context, index) => Container(
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
    );
  }
}
