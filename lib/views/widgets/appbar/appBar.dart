import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/utils/colors.dart';

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
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: arrowVisible,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: IconButton(
                      onPressed: () => {Navigator.pop(context)},
                      icon: Icon(Icons.keyboard_arrow_left, size: 40,),),
                ),
              ),
                Text(title,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                  ),
              ),

              Visibility(
                visible: true,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: AbsorbPointer(
                    absorbing: true,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border,size: 45,color: heartVisible? Colors.black:AppColors.transparent,)
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
