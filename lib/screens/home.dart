import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neverendingscroll/common/app_strings.dart';
import 'package:neverendingscroll/settings/list_item_style.dart';
import 'package:neverendingscroll/settings/settings_provider.dart';
import 'package:neverendingscroll/widgets/neverending_list_view.dart';

/// Overflow menu items enumeration.
enum OverflowMenuItem { reset, settings, rate, help }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final ListItemStyle _listItemStyle = ListItemStyle();
  FixedExtentScrollController _scrollController = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    initScrollController();
    _listItemStyle.reset();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      SettingsProvider.setSelectedItem(_scrollController.selectedItem);
      print('$state - selected item: ${_scrollController.selectedItem}');
    }
  }

  Future<void> initScrollController() async {
    final int previousSelectedItem = await SettingsProvider.getSelectedItem();
    _scrollController.jumpToItem(previousSelectedItem);
    print(
        'init - previous selected item: $previousSelectedItem - current selected item ${_scrollController.selectedItem}');
  }

  void _shuffleStyles() {
    int curSelectedItem = _scrollController.selectedItem;
//    setState(() {
//      _listItemStyle.shuffle();
//    });
    setState(() {
//      int curSelectedItem = _scrollController.selectedItem;
      _listItemStyle.shuffle();
//      _scrollController.jumpToItem(curSelectedItem);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout(curSelectedItem));
  }

  void _updateStyles(Function fn) {
//    int curSelectedItem = _scrollController.selectedItem;
    setState(() {
      fn();
    });
//    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout(curSelectedItem));
  }

  afterFirstLayout(int index) {
    setState(() {
      _scrollController.jumpToItem(index);
    });

//    _scrollController.jumpToItem(index);
//    print('currentSelectedItem after jump: ${_scrollController.selectedItem}');
  }

  /// Performs the tasks of the overflow menu items.
  void popupMenuSelection(OverflowMenuItem item) {
    switch (item) {
      case OverflowMenuItem.reset:
        _updateStyles(() {
          _listItemStyle.reset();
        });

//        setState(() {
//          _listItemStyle.reset();
//        });
        break;
      case OverflowMenuItem.settings:
        // Navigate to the Settings screen, and load settings and refresh on return
//        loadSettingsScreen();
        _scrollController.jumpTo(0);
        break;
      case OverflowMenuItem.rate:
        // Launch the Google Play Store page to allow the user to rate the app
//        launchUrl(_scaffoldKey.currentState, Strings.rateAppURL);
//        setState(() {
//          debugText = '$int64MaxValue, O: ${_scrollController.offset}';
//        });
        break;
      case OverflowMenuItem.help:
        _scrollController.animateTo(1000, duration: Duration(seconds: 5), curve: Curves.bounceIn);
        // Launch the app online help url
//        launchUrl(_scaffoldKey.currentState, Strings.helpURL);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
//        title: Text(debugText),
//        title: Text('${_listItemStyle?.itemExtent}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.style),
            onPressed: _shuffleStyles,
          ),
          PopupMenuButton<OverflowMenuItem>(
            onSelected: popupMenuSelection,
            itemBuilder: (_) => [
              PopupMenuItem(
                value: OverflowMenuItem.reset,
                child: Text(AppStrings.resetMenuItem),
              ),
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
        listItemStyle: _listItemStyle,
        scrollController: _scrollController,
      ),
    );
  }
}
