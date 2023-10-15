// To parse this JSON data, do
//
//     final favoritesModel = favoritesModelFromJson(jsonString);

import 'dart:convert';

List<FavoritesModel> favoritesModelFromJson(String str) => List<FavoritesModel>.from(json.decode(str).map((x) => FavoritesModel.fromJson(x)));

String favoritesModelToJson(List<FavoritesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoritesModel {
  int id;
  String image;
  String title;
  String description;
  int price;
  List<String> categories;
  List<String> allergens;

  FavoritesModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.categories,
    required this.allergens,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    categories: List<String>.from(json["categories"].map((x) => x)),
    allergens: List<String>.from(json["allergens"].map((x) => x)),
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
