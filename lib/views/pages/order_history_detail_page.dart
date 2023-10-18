import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';

import '../utils/pageSeparator.dart';

class DetailOrderHistory extends StatefulWidget {

  const DetailOrderHistory({super.key, required this.date, required this.price});
  final String date;
  final double price;

  @override
  State<DetailOrderHistory> createState() => _DetailOrderHistoryState();
}

class _DetailOrderHistoryState extends State<DetailOrderHistory> {

  @override
  Widget build(BuildContext context) {
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
                      child: ListView(
                        children: [
                          Text('12/07/2023', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          PageSeparator(),
                          SizedBox(height: 20,),
                          Text('- Margherita', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
                          SizedBox(height: 80,),
                          PageSeparator(),
                          Text('€ ${widget.price}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
