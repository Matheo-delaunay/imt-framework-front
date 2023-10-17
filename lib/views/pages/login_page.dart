import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/utils/fade_animation.dart';
import 'package:imt_framework_front/views/utils/colors.dart';
import 'package:imt_framework_front/views/widgets/connection_cards/login_card.dart';
import 'package:imt_framework_front/views/pages/signup_screen.dart';

enum FormData {
  Email,
  password,
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                AppColors.blacks.withOpacity(0.3), BlendMode.srcOver),
            image: AssetImage("assets/images/background.jpg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FadeAnimation(
                        delay: 1.4,
                        child: const Text(
                          'DishDash',
                          style: TextStyle(fontSize: 45, fontFamily: 'Sofia'),
                        ),
                      ),
                      loginCard(),

                      //End of Center Card
                      //Start of outer card
                      const SizedBox(
                        height: 20,
                      ),

                      FadeAnimation(
                        delay: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                )),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SignupScreen();
                                }));
                              },
                              child: Text("Sign up",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
