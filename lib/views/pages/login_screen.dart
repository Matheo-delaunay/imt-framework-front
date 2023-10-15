import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/pages/onboarding.dart';
import 'package:imt_framework_front/views/utils/animation.dart';
import 'package:imt_framework_front/views/utils/colors.dart';

enum FormData {
  Email,
  password,
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              AppColors.beige.withOpacity(0.8),
              AppColors.beige.withOpacity(0.8),
              AppColors.beige.withOpacity(0.8),
              AppColors.beige.withOpacity(0.8),

            ],
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                AppColors.beige.withOpacity(0.8), BlendMode.dstATop),
            image: AssetImage("assets/images/background.jpg"),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('DishDash', style: TextStyle(fontSize: 45, fontFamily: 'Sofia'),),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.white38, Colors.white10]),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 2, color: Colors.white30)
                      ),
                      margin: EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeAnimation(
                            delay: 1,
                            child: const Text(
                              "Please sign in to continue",
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.Email
                                    ? enabled
                                    : backgroundColor,
                              ),
                              padding: const EdgeInsets.all(5.0),
                              child: TextField(
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
                                textAlignVertical: TextAlignVertical.center,
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
                            delay: 1,
                            child: Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: selected == FormData.password
                                      ? enabled
                                      : backgroundColor),
                              padding: const EdgeInsets.all(5.0),
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
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            : deaible,
                                        size: 20,
                                      )
                                          : Icon(
                                        Icons.visibility,
                                        color: selected == FormData.password
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
                            delay: 1,
                            child: TextButton(
                                onPressed: () {
                                  // Navigator.pop(context);
                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute(builder: (context) {
                                  //   return MyApp(isLogin: true);
                                  // }));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFF1A264),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 125),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(16.0)))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //End of Center Card
                //Start of outer card
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(height: 10),
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
                            return OnboardingScreen();
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
    );
  }
}