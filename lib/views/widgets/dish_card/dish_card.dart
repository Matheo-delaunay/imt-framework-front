import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/dish_card/dish_card_image.dart';

import '../../utils/constants.dart';

class DishCard extends StatelessWidget {
  final String title;
  final String category;
  final String description;
  final String image;
  final String price;

  const DishCard(
      {super.key,
      required this.title,
      required this.category,
      required this.description,
      required this.image,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * AppCardSize.width,
      child: Card(
        elevation: 5,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DishCardImage(image: image),
            CardTittle(),
            CardDescription(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardPrice(),
                AddButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15,right: 5),
        child: ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size(50,50)),
        shape: MaterialStatePropertyAll(CircleBorder()),
      ),
      onPressed: () => {},
          child: Icon(Icons.add),
    ));
  }
}

class CardPrice extends StatelessWidget {
  const CardPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
      child: Text(
        '€ 19.90',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
      child: Text(
        'Classic cheese',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}

class CardTittle extends StatelessWidget {
  const CardTittle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 3),
      child: Text(
        'Classic cheeseezezezezezezezez',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}