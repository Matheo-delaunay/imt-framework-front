import 'package:flutter/material.dart';


class PastOrderTile extends StatelessWidget {


  const PastOrderTile({super.key,
    required this.pastOrders, required this.price});

  final String pastOrders;
  final double price;

  @override
  Widget build(BuildContext context) {

      return GestureDetector(
        onTap: () {},
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
                    Text('12/07/2023 ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                    Text('€ ${price} ', style: TextStyle(fontSize: 13, color: Colors.grey),)
                  ],
                )
            ),
          )
        ),

    );
  }
}
