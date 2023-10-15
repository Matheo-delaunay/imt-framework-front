import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    Key? key,
    required this.arrowVisible,
    required this.heartVisible,
    required this.title,
  }) : super(key: key);

  final bool arrowVisible;
  final bool heartVisible;
  final String title;

  @override
  Size get preferredSize => const Size(double.infinity, 72);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: arrowVisible,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: IconButton(
                      onPressed: () => {Navigator.pop(context)},
                      icon: Icon(Icons.keyboard_arrow_left, size: 50,),),
                ),
              ),
                Text(title,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                  ),
              ),
              Visibility(
                visible: heartVisible,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                      onPressed: ()=>{},
                      icon: Icon(Icons.favorite_border,size: 50,)
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
