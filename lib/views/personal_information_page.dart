import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/textfieldwidget.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final List<String> entries = <String>[
    'Personal Information',
    'My Order',
    'My Favorites',
    'Crous Balance'
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
                      padding: EdgeInsets.only(top: 38, left: 38),
                    ),
                  ],
                ),
                Text('Personal Information',
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
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          physics: BouncingScrollPhysics(),
                          children: [
                            const SizedBox(height: 50),
                            TextFieldWidget(
                              label: 'Full Name',
                              text: 'UserName',
                              onChanged: (name) {},
                            ),
                            const SizedBox(height: 24),
                            TextFieldWidget(
                              label: 'Email',
                              text: 'Email',
                              onChanged: (email) {},
                            ),
                            const SizedBox(height: 24),
                            TextFieldWidget(
                              label: 'Password',
                              text: 'Password',
                              onChanged: (password) {},
                            ),

                          ],
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
