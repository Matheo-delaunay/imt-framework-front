import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/widgets/dishcard/dish_card.dart';

class DishesPage extends StatelessWidget {
  const DishesPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: const Column(
          children:[
            DishCard(
              title: 'Margherita',
              category: 'Pizza',
              description: 'Pizza italienne',
              image: '',
              price: 19.90,
            ),
            DishCard(
              title: 'Margherita',
              category: 'Pizza',
              description: 'Pizza italienne',
              image: '',
              price: 19.90,
            ),
          ]
      ),
    );
  }
}
