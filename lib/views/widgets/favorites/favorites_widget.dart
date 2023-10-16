import 'package:flutter/material.dart';

import '../../pages/details_page.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({super.key,
    required this.imagePath,
    required this.title,
    required this.description});

  final String imagePath;
  final String title;
  final String description;


  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>
          DetailPage(image: 'assets/images/food.jpg', alergens: [],)));
      },

      child: Card(
        margin: EdgeInsets.only(top: 20),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        child: ListTile(
          visualDensity: VisualDensity(vertical: 3),

          leading: Container(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.bold, fontSize: 20)),
              Text(widget.description, style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.w200, fontSize: 15, color: Colors.grey),)
            ],
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete)),
        )
        ),
    );
  }
}
