import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imt_framework_front/API/models/FavoriteModel.dart';
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
    List<FavoriteModel> favorites = appState.favoritesList;

    List<Widget> fillPageCore(){
      List<Widget> pageCore = [];
      if(favorites.isEmpty){
        pageCore.add(Center(child: Text("no favorites yet")));
      }else{
        for (var element in favorites) {
          pageCore.add(DishTile(quantitySelector: false, id: element.id,));
        }
      }
      return pageCore;
    }

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
                          itemCount: fillPageCore().length,
                          itemBuilder: (BuildContext context, int index) {
                            return fillPageCore()[index];
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
