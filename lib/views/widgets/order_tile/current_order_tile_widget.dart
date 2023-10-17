import 'package:flutter/material.dart';

import '../../pages/details_page.dart';

class CurrentOrderTile extends StatelessWidget {


  const CurrentOrderTile({super.key,
    required this.currentOrders});

  final List currentOrders;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>
          DetailPage(image: 'assets/images/food.jpg', alergens: [],)));
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
                    Text('Current Order ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                    Text('Description ', style: TextStyle(fontSize: 14, color: Colors.grey),)
                  ],
                )
              ),
              trailing: TextButton(onPressed: (){},
                child: Text('cancel'), style: ElevatedButton.styleFrom(foregroundColor: Colors.red, )),
          )
      ),
    );
  }
}
