import 'dart:convert';

import 'package:imt_framework_front/API/models/DishModel.dart';
import 'package:imt_framework_front/API/models/UserModel.dart';

List<FavoriteModel> favoriteModelFromJson(String str) =>
    List<FavoriteModel>.from(
        json.decode(str).map((x) => FavoriteModel.fromJson(x)));

class FavoriteModel {
  int id;
  UserModel user;
  DishModel dish;

  FavoriteModel({
    required this.id,
    required this.user,
    required this.dish,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        user: json["user"],
        dish: json["dish"],
      );
}
