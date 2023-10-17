import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/pages/crous_balance_page.dart';
import 'package:imt_framework_front/views/pages/favorites_page.dart';
import 'package:imt_framework_front/views/pages/personal_information_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.username});
  final String username;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> entries = <String>[
    'Personal Information',
    'My Favorites',
    'Crous Balance',
  ];
  final List<Widget> routes = <Widget>[
    PersonalInfo(),
    FavoritesPage(arrowVisible: true),
    CrousBalance(balance: 90)
  ];


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
                      padding: EdgeInsets.all(38),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.close),
                      padding: EdgeInsets.all(30),
                      iconSize: 30,
                    )
                  ],
                ),
                Container(
                  child: CircleAvatar(
                    backgroundImage:
                    AssetImage('assets/images/profile_icon.png'),
                    backgroundColor: Colors.amber,
                    radius: 90,
                  ),
                ),
                Text('${widget.username}',
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