import 'package:e_commerce_flutter/e_core/app_color_ecommerce.dart';
import 'package:flutter/material.dart' show Color, Colors;

class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? imagePath;

  RecommendedProduct({
    this.cardBackgroundColor,
    this.buttonTextColor = AppColor.darkBlue,
    this.buttonBackgroundColor = Colors.white,
    this.imagePath,
    
  });
}