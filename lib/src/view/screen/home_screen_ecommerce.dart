import 'package:e_commerce_flutter/src/view/widget/page_wrapper_ecommerce.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce_flutter/core/app_data_ecommerce.dart';
import 'package:e_commerce_flutter/src/view/screen/cart_screen_ecommerce.dart';
import 'package:e_commerce_flutter/src/view/screen/profile_screen.dart';
import 'package:e_commerce_flutter/src/view/screen/favorite_screen_ecommerce.dart';
import 'package:e_commerce_flutter/src/view/screen/product_list_screen_ecommerce.dart';

class HomeScreenEcommerce extends StatefulWidget {
  const HomeScreenEcommerce({Key? key}) : super(key: key);

  static const List<Widget> screens = [
    ProductListScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  State<HomeScreenEcommerce> createState() => _HomeScreenEcommerceState();
}

class _HomeScreenEcommerceState extends State<HomeScreenEcommerce> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Scaffold(
        bottomNavigationBar: BottomNavyBar(
          itemCornerRadius: 10,
          selectedIndex: newIndex,
          items: AppData.bottomNavyBarItems
              .map(
                (item) => BottomNavyBarItem(
                  icon: item.icon,
                  title: Text(item.title),
                  activeColor: item.activeColor,
                  inactiveColor: item.inActiveColor,
                ),
              )
              .toList(),
          onItemSelected: (currentIndex) {
            newIndex = currentIndex;
            setState(() {});
          },
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: HomeScreenEcommerce.screens[newIndex],
        ),
      ),
    );
  }
}
