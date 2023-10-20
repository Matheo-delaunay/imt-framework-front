import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/models/OrderDetailsModel.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../utils/pageSeparator.dart';

class DetailOrderHistory extends StatelessWidget {

  const DetailOrderHistory({super.key, required this.date,});

  final String date;


  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    OrderDetailsModel orderDetails = appState.orderDetails!;

    List<Widget> fillPageCore(){
      List<Widget> pageCore = [];

      pageCore.add(Text(date, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),);
      pageCore.add(PageSeparator(),);
      orderDetails.orderLines.forEach((element) {Text(element, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),textAlign: TextAlign.left,) ;});
      pageCore.add(SizedBox(height: 80,),);
      pageCore.add(PageSeparator(),);
      pageCore.add(Text('${orderDetails.price} €', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),);

      return pageCore;
      }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ), Column(
            children: [
              TopAppBar(arrowVisible: true, heartVisible: false, title: 'Order Details'),
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
