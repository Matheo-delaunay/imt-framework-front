import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:provider/provider.dart';

import '../widgets/dish_tile/dish_tile_widget.dart';

class FavoritesPage extends StatefulWidget {

  const FavoritesPage({super.key, required this.arrowVisible});
  final bool arrowVisible;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ), Column(
              children: [
                TopAppBar(arrowVisible: widget.arrowVisible, heartVisible: false, title: 'My Favorites'),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: appState.selectedDishesToOrder.length,
                          itemBuilder: (BuildContext context, int index) {
                            if(appState.selectedDishesToOrder.length == 0) {
                              return Center(
                                child: Text("no favorites"),
                              );

                            }else{
                              return DishTile(quantitySelector: false, id: appState.selectedDishesToOrder.values.elementAt(index),);
                            }

                        },
                      ),
                    )),
              ),
            ],

          ),
        ],
      ),
    );
  }
}
