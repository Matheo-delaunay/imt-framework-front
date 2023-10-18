import 'dart:convert';

import 'package:imt_framework_front/API/models/UserModel.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

class OrderDetailsModel {
  int id;
  UserModel user;
  String address;
  double price;
  int date;
  List<OrderLine> orderLines;

  OrderDetailsModel({
    required this.id,
    required this.userId,
    required this.price,
    required this.date,
    required this.isFinished,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    id: json["id"],
    userId: json["userId"],
    price: json["price"],
    date: json["date"],
    isFinished: json["isFinished"],
  );
}
