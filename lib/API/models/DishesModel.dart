// To parse this JSON data, do
//
//     final dishModel = dishModelFromJson(jsonString);

import 'dart:convert';

List<DishesModel> dishModelFromJson(String str) => List<DishesModel>.from(json.decode(str).map((x) => DishesModel.fromJson(x)));

String dishModelToJson(List<DishesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DishesModel {
  int id;
  String image;
  String title;
  String description;
  int price;
  List<String> categories;
  List<String> allergens;

  DishesModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.categories,
    required this.allergens,
  });

  factory DishesModel.fromJson(Map<String, dynamic> json) => DishesModel(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    categories: List<String>.from(json["categories"]),
    allergens: List<String>.from(json["allergens"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "description": description,
    "price": price,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "allergens": List<dynamic>.from(allergens.map((x) => x)),
  };
}
