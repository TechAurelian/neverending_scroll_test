import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/common/app_strings.dart';
import 'package:neverendingscroll/settings/list_item_style.dart';
import 'package:neverendingscroll/widgets/neverending_list_view.dart';

/// Overflow menu items enumeration.
enum OverflowMenuItem { settings, rate, help }

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
//        title: Text('${listItemStyle.fontFeature}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.style),
            onPressed: _shuffleStyles,
          ),
          PopupMenuButton<OverflowMenuItem>(
            itemBuilder: (_) => [
              PopupMenuItem(
                value: OverflowMenuItem.settings,
                child: Text(AppStrings.settingsMenuItem),
              ),
              PopupMenuItem(
                value: OverflowMenuItem.rate,
                child: Text(AppStrings.rateAppMenuItem),
              ),
              PopupMenuItem(
                value: OverflowMenuItem.help,
                child: Text(AppStrings.helpMenuItem),
              ),
            ],
          )
        ],
      ),
      body: NeverendingListView(
        listItemStyle: listItemStyle,
      ),
    );
  }
}
