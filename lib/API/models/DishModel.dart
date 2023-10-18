// To parse this JSON data, do
//
//     final dishModel = dishModelFromJson(jsonString);

import 'dart:convert';

List<DishModel> dishModelFromJson(String str) =>
    List<DishModel>.from(json.decode(str).map((x) => DishModel.fromJson(x)));

class DishModel {
  int id;
  String image;
  String title;
  String description;
  int price;
  List<String> categories;
  List<String> allergens;

  DishModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.categories,
    required this.allergens,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) => DishModel(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        categories: List<String>.from(json["categories"]),
        allergens: List<String>.from(json["allergens"]),
      );
}
