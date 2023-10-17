import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:provider/provider.dart';
import 'package:imt_framework_front/views/utils/constants.dart';


class HomeNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();
    double borderNavBarRadius;
    BoxShadow shadowDisplay;
    if(appState.currentPageIndex == 2 ){
      borderNavBarRadius = 0;
      shadowDisplay = BoxShadow();
    }else{
      borderNavBarRadius = 40;
      shadowDisplay = BoxShadow(
          color: Colors.grey, //New
          blurRadius: 40.0,
          offset: Offset(0, 10));
    }

    return  Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.only(topRight: Radius.circular(borderNavBarRadius),topLeft: Radius.circular(borderNavBarRadius)),
                boxShadow: [ shadowDisplay
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
                  child: NavigationBar(
                  height: 90,
                  onDestinationSelected: (int index) {
                      appState.currentPageIndex = index;
                      appState.pageChange();
                  },
                  surfaceTintColor: Colors.white,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  indicatorColor: Colors.white10,
                  selectedIndex: appState.currentPageIndex,
                  destinations: <Widget>[
                    NavigationDestination(
                      selectedIcon: Icon(
                        Icons.home,
                        color: Colors.amber,
                        size: Constants.navbarIconSize,
                      ),
                      icon: Icon(Icons.home_outlined, size: Constants.navbarIconSize),
                      label: 'Menu',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Icons.favorite,
                          color: Colors.amber, size: Constants.navbarIconSize,),
                      icon: Icon(Icons.favorite_border, size: Constants.navbarIconSize,),
                      label: 'Favorites',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Icons.shopping_cart,
                          color: Colors.amber, size: Constants.navbarIconSize,),
                      icon: Icon(Icons.shopping_cart_outlined, size: Constants.navbarIconSize,),
                      label: 'Cart',
                    ),
                  ],
                )),
            ),
      body: Container(
        child: appState.page,
      ),
    );
  }
}
