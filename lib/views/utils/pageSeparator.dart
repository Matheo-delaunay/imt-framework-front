import 'package:flutter/material.dart';

class PageSeparator extends StatelessWidget {
  const PageSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          color: Colors.black12,
        ),
      ),
    );
  }
}