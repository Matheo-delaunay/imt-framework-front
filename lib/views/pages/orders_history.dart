import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/utils/pageSeparator.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:imt_framework_front/views/widgets/order_tile/current_order_tile_widget.dart';
import '../widgets/order_tile/past_order_tile_widget.dart';

class OrdersHistory extends StatefulWidget {

  const OrdersHistory({super.key});

  @override
  State<OrdersHistory> createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ), Column(
            children: [
              TopAppBar(arrowVisible: true, heartVisible: false, title: 'Orders History'),
              Expanded(
                flex: 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    child: Container(
                      color: Colors.white,
                      child: ListView(
                        children: [
                          Text('\t Current Orders', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          CurrentOrderTile(currentOrders: ['jknfjfe'],),
                          PageSeparator(),
                          CurrentOrderTile(currentOrders: ['khukduhzk'],),
                          PageSeparator(),
                          SizedBox(height: 20,),
                          Text('\t Past Orders', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                          PastOrderTile(pastOrders: ['jfdvcldf'],),
                          PageSeparator(),
                          PastOrderTile(pastOrders: ['kjcejkj'])
                        ],



                      ),
                    )),
              ),
            ],

          ),
        ],
      ),
    );
  }
}
