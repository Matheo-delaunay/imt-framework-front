import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

class OrderDetailsModel {
  int id;
  double price;
  int date;
  List<String> orderLines;

  OrderDetailsModel({
    required this.id,
    required this.price,
    required this.date,
    required this.orderLines,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    id: json["id"],
    price: json["price"],
    date: json["date"],
    orderLines: json["orderLines"],
  );
}
