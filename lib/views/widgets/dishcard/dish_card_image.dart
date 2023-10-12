import 'package:flutter/cupertino.dart';

class DishCardImage extends StatelessWidget {
  final String image;

  const DishCardImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 130,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
