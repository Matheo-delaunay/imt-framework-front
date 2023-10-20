import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/models/DishModel.dart';
import 'package:imt_framework_front/API/models/FavoriteModel.dart';
import 'package:imt_framework_front/API/models/OrderDetailsModel.dart';
import 'package:imt_framework_front/API/models/OrderModel.dart';
import 'package:imt_framework_front/API/models/requests/OrderLineReq.dart';
import 'package:imt_framework_front/views/pages/order_page.dart';
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
  int userId = 0;
  String jwt = "";
  var currentPageIndex = 0;
  Widget page = DishesPage();
  UserModel? user;
  List<DishModel> listDishes = [];
  List<DishModel> listDishesAfterFilter = [];
  String searchFilter = "";
  List<String> categoryFilter = [];
  Map<int,int> selectedDishesToOrder = {};
  double totalPrice = 0.0;
  List<OrderModel> orders = [];
  OrderDetailsModel? orderDetails;
  List<FavoriteModel> favoritesList= [];
  TextEditingController destinationController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  int? potentielFavorit;


  Map<String, bool> chipFilterState = {
    'fish': false,
    'vege': false,
    'viandard': false,
    'gluten free': false,
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
    getDishes();
    notifyListeners();
  }

  Future<void> authentification(String email, String password) async {
    UserRes? response = await apiService.authUser(email, password);
    if(response != null){
      user = response.user;
      jwt = response.jwt;
      print('success');
    }
    getDishes();
    notifyListeners();
  }

  Future<void> getDishes() async {
    List<DishModel>? response = await apiService.getDishes(jwt,categoryFilter,searchFilter);
    if(response != null){
      listDishes = response;
    }
    notifyListeners();
  }

  void filterSearchBar(String text){
    searchFilter = text;
    getDishes();
    notifyListeners();
  }


void addDishToSelected(int id){
  selectedDishesToOrder.update(
    id,
        (value) => ++value,
    ifAbsent: () => 1,
  );
  notifyListeners();
}

void deleteDishFromSelected(int id){
  selectedDishesToOrder.update(
    id,
        (value) => --value
  );
  selectedDishesToOrder.removeWhere((key, value) => value == 0);
  notifyListeners();
}

 double calculateTotalPrice(){
    selectedDishesToOrder.forEach((key, value) {
      totalPrice += listDishes.filter((element) => element.id == key).first.price*value;});
    return totalPrice;

}

  void getOrdersFromUser() async {
    List<OrderModel>? response = await apiService.getOrders(jwt,userId);
    if(response != null){
      orders = response;
    }
    notifyListeners();
  }

  void getOrderDetailFromId(int id) async{
  OrderDetailsModel? response = await apiService.getOrderDetails(jwt,id);
  if(response != null){
    orderDetails = response;
  }
  notifyListeners();
  }

  void getFavoritesFromUser() async{
    List<FavoriteModel>? response = await apiService.getFavorites(jwt, userId);
    if(response != null){
      favoritesList = response;
    }
    notifyListeners();
  }

  void addFavorites() async {
    FavoriteModel addedDish = FavoriteModel(id: potentielFavorit!, user: user!, dish: listDishes.firstWhere((element) => element.id == potentielFavorit!));
    if(!favoritesList.contains(addedDish)){
      favoritesList.add(addedDish);
    }
    await apiService.updateFavorites(jwt,userId,potentielFavorit!);
    notifyListeners();
  }


  void cancelOrder(orderId) async{
    await apiService.deleteOrder(jwt, orderId);
    notifyListeners();
  }

  Future<void> changeUserData(String firstname, String lastname, String password) async {
    await apiService.updateUser(firstname: firstname,lastname: lastname,password: password);
    notifyListeners();
  }

  List<OrderLineReq> createOrderLine(){
    List<OrderLineReq> orderLine=[];
    selectedDishesToOrder.forEach((key, value) {orderLine.add(OrderLineReq(dishId: key, quantity: value));});
    return orderLine;
  }

  void createOrder() async{
    await apiService.createOrder(jwt,userId,createOrderLine(),noteController.text,destinationController.text);
    selectedDishesToOrder.clear();
    notifyListeners();
  }

  double newBalance(){
    user!.balance -= totalPrice;
    return user!.balance;
  }


}