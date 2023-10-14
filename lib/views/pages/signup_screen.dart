import 'dart:ui';
import 'package:flutter/material.dart';
import 'login_page.dart';
import '../utils/colors.dart';
import '../utils/fade_animation.dart';
import '../widgets/cards/signup_card.dart';

enum FormData { Name, LastName, Email, Gender, password, ConfirmPassword }

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
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
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeAnimation(delay: 1, child:
                  const Text('DishDash',
                    style: TextStyle(fontSize: 45,
                        fontFamily: 'Sofia'),),
                  ),
                  signupCard(),

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
                      const Text("If you have an account ",
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 0.5,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: Text("Sign in",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                ),],
            ),
        ),),
      ),],),
    ),
      );
  }
}