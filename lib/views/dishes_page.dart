import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/widgets/dishcard/dish_card.dart';
import 'package:provider/provider.dart';

class DishesPage extends StatelessWidget {
  const DishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

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

    /*return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Delivecrous"),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: ColoredBox(
                color: Colors.blue,
                child: SizedBox(
                  height: 24,
                  width: double.maxFinite,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "La carte",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.filter_list_alt))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: DishCard(title: "Titre 1", category: "Cat 1", description: "Description", image: "food.jpg", price: 1.0,),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: DishCard(title: "Titre 2", category: "Cat 2", description: "Description un peu plus longue mais pas trop", image: "food.jpg", price: 2.0,),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: DishCard(title: "Titre 3", category: "Cat 3", description: "Description plus longue, soefjseigjsos jsiefjspeok pkkxmaok leisngln slenal nldnixl nekla d", image: "food.jpg", price: 2.0,),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: DishCard(title: "Titre 4", category: "Cat 4", description: "Description plus longue, soefjseigjsos jsiefjspeok pkkxmaok leisngln slenal nldnixl nekla d", image: "food.jpg", price: 2.25,),
                  ),
                ],
              ),
              GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(20),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DishCard(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DishCard(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DishCard(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DishCard(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DishCard(),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );*/
  }
}
