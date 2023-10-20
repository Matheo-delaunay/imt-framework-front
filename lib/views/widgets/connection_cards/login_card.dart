import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/utils/fade_animation.dart';
import 'package:imt_framework_front/views/utils/colors.dart';
import 'package:imt_framework_front/views/pages/signup_screen.dart';
import 'package:provider/provider.dart';

import '../../../API/api_service.dart';

class loginCard extends StatefulWidget {
  const loginCard({super.key});

  @override
  State<loginCard> createState() => _loginCardState();
}

class _loginCardState extends State<loginCard> {
  var apiService = ApiService();

bool ispasswordev = true;
FormData? selected;

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

@override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Container(
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
                    ? AppColors.enabled
                    : AppColors.backgroundColor,
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
                        ? AppColors.enabledtxt
                        : AppColors.deaible,
                    size: 20,
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: selected == FormData.Email
                          ? AppColors.enabledtxt
                          : AppColors.deaible,
                      fontSize: 12),
                ),
                style: TextStyle(
                    color: selected == FormData.Email
                        ? AppColors.enabledtxt
                        : AppColors.deaible,
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
                      ? AppColors.enabled
                      : AppColors.backgroundColor),
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
                          ? AppColors.enabledtxt
                          : AppColors.deaible,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: ispasswordev
                          ? Icon(
                        Icons.visibility_off,
                        color: selected ==
                            FormData.password
                            ? AppColors.enabledtxt
                            : AppColors.deaible,
                        size: 20,
                      )
                          : Icon(
                        Icons.visibility,
                        color: selected ==
                            FormData.password
                            ? AppColors.enabledtxt
                            : AppColors.deaible,
                        size: 20,
                      ),
                      onPressed: () => setState(
                              () => ispasswordev = !ispasswordev),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: selected == FormData.password
                            ? AppColors.enabledtxt
                            : AppColors.deaible,
                        fontSize: 12)),
                obscureText: ispasswordev,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                    color: selected == FormData.password
                        ? AppColors.enabledtxt
                        : AppColors.deaible,
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
                  appState.getDishes();
                  appState.authentification(emailController.text, passwordController.text);
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
    );
  }
}

