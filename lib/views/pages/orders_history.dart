import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/models/OrderModel.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/utils/pageSeparator.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:imt_framework_front/views/widgets/order_tile/current_order_tile_widget.dart';
import 'package:imt_framework_front/views/widgets/order_tile/past_order_tile_widget.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class OrdersHistory extends StatelessWidget {

  const OrdersHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    List<OrderModel> orders = appState.orders;

    List<Widget> fillPageCore(){
      List<Widget> pageCore = [];

      if(orders.length != 0){
        pageCore.add(Text('\t Current Orders', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),);
        orders.filter((element) => !element.isFinished).toList().forEach((element) {
          pageCore.add(CurrentOrderTile(order: element));
          pageCore.add(PageSeparator());
        });
        pageCore.add(SizedBox(height: 20,),);
        pageCore.add(Text('\t Past Orders', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),);
        orders.filter((element) => element.isFinished).toList().forEach((element) {
          pageCore.add(PastOrderTile(order: element,));
          pageCore.add(PageSeparator());
        });
      }
      else{
        pageCore.add(Center(child: Text('No Orders')));
      }


      return pageCore;
    }

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
                      child: ListView.builder(
                        itemCount: fillPageCore().length,
                        itemBuilder: (BuildContext context, int index) {
                          return fillPageCore()[index];
                        },
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
