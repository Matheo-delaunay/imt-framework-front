import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/utils/colors.dart';
import 'package:imt_framework_front/views/utils/fade_animation.dart';
import 'package:imt_framework_front/views/pages/signup_screen.dart';

class signupCard extends StatefulWidget {
  const signupCard({super.key});

  @override
  State<signupCard> createState() => _signupCardState();
}

class _signupCardState extends State<signupCard> {

bool ispasswordev = true;
FormData? selected;

TextEditingController nameController = new TextEditingController();
TextEditingController lastNameController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController confirmPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Container(
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
      padding: const EdgeInsets.only(
          top: 20, bottom: 40, right: 10, left: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeAnimation(
            delay: 1,
            child: Container(
              child: const Text(
                "Create a new account",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white, letterSpacing: 0.4),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeAnimation(
            delay: 1,
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
                controller: nameController,
                onTap: () {
                  setState(() {
                    selected = FormData.Name;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: selected == FormData.Name
                        ? AppColors.enabledtxt
                        : AppColors.deaible,
                    size: 20,
                  ),
                  hintText: 'Name',
                  hintStyle: TextStyle(
                      color: selected == FormData.Name
                          ? AppColors.enabledtxt
                          : AppColors.deaible,
                      fontSize: 12),
                ),
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                    color: selected == FormData.Name
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
            delay: 1,
            child: Container(
              width: 330,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: selected == FormData.LastName
                    ? AppColors.enabled
                    : AppColors.backgroundColor,
              ),
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                controller: lastNameController,
                onTap: () {
                  setState(() {
                    selected = FormData.LastName;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: selected == FormData.LastName
                        ? AppColors.enabledtxt
                        : AppColors.deaible,
                    size: 20,
                  ),
                  hintText: 'Last Name',
                  hintStyle: TextStyle(
                      color: selected == FormData.LastName
                          ? AppColors.enabledtxt
                          : AppColors.deaible,
                      fontSize: 12),
                ),
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                    color: selected == FormData.LastName
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
            delay: 1,
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
                textAlignVertical: TextAlignVertical.center,
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
            delay: 1,
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
                        color: selected == FormData.password
                            ? AppColors.enabledtxt
                            : AppColors.deaible,
                        size: 20,
                      )
                          : Icon(
                        Icons.visibility,
                        color: selected == FormData.password
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
            delay: 1,
            child: Container(
              width: 330,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: selected == FormData.ConfirmPassword
                      ? AppColors.enabled
                      : AppColors.backgroundColor),
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                controller: confirmPasswordController,
                onTap: () {
                  setState(() {
                    selected = FormData.ConfirmPassword;
                  });
                },
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.lock_open_outlined,
                      color: selected == FormData.ConfirmPassword
                          ? AppColors.enabledtxt
                          : AppColors.deaible,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: ispasswordev
                          ? Icon(
                        Icons.visibility_off,
                        color: selected ==
                            FormData.ConfirmPassword
                            ? AppColors.enabledtxt
                            : AppColors.deaible,
                        size: 20,
                      )
                          : Icon(
                        Icons.visibility,
                        color: selected ==
                            FormData.ConfirmPassword
                            ? AppColors.enabledtxt
                            : AppColors.deaible,
                        size: 20,
                      ),
                      onPressed: () => setState(
                              () => ispasswordev = !ispasswordev),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                        color:
                        selected == FormData.ConfirmPassword
                            ? AppColors.enabledtxt
                            : AppColors.deaible,
                        fontSize: 12)),
                obscureText: ispasswordev,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                    color: selected == FormData.ConfirmPassword
                        ? AppColors.enabledtxt
                        : AppColors.deaible,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FadeAnimation(
            delay: 1,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFE9BE4B),
                    padding: const EdgeInsets.symmetric(
                        vertical: 17.0, horizontal: 130),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(17.0))),
                child: const Text(
                  "Sign Up",
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
