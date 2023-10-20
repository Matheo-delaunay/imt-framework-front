import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/utils/constants.dart';
import 'package:imt_framework_front/views/widgets/dish_card/dish_card.dart';
import 'package:imt_framework_front/views/widgets/search_bar/search_bar.dart';
import 'package:imt_framework_front/views/widgets/user_button/user_button.dart';

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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DishCard(
                              title: 'Margherita',
                              category: 'Pizza',
                              description: 'Pizza italienne',
                              image: 'https://fr.ooni.com/cdn/shop/articles/Margherita-9920.jpg?crop=center&height=800&v=1644590066&width=800',
                              price: '19.90',
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  Constants.betweenCardWidth,
                            ),

                            DishCard(
                              title: 'Pepperoni',
                              category: 'Pizza',
                              description: 'Pizza italienne',
                              image: 'https://www.simplyrecipes.com/thmb/pjYMLcsKHkr8D8tYixmaFNxppPw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-8f256746d649404baa36a44d271329bc.jpg',
                              price: '19.90',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DishCard(
                              title: 'Capricciosa',
                              category: 'Pizza',
                              description: 'Pizza italienne',
                              image: 'https://giuliz.com/cdn/shop/articles/four_gaz_pizza_giuliz_recette_capricciosa_1200x1200.jpg?v=1640583517',
                              price: '19.90',
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  Constants.betweenCardWidth,
                            ),
                            DishCard(
                              title: 'Hawaian',
                              category: 'Pizza',
                              description: 'Pizza italienne',
                              image: 'https://cache.marieclaire.fr/data/photo/w1000_c17/cuisine/4l/pizza-hawaienne-ananas-jambon.jpg',
                              price: '19.90',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DishCard(
                              title: 'Vegetariana',
                              category: 'Pizza',
                              description: 'Pizza italienne',
                              image: 'https://www.chacarabertolin.com.br/wp-content/uploads/2018/07/pizza-frango-pimentao.jpg',
                              price: '19.90',
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  Constants.betweenCardWidth,
                            ),
                            DishCard(
                              title: 'Mexicana',
                              category: 'Pizza',
                              description: 'Pizza italienne',
                              image: 'https://img.cuisineaz.com/1280x720/2018/03/19/i137571-pizza-mexicaine-rapide.webp',
                              price: '19.90',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DishCard(
                              title: 'Mushroom',
                              category: 'Pizza',
                              description: 'Pizza italienne',
                              image: 'https://www.thursdaynightpizza.com/wp-content/uploads/2021/05/finished-without-chives_STAMP.png',
                              price: '19.90',
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  Constants.betweenCardWidth,
                            ),
                            DishCard(
                              title: 'Seafood',
                              category: 'Pizza',
                              description: 'Pizza italienne',
                              image: 'https://www.smilepizza.com.ua/uploads/pizza-s-moreproduktami-5.jpg',
                              price: '19.90',
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

    );
  }
}
