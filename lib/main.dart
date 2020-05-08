import 'package:flutter/material.dart';
import 'package:neverendingscroll/common/app_strings.dart';
import 'package:neverendingscroll/screens/home.dart';
import 'package:neverendingscroll/utils/color_utils.dart';

void main() => runApp(NeverendingScrollApp());

class NeverendingScrollApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.white.createMaterialColor(),
//        primarySwatch: Colors.black.createMaterialColor(),
      ),
      home: HomeScreen(),
    );
  }
}