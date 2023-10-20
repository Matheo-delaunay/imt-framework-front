import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/models/OrderModel.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../pages/order_history_detail_page.dart';


class PastOrderTile extends StatelessWidget {
  const PastOrderTile({super.key, required this.order,});

  final OrderModel order;



  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    String dateTime = DateTime.fromMillisecondsSinceEpoch(order.date).toIso8601String().split("T")[0].replaceAll("-", "/");

      return GestureDetector(
        onTap: () {
          appState.getOrderDetailFromId(order.id);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailOrderHistory(date: '',);},));
          },
        child: Card(
          margin: EdgeInsets.only(top: 20),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          child: ListTile(
            visualDensity: VisualDensity(vertical: 3),
            title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dateTime, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                    Text('€ ${order.price} ', style: TextStyle(fontSize: 13, color: Colors.grey),)
                  ],
                )
            ),
          )
        ),

    );
  }
}
