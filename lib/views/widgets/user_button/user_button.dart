import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/pages/profile_page.dart';

class UserButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {return ProfilePage();}))
        },
        icon: Icon(Icons.account_circle_outlined,size: MediaQuery.of(context).size.width * 0.14, )
    );
  }
}
