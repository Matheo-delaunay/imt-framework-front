import 'package:flutter/material.dart';

import '../../pages/details_page.dart';

class dishTile extends StatelessWidget {
  const dishTile({super.key,});

  void incrementQuantity() {
  }

  void decrementQuantity() {
  }



  @override
  Widget build(BuildContext context) {

    Widget quantitySelectorWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: decrementQuantity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'quantity.toString()',
            style: TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: incrementQuantity,
        ),
      ],
    );

    Widget trashButtonWidget = IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete));

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
              child: Image(image: AssetImage(imagePath),
                  fit: BoxFit.cover,),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.bold, fontSize: 20)),
              Text(description, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.w200, fontSize: 15, color: Colors.grey),)
            ],
          ),
          trailing: quantitySelector ? quantitySelectorWidget : trashButtonWidget
        )
        ),
    );
  }
}
