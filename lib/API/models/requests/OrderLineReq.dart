import 'dart:convert';

String orderLineReqToJson(OrderLineReq data) => json.encode(data.toJson());

class OrderLineReq {
  int dishId;
  int quantity;

  OrderLineReq({
    required this.dishId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    "dishId": dishId,
    "quantity": quantity,
  };
}
