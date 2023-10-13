import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/utils/fade_animation.dart';
import 'package:imt_framework_front/views/utils/colors.dart';
import 'package:imt_framework_front/views/widgets/signup_screen.dart';

enum FormData {
  Email,
  password,
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color enabled = const Color(0xFFF2F2F2);
  Color enabledtxt = Colors.black54;
  Color deaible = Colors.black38;
  Color backgroundColor = const Color(0xFFF2F2F2);
  bool ispasswordev = true;
  FormData? selected;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                      FadeAnimation(
                        delay: 1.4,
                        child: const Text(
                          'DishDash',
                          style: TextStyle(fontSize: 45, fontFamily: 'Sofia'),
                        ),
                      ),
                      Container(
                        width: 400,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white38, Colors.white10]),
                            borderRadius: BorderRadius.circular(25),
                            border:
                                Border.all(width: 2, color: Colors.white30)),
                        margin: EdgeInsets.all(15.0),
                        padding: const EdgeInsets.only(
                            top: 40, bottom: 40, right: 10, left: 10),
                        child: Column(
                          children: [
                            FadeAnimation(
                              delay: 1.3,
                              child: Container(
                                width: 330,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: selected == FormData.Email
                                      ? enabled
                                      : backgroundColor,
                                ),
                                padding: const EdgeInsets.all(2.0),
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: emailController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.Email;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      size: 20,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        color: selected == FormData.Email
                                            ? enabledtxt
                                            : deaible,
                                        fontSize: 12),
                                  ),
                                  style: TextStyle(
                                      color: selected == FormData.Email
                                          ? enabledtxt
                                          : deaible,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1.2,
                              child: Container(
                                width: 330,
                                height: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: selected == FormData.password
                                        ? enabled
                                        : backgroundColor),
                                padding: const EdgeInsets.all(2.0),
                                child: TextField(
                                  controller: passwordController,
                                  onTap: () {
                                    setState(() {
                                      selected = FormData.password;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            : deaible,
                                        size: 20,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: ispasswordev
                                            ? Icon(
                                                Icons.visibility_off,
                                                color: selected ==
                                                        FormData.password
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              )
                                            : Icon(
                                                Icons.visibility,
                                                color: selected ==
                                                        FormData.password
                                                    ? enabledtxt
                                                    : deaible,
                                                size: 20,
                                              ),
                                        onPressed: () => setState(
                                            () => ispasswordev = !ispasswordev),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: selected == FormData.password
                                              ? enabledtxt
                                              : deaible,
                                          fontSize: 12)),
                                  obscureText: ispasswordev,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                              delay: 1.1,
                              child: TextButton(
                                  onPressed: () {
                                    // Navigator.pop(context);
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   return MyApp(isLogin: true);
                                    // }));
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFFE9BE4B),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 17.0, horizontal: 130),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17.0))),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),

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
