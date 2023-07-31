import 'package:e_commerce_flutter/src/model/bottom_navy_bar_item.dart';
import 'package:e_commerce_flutter/src/model/product_size_type.dart';
import 'package:e_commerce_flutter/src/model/product_category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_commerce_flutter/src/model/categorical.dart';
import 'package:e_commerce_flutter/src/model/numerical.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:flutter/material.dart';

class AppData {
  const AppData._();

  static String dummyText =
      'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum';

  static List<Product> products = [
    Product(
      name: 'Peach',
      amount: 5000,
      about: dummyText,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/peach.png',
      ],
      type: ProductType.mobile,
    ),
    Product(
      name: 'Mango',
      amount: 5000,
      about: dummyText,
      off: 0,
      quantity: 0,
      images: [
        'assets/images/mango.png',
      ],
      type: ProductType.tablet,
    ),
    Product(
      name: 'Cherry',
      amount: 5000,
      about: dummyText,
      off: 0,
      quantity: 0,
      images: [
         'assets/images/cherry.png',
       
      ],
      type: ProductType.tablet,
    ),
  
  ];

  static List<ProductCategory> categories = [
    ProductCategory(
      ProductType.all,
      true,
      Icons.all_inclusive,
    ),
    ProductCategory(
      ProductType.mobile,
      false,
      FontAwesomeIcons.mobileScreenButton,
    ),
    ProductCategory(ProductType.watch, false, Icons.watch),
    ProductCategory(
      ProductType.tablet,
      false,
      FontAwesomeIcons.tablet,
    ),
    ProductCategory(
      ProductType.headphone,
      false,
      Icons.headphones,
    ),
    ProductCategory(
      ProductType.tv,
      false,
      Icons.tv,
    ),
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    BottomNavyBarItem(
      "Home",
      const Icon(Icons.home),
      const Color(0xff484b6a),
      Colors.grey,
    ),

    BottomNavyBarItem(
      "Profile",
      const Icon(Icons.person),
      const Color(0xff484b6a),
      Colors.grey,
    ),
  ];

}
