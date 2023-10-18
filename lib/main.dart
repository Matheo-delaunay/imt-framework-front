import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/order_page.dart';
import 'package:imt_framework_front/views/pages/dishes_page.dart';
import 'package:imt_framework_front/views/pages/favorites_page.dart';
import 'package:imt_framework_front/views/pages/onboarding.dart';
import 'package:provider/provider.dart';

import 'API/api_service.dart';
import 'API/models/UserModel.dart';
import 'API/models/results/UserRes.dart';


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
        home: OnboardingScreen(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var apiService = ApiService();
  late int userId;
  var currentPageIndex = 0;
  Widget page = DishesPage();
  late String jwt;
  UserModel? user;


  Map<String, bool> filter = {
    'Végie': false,
    'Viande': false,
    'Healthy': false,
    'Gras': false,
  };

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


  void changeChipState(bool status, String filterSelected) {
    if(status){
      if(!filter[filterSelected]!){
       filter[filterSelected] = true;
      }
    }else{
      if(filter[filterSelected]!){
        filter[filterSelected] = false;
      }
    }
    notifyListeners();
  }

  Future<void> authentification(String email, String password) async {
    UserRes? response = await apiService.authUser(email, password);
    if(response != null){
      user = response.user;
      jwt = response.jwt;
      print('success');
    }
    notifyListeners();
  }


}