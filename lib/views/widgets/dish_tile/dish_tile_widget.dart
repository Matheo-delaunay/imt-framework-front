import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../API/models/DishModel.dart';
import '../../../main.dart';
import '../../pages/details_page.dart';

class DishTile extends StatelessWidget {
  DishTile({super.key, required this.quantitySelector, required this.id,});

  final int id;

  final bool quantitySelector;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    
    DishModel dish = appState.listDishes.firstWhere((element) => element.id==id);

    Widget quantitySelectorWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {appState.deleteDishFromSelected(id);},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('${appState.selectedDishesToOrder[id]}', style: TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {appState.addDishToSelected(id);},
        ),
      ],
    );

    Widget trashButtonWidget = IconButton(
        onPressed: () {},
        icon: Icon(Icons.delete));

    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>
          DetailPage(id: id,)));
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
              child: Image(image: AssetImage(dish.image),
                  fit: BoxFit.cover,),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dish.title, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.bold, fontSize: 20)),
              Text(dish.description, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.w200, fontSize: 15, color: Colors.grey),)
            ],
          ),
          trailing: quantitySelector ? quantitySelectorWidget : trashButtonWidget
        )
        ),
    );
  }
}
