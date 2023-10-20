import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/widgets/dish_card/dish_card.dart';
import 'package:imt_framework_front/views/widgets/search_bar/search_bar.dart';
import 'package:imt_framework_front/views/widgets/user_button/user_button.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class DishesPage extends StatelessWidget {
  const DishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    Widget fillPageCore(){
      Widget pageCore;
      if(appState.listDishes.isEmpty){
        pageCore = Center(child: Text('No data'));
      }else {
        pageCore = Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                itemCount: appState.listDishes.length,
                itemBuilder: (ctx, i) {
                  return DishCard(
                    id: appState.listDishes[i].id,
                    title: appState.listDishes[i].title,
                    category: appState.listDishes[i].categories,
                    description: appState.listDishes[i].description,
                    image: appState.listDishes[i].image,
                    price: appState.listDishes[i].price,
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8,
                  mainAxisExtent:
                  (MediaQuery
                      .of(context)
                      .size
                      .width * Constants.height +
                      135),
                ),
              ),
            ));
      }
      return pageCore;
    }


    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(75))),
        ),
        SafeArea(
          child: Column(
            children: [
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                  child: UserButton(),
                ),
              ]),
              SearchBarApp(),
              fillPageCore()
            ],
          ),
        ),
      ],
    );
  }
}
