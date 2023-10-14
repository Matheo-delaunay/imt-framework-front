import 'dart:ui';
import 'package:flutter/material.dart';

class CrousBalance extends StatefulWidget {
  final String balance;
  const CrousBalance({super.key, required this.balance});


  @override
  State<CrousBalance> createState() => _CrousBalanceState();
}

class _CrousBalanceState extends State<CrousBalance> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      padding: EdgeInsets.only(top: 38, left: 38),
                    ),
                  ],
                ),
                Text('Crous balance',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      child: Container(
                          color: Colors.white,
                          child: Center(
                            child: Text('Remaining Crous balance: ',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          )

                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
