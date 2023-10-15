import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:provider/provider.dart';

class HomeNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();

    return  Scaffold(
            bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {
                    appState.currentPageIndex = index;
                    appState.pageChange();
                },
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                indicatorColor: Colors.white10,
                selectedIndex: appState.currentPageIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home,
                      color: Colors.amber,
                      size: 35,
                    ),
                    icon: Icon(Icons.home_outlined, size: 35, weight: 10),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.favorite,
                        color: Colors.amber, size: 35,),
                    icon: Icon(Icons.favorite_border, size: 35,),
                    label: 'Business',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.shopping_cart,
                        color: Colors.amber, size: 35,),
                    icon: Icon(Icons.shopping_cart_outlined, size: 35,),
                    label: 'School',
                  ),
                ],
              ),
      body: Container(
        child: appState.page,
      ),
    );
  }
}
