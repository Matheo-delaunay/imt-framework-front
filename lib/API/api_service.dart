import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:imt_framework_front/API/models/DishesModel.dart';
import 'package:imt_framework_front/API/models/FavoritesModel.dart';
import 'package:imt_framework_front/API/models/OrdersModel.dart';
import 'package:imt_framework_front/API/models/requests/AuthUserReq.dart';
import 'package:imt_framework_front/API/models/results/UserRes.dart';
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
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.favoritesEndpoint);
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

  Future<UserRes?> authUser(String mail, String password) async {
    //get user and JWT
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.authUserEndpoint);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: userResToJson(AuthModelReq(mail: mail, password: password)));
      if (response.statusCode == 200) {
        UserRes _model = userResFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
