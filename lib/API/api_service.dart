import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:imt_framework_front/API/models/DishModel.dart';
import 'package:imt_framework_front/API/models/FavoriteModel.dart';
import 'package:imt_framework_front/API/models/OrderModel.dart';
import 'package:imt_framework_front/API/models/UserModel.dart';
import 'package:imt_framework_front/API/models/requests/AuthUserReq.dart';
import 'package:imt_framework_front/API/models/requests/CreateUserReq.dart';
import 'package:imt_framework_front/API/models/requests/OrderLineReq.dart';
import 'package:imt_framework_front/API/models/OrderDetailsModel.dart';
import 'package:imt_framework_front/API/models/results/UserRes.dart';
import 'package:imt_framework_front/views/utils/constants.dart';

class ApiService {
  Future<UserRes?> authUser(String mail, String password) async {
    //get user and JWT
    try {
      var url = Uri.http(ApiConstants.baseUrl, ApiConstants.authUserEndpoint);
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: authUserReqToJson(AuthUserReq(mail: mail, password: password)));
      if (response.statusCode == 200) {
        return userResFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> createUser(
      String mail, String firstname, String lastname, String password) async {
    //create user
    try {
      var url = Uri.http(ApiConstants.baseUrl, ApiConstants.usersEndpoint);
      await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: createUserReqToJson(CreateUserReq(
              mail: mail,
              firstname: firstname,
              lastname: lastname,
              password: password)));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserModel?> updateUser({String? firstname, String? lastname, String? password}) async {
    //update user
    try {
      Map<String, dynamic> params = {};
      if(firstname != null) params["firstname"] = firstname;
      if(lastname != null) params["lastname"] = lastname;

      var url = Uri.http(ApiConstants.baseUrl, ApiConstants.usersEndpoint, params);
      var response = await http.put(url,
          headers: {"Content-Type": "application/json"}, body: password);
      if (response.statusCode == 200) {
        return userModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<DishModel>?> getDishes(String jwt, List<String>? categoryFilter, String? searchFilter) async {
    //get the LIST of dishes
    try {
      Map<String, dynamic> params = {};
      if(categoryFilter != null) params["categoryFilter"] = categoryFilter;
      if(searchFilter != null) params["searchFilter"] = searchFilter;
      var url = Uri.http(ApiConstants.baseUrl, ApiConstants.dishesEndpoint, params);
      var response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
      );
      if (response.statusCode == 200) {
        return dishModelsFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<OrderModel?> createOrder(
      String jwt, int userId, List<OrderLineReq> orderLines,
      [String? address, String? note]) async {
    //create order
    try {
      String orderLinesJson =
          json.encode(orderLines.map((ol) => orderLineReqToJson(ol)).toList());
      Map<String, dynamic> params = {"userId": userId, "note": note};
      params["address"] = address;
      Uri url = Uri.http(
        ApiConstants.baseUrl,
        ApiConstants.ordersEndpoint,
        params,
      );
      var response = await http.post(url,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $jwt',
            "Content-Type": "application/json",
          },
          body: orderLinesJson);
      if (response.statusCode == 200) {
        return orderModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<OrderModel>?> getOrders(String jwt, int userId) async {
    //gets a LIST of orders for a given USER ID
    try {
      var url = Uri.http(
        ApiConstants.baseUrl,
        ApiConstants.ordersEndpoint,
        {"userId": userId},
      );
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $jwt',
        },
      );
      if (response.statusCode == 200) {
        return orderModelsFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> updateFavorites(String jwt, int userId, int dishId) async {
    //add or remove one user's favorite
    try {
      Uri url = Uri.http(
        ApiConstants.baseUrl,
        ApiConstants.favoritesEndpoint,
        {"userId": userId, "dishId": dishId},
      );
      await http.put(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $jwt',
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<FavoriteModel>?> getFavorites(String jwt, int userId) async {
    //gets a LIST of favorites for a given USER ID
    try {
      var url =
          Uri.http(ApiConstants.baseUrl, ApiConstants.favoritesEndpoint);
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $jwt',
        },
      );
      if (response.statusCode == 200) {
        return favoriteModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<OrderDetailsModel?> getOrderDetails(String jwt, int orderId) async {
    //get order's details for a given USER ID
    try {
      var url = Uri.http(
        ApiConstants.baseUrl,
        ApiConstants.orderDetailsEndpoint,
        {"orderId": orderId},
      );
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $jwt',
        },
      );
      if (response.statusCode == 200) {
        return orderDetailsModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<OrderDetailsModel?> deleteOrder(String jwt, int orderId) async {
    //delete order for a given USER ID
    try {
      var url = Uri.http(
        ApiConstants.baseUrl,
        ApiConstants.ordersEndpoint,
        {"orderId": orderId},
      );
      var response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $jwt',
        },
      );
      if (response.statusCode == 200) {
        return orderDetailsModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
