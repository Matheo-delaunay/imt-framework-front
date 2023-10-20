import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/dish_card/dish_card_image.dart';
import '../../pages/details_page.dart';
import '../../utils/constants.dart';

class DishCard extends StatelessWidget {
  final int id;
  final String title;
  final List<String> category;
  final String description;
  final String image;
  final double price;

  const DishCard(
      {super.key,
      required this.title,
      required this.category,
      required this.description,
      required this.image,
      required this.price, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(image: 'assets/images/food.jpg', alergens: [],)))
        },
      child: Container(
        width: MediaQuery.of(context).size.width * Constants.width,
        height: MediaQuery.of(context).size.width * Constants.height + 135,
        child: Card(
          elevation: 5,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DishCardImage(image: 'assets/images/food.jpg'),
              CardTittle(title: title,),
              CardDescription(description: description,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CardPrice(price: price,), AddButton()],
              )
            ],
          ),
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
      margin: EdgeInsets.only(bottom: 10,right: 3),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size(45,45)),
          shape: MaterialStatePropertyAll(CircleBorder()),
      ),
      onPressed: () => {},
            child: Icon(Icons.add),
    ),
        ));
  }
}

class CardPrice extends StatelessWidget {
  const CardPrice({
    super.key, required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 0, 0, 10),
      child: Text(
          price.toString(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
    );
  }
}

class CardDescription extends StatelessWidget {
  const CardDescription({
    super.key, required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 0, 0, 10),
      child: Text(
        description,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}

class CardTittle extends StatelessWidget {
  const CardTittle({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 10, 0, 3),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
