import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/widgets/dish_card/dish_card.dart';
import 'package:imt_framework_front/views/widgets/search_bar/search_bar.dart';
import 'package:imt_framework_front/views/widgets/user_button/user_button.dart';

import '../utils/constants.dart';

class DishesPage extends StatelessWidget {
  const DishesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Container(child: SearchBarApp()),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: 4,
                  itemBuilder: (ctx, i) {
                    return DishCard(
                      title: 'Margherita',
                      category: 'Pizza',
                      description: 'Pizza italienne',
                      image: 'assets/images/background.jpg',
                      price: '19.90',
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8,
                    mainAxisExtent:
                        (MediaQuery.of(context).size.width * Constants.height +
                            135),
                  ),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
