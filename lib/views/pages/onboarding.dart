import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/pages/login_page.dart';
import '../utils/fade_animation.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.jpg"),
          ),
        ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container ()),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                      child: Container(
                          color: Color(0xFFE9BE4B),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20.0),
                          child: Column(

                            children: [
                              FadeAnimation(
                                delay: 1,
                                child:const Text(
                                  'DishDash',
                                  style: TextStyle(fontSize: 50,
                                      fontFamily: 'Sofia'),
                                ),

                              ),

                              FadeAnimation(
                                delay: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                child: const Text(
                                  'Delivering Delights to Your Doorstep',
                                  style: TextStyle( fontSize:35,
                                  color: Colors.white,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                              ),),
                              const SizedBox(
                                height: 10,
                              ),
                              FadeAnimation(
                                delay: 1,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                           .push(MaterialPageRoute(builder: (context) {
                                         return LoginScreen();
                                       }));
                                    },

                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 115),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(16.0))),
                                    child: const Text(
                                      "Get Started",
                                      style: TextStyle(
                                        color: Color(0xFFEDAB81),
                                        letterSpacing: 0.5,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),



          ),


    );
  }
}