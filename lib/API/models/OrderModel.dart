import 'dart:convert';

List<OrderModel> orderModelsFromJson(String str) => List<OrderModel>.from(
    json.decode(str).map((x) => OrderModel.fromJson(x)));
OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

class OrderModel {
  int id;
  int userId;
  double price;
  int date;
  bool isFinished;

  OrderModel({
    required this.id,
    required this.userId,
    required this.price,
    required this.date,
    required this.isFinished,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        userId: json["userId"],
        price: json["price"],
        date: json["date"],
        isFinished: json["isFinished"],
      );
}
