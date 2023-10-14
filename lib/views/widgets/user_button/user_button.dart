import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {},
        icon: Icon(Icons.account_circle_outlined,size: MediaQuery.of(context).size.width * 0.08,)
    );
  }
}
