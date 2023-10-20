import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/models/DishModel.dart';
import 'package:imt_framework_front/views/order_page.dart';
import 'package:imt_framework_front/views/pages/dishes_page.dart';
import 'package:imt_framework_front/views/pages/favorites_page.dart';
import 'package:imt_framework_front/views/pages/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

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
  late String jwt;
  var currentPageIndex = 0;
  Widget page = DishesPage();
  UserModel? user;
  List<DishModel> listDishes = [];
  List<DishModel> listDishesAfterFilter = [];
  String searchFilter = "";
  List<String> categoryFilter = [];
  Map<int,int> selectedDishesToOrder = {};
  double totalPrice = 0.0;


  Map<String, bool> chipFilterState = {
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
      if(!chipFilterState[filterSelected]!){
        if(!categoryFilter.contains(filterSelected)){
          categoryFilter.add(filterSelected);
        }
        chipFilterState[filterSelected] = true;
      }
    }else{
      if(chipFilterState[filterSelected]!){
        if(categoryFilter.contains(filterSelected)){
          categoryFilter.remove(filterSelected);
        }
        chipFilterState[filterSelected] = false;
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

  /*List<DishModel> filterDishes(){
    if(searchFilter.isEmpty && categoryFilter.isEmpty){
      return listDishes;
    }else{
      if
    }
  }*/

void addDishToSelected(int id){
  selectedDishesToOrder.update(
    id,
        (value) => ++value,
    ifAbsent: () => 1,
  );
}

void deleteDishFromSelected(int id){
  selectedDishesToOrder.update(
    id,
        (value) => --value
  );
  selectedDishesToOrder.removeWhere((key, value) => value==0);
}

 void calculateTotalPrice(){
    selectedDishesToOrder.forEach((key, value) {
      totalPrice = listDishes.filter((element) => element.id == key).map((e) => e.price).fold(0.0, (p, e) => p + e);
    });
    notifyListeners();
}


}