import 'package:flutter/material.dart';
import 'package:imt_framework_front/views/dishes_page.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HomeNavBar extends StatefulWidget {
  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  var currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {

    Widget page;

    switch (currentPageIndex) {
      case 0:
        page = DishesPage();
        break;
      case 1:
        page = Placeholder();
        break;
      case 2:
        page = Placeholder();
        break;
      case 3:
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $currentPageIndex');
    }

    return  Scaffold(
            bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                indicatorColor: Colors.white10,
                selectedIndex: currentPageIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home,
                      color: Colors.amber,
                    ),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.favorite,
                        color: Colors.amber),
                    icon: Icon(Icons.favorite_border),
                    label: 'Business',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.shopping_cart,
                        color: Colors.amber),
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: 'School',
                  ),
                ],
              ),
      body: Container(
        child: page,
      ),
    );
  }
}
