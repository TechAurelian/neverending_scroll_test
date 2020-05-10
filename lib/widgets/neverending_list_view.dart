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
//      child: ListView.builder(
      child: ListWheelScrollView.useDelegate(


        diameterRatio: 10,
//      perspective: 0.0000000001,
        itemExtent: listItemStyle.itemExtent,
//squeeze: 10,
//offAxisFraction: -0.5,

//        itemExtent: 100.0,
        controller: scrollController,
//        itemBuilder: (context, index) => InkWell(
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) => InkWell(
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
      ),
    );
  }
}
