import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/dishcard/dish_card_image.dart';

class DishCard extends StatefulWidget {
  final String title;
  final String category;
  final String description;
  final String image;
  final double price;

  const DishCard(
      {super.key,
      required this.title,
      required this.category,
      required this.description,
      required this.image,
      required this.price});

  @override
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          DishCardImage(image: 'assets/images/food.jpg'),
          Text('helloaz')
        ],
      ),
    );
  }
}
