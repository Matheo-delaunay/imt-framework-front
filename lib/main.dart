import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/pages/dishes_page.dart';
import 'package:imt_framework_front/views/pages/favorites_page.dart';
import 'package:imt_framework_front/views/order_page.dart';
import 'package:imt_framework_front/views/home_nav_bar.dart';
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
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber, // background (button) color
              foregroundColor: Colors.white, // foreground (text) color
            ),
          ),
        ),
        home: HomeNavBar(),
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
        page = FavoritesPage(arrowVisible: false,);
        break;
      case 2:
        page = OrderPage();
        break;
      default:
        throw UnimplementedError('no widget for $currentPageIndex');
    }
    notifyListeners();

    return page;
  }

}