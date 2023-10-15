import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/dishes_page.dart';
import 'package:imt_framework_front/views/utils/favorites_page.dart';
import 'package:provider/provider.dart';


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
        home: FavoritesPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {

  var currentPageIndex = 0;
  Widget page = DishesPage();

  Widget pageChange(){

    switch (currentPageIndex) {
      case 0:
        page = DishesPage();
        break;
      case 1:
        page = Placeholder();
        break;
      case 2:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $currentPageIndex');
    }
    notifyListeners();

    return page;
  }

}