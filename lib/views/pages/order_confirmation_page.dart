import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key, required this.balance});
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopAppBar(arrowVisible: true, heartVisible: false, title: 'Order confirmation'),
          SizedBox(height: 60,),
           Column(
              children: [
                Text('DishDash', style: TextStyle(fontSize: 50, fontFamily: 'Sofia'),),
                SizedBox(height: 20,),
                Image(image: AssetImage('assets/images/delivery.png'), 
                    width: MediaQuery.sizeOf(context).width *0.8,
                    height: MediaQuery.sizeOf(context).height *0.4 ),
                SizedBox(height: 20,),
                Text('Thanks for you order!',
                  style: TextStyle(fontSize: 23, fontFamily: 'Sora', fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Text('Your order will be delivered to you soon',
                  style: TextStyle(fontFamily: 'Sora', fontSize: 15, color: Colors.grey , fontWeight: FontWeight.bold),),
                SizedBox(height: 50,),
                Text('Remaining Crous balance: \n € ${balance}',
                  style: TextStyle(fontFamily: 'Sora', fontSize: 15, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,)
                



              ],
            ),



        ],
      ),
    );
  }
}
