import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/utils/colors.dart';
import 'package:provider/provider.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    Key? key,
    required this.arrowVisible,
    required this.heartVisible,
    required this.title,
    this.id,
  }) : super(key: key);

  final bool arrowVisible;
  final bool heartVisible;
  final String title;
  final int? id;


  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: AbsorbPointer(
                    absorbing: !arrowVisible,
                    child: IconButton(
                        onPressed: () => {Navigator.pop(context)},
                        icon: Icon(Icons.keyboard_arrow_left, size: 40,color: arrowVisible? Colors.black:AppColors.transparent,),),
                  ),
                ),
                Text(title,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                  ),
              ),


              Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: AbsorbPointer(
                    absorbing: !heartVisible,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border,size: 45,color: heartVisible? Colors.black:AppColors.transparent,)
                    ),
                  ),
                ),
            ],
          ),
        )
    );
  }
}
