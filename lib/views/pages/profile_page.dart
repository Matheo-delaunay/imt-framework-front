import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/api_service.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/pages/crous_balance_page.dart';
import 'package:imt_framework_front/views/pages/favorites_page.dart';
import 'package:imt_framework_front/views/pages/orders_history.dart';
import 'package:imt_framework_front/views/pages/personal_information_page.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key,});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> entries = <String>[
    'Personal Information',
    'Orders History',
    'My Favorites',
    'Crous Balance',
  ];
  final List<Widget> routes = <Widget>[
    PersonalInfo(),
    OrdersHistory(),
    FavoritesPage(arrowVisible: true),
    CrousBalance(balance: 90),

  ];


  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var apiService = ApiService();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            child: Column(
              children: [
                TopAppBar(arrowVisible: true, heartVisible: false, title: ''),
                Container(
                  child: Icon(Icons.account_circle_outlined, size: 140,)
                ),
                Text('${appState.user?.firstname} ${appState.user?.lastname}',
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
                        child: ListView.separated(
                          itemCount: entries.length,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    if(entries[index] == 'Orders History'){
                                      appState.getOrdersFromUser();
                                    }
                                    if(entries[index] == 'My Favorites'){
                                      appState.getFavoritesFromUser();
                                    }
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {return routes[index];}));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(
                                          '${entries[index]}',
                                          style: TextStyle(
                                            fontFamily: 'Sora',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_right, size: 40,)
                                    ],
                                  ),
                                ),

                              );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                        ),
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
