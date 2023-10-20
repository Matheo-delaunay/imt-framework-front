import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:imt_framework_front/views/widgets/text_field/textfieldwidget.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    
    Widget firstNameTextField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Firstname',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: firstnameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: 1,
        ),
      ],
    );

    Widget lastNameTextField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lastname',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: lastnameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: 1,
        ),
      ],
    );

    Widget passwordTextField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          maxLines: 1,
        ),
      ],
    );
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            child: Column(
              children: [
                TopAppBar(arrowVisible: true, heartVisible: false, title: 'Personal Information'),

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
                            firstNameTextField,
                            const SizedBox(height: 24),
                            lastNameTextField,
                            const SizedBox(height: 24),
                            passwordTextField,
                            const SizedBox(height: 24),
                            TextButton(
                                onPressed: () {
                                  appState.changeUserData(firstnameController.text, lastnameController.text, passwordController.text);
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFE9BE4B),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 17.0, horizontal: 130),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(17.0))),
                                child: const Text(
                                  "Change",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
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
