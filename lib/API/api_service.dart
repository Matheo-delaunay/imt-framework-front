import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:imt_framework_front/API/models/DishModel.dart';
import 'package:imt_framework_front/API/models/FavoriteModel.dart';
import 'package:imt_framework_front/API/models/OrderModel.dart';
import 'package:imt_framework_front/API/models/requests/AuthUserReq.dart';
import 'package:imt_framework_front/API/models/results/UserRes.dart';
import 'package:imt_framework_front/views/utils/constants.dart';

class ApiService {
  Future<UserRes?> authUser(String mail, String password) async {
    //get user and JWT
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.authUserEndpoint);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: userResToJson(AuthModelReq(mail: mail, password: password)));
      if (response.statusCode == 200) {
        return userResFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<DishModel>?> getDishes(String jwt) async {
    //gets the LIST of dishes
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.dishesEndpoint);
      var response = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'});
      if (response.statusCode == 200) {
        return dishModelsFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<FavoriteModel>?> getFavorites(int userId) async {
    //gets a LIST of favorites for a given USER ID
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.favoritesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<FavoriteModel> _model = favoriteModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<OrderModel>?> getOrders(userId) async {
    //gets a LIST of orders for a given USER ID
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.ordersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<OrderModel> _model = orderModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
