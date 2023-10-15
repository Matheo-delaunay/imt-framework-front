// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

List<OrdersModel> ordersModelFromJson(String str) => List<OrdersModel>.from(json.decode(str).map((x) => OrdersModel.fromJson(x)));

String ordersModelToJson(List<OrdersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdersModel {
  int id;
  int userId;
  int price;
  int date;

  OrdersModel({
    required this.id,
    required this.userId,
    required this.price,
    required this.date,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    id: json["id"],
    userId: json["userId"],
    price: json["price"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "price": price,
    "date": date,
  };
}
