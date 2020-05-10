import 'dart:math';
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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initScrollController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state'); // resumed, paused, inactive, suspending
    if (state != AppLifecycleState.resumed) {
      SettingsProvider.setScrollOffset(_scrollController.offset);
      print('paused at offset ${_scrollController.offset}');
    }
  }

  Future<void> initScrollController() async {
    final double previousScrollOffset = await SettingsProvider.getScrollOffset();
    print('init - scroll offset from shared: $previousScrollOffset');
    _scrollController.jumpTo(previousScrollOffset);
    print('init - initial scroll offset: ${_scrollController.initialScrollOffset}');
  }

  void _shuffleStyles() {
    setState(() {
      _listItemStyle.shuffle();
    });
  }

  /// Performs the tasks of the overflow menu items.
  void popupMenuSelection(OverflowMenuItem item) {
    switch (item) {
      case OverflowMenuItem.reset:
        setState(() {
          _listItemStyle.reset();
        });
        break;
      case OverflowMenuItem.settings:
        // Navigate to the Settings screen, and load settings and refresh on return
//        loadSettingsScreen();
        _scrollController.jumpTo(100000000000);
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
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
//        title: Text(debugText),
//        title: Text('${_listItemStyle?.textStyle?.fontSize}'),
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
