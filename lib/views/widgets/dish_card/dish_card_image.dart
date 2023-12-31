import 'package:flutter/cupertino.dart';

import '../../utils/constants.dart';

class DishCardImage extends StatelessWidget {
  final String image;

  const DishCardImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * Constants.width,
      height: MediaQuery.of(context).size.width * Constants.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
      ),
    );
  }
}
