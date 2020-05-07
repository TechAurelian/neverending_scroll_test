import 'package:flutter/material.dart';
import 'package:neverendingscroll/common/app_strings.dart';
import 'package:neverendingscroll/widgets/listitems/decimal_backcolor.dart';
import 'package:neverendingscroll/widgets/listitems/decimal_random_backcolor.dart';
import 'package:neverendingscroll/widgets/listitems/decimal_textcolor.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
      ),
      body: ListView.builder(
//        itemBuilder: (context, index) => DecimalBackColorListItem(index),
        itemBuilder: (context, index) => DecimalRandomBackColorListItem(index),
//        itemBuilder: (context, index) => DecimalTextColorListItem(index),
      ),
    );
  }
}
