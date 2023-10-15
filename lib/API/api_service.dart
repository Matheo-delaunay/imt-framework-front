import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:imt_framework_front/API/models/DishesModel.dart';
import 'package:imt_framework_front/API/models/FavoritesModel.dart';
import 'package:imt_framework_front/API/models/OrdersModel.dart';
import 'package:imt_framework_front/API/models/UserModel.dart';
import 'package:imt_framework_front/views/utils/constants.dart';

class ApiService {
  Future<List<DishesModel>?> getDishes() async {
    //gets the LIST of dishes
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.dishesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<DishesModel> _model = dishModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  Future<List<FavoritesModel>?> getFavorites(int userId) async {
    //gets a LIST of favorites for a given USER ID
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.favoritesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<FavoritesModel> _model = favoritesModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  Future<List<OrdersModel>?> getOrders(userId) async {
    //gets a LIST of orders for a given USER ID
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.ordersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<OrdersModel> _model = ordersModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  Future<UserModel?> getUser() async {
    //gets a SINGLE user
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        UserModel _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}