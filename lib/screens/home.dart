import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/common/app_strings.dart';
import 'package:neverendingscroll/settings/list_item_style.dart';
import 'package:neverendingscroll/widgets/index_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random random = Random();
  final ListItemStyle listItemStyle = ListItemStyle();

  void _shuffleStyles() {
    setState(() {
      listItemStyle.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: _shuffleStyles,
          )
        ],
      ),
      body: Material(
        color: listItemStyle.backColor,
        child: InkWell(

          child: ListView.builder(
            itemBuilder: (context, index) => IndexListItem(
              index,
              listItemStyle: listItemStyle,
            ),
          ),
        ),
      ),
    );
  }
}
