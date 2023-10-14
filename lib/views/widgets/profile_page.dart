import 'dart:ui';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    }
                      , icon: Icon(Icons.arrow_back_ios),
                      padding: EdgeInsets.all(38),),
                    IconButton(onPressed: () {},
                      icon: Icon(Icons.close),
                      padding: EdgeInsets.all(38),
                      iconSize: 30,)
                  ],
                ),
                Container(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile_icon.png'),
                    backgroundColor: Colors.amber,
                    radius: 100,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.sizeOf(context).height *0.5,
                  color: Colors.white,
                )

              ],
            ),
          )
        ],
      ),



    );
  }
}
