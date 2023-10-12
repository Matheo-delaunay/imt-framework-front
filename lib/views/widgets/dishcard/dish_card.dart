import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/dishcard/dish_card_image.dart';

class DishCard extends StatefulWidget {
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
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DishCardImage(image: 'assets/images/food.jpg'),
          CardTittle(),
          CardDescription(),
          Row(
            children: [
              CardPrice(),
              Container(
                child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(1,1)),
                    ) ,
                    onPressed: ()=>{}, child: Text("+")),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CardPrice extends StatelessWidget {
  const CardPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,0,10),
      child: Text('€ 19.90' ,
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
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
    padding: const EdgeInsets.fromLTRB(10,0,0,10),
    child: Text('Classic cheese',
      style: TextStyle(fontSize: 12,color: Colors.grey),),
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
      padding: const EdgeInsets.fromLTRB(10,10,0,3),
      child: Text('Classic cheese', style: TextStyle(fontWeight: FontWeight.bold,
      fontSize: 14),),
    );
  }
}
