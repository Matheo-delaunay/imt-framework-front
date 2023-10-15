import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/home_nav_bar.dart';
import 'package:imt_framework_front/views/onboarding.dart';
import 'package:imt_framework_front/views/pages/Home.dart';

import 'package:provider/provider.dart';

import 'package:imt_framework_front/views/pages/login_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DishDash',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Sora',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber, // background (button) color
              foregroundColor: Colors.white, // foreground (text) color
            ),
          ),
        ),
        home: Home(),
      ),);
  }
}

class MyAppState extends ChangeNotifier {
  late int userId;

}






