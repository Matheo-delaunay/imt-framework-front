import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:provider/provider.dart';

class CrousBalance extends StatefulWidget {

  const CrousBalance({super.key, required this.balance});

  final double balance;
  @override
  State<CrousBalance> createState() => _CrousBalanceState();
}

class _CrousBalanceState extends State<CrousBalance> {


  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            child: Column(
              children: [
                TopAppBar(arrowVisible: true, heartVisible: false, title: 'Crous Balance'),
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
                            child: Text('Remaining Crous balance: \n € ${appState.user!.balance}',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,),
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
