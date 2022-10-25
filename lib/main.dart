import 'package:flutter/material.dart';

import 'common/app_strings.dart';
import 'screens/home.dart';

void main() {
  runApp(const NeverendingScrollApp());
}

class NeverendingScrollApp extends StatelessWidget {
  const NeverendingScrollApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.white.createMaterialColor(),
// //        primarySwatch: Colors.black.createMaterialColor(),
//       ),
      home: HomeScreen(),
    );
  }
}
