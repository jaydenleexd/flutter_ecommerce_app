import 'package:e_commerce_flutter/src/e_model/product_size_type_ecommerce.dart';

enum ProductType { all, watch, mobile, headphone, tablet, tv }

class ProductEcommerce {
  String name;
  int price;
  int? off;
  String about;
  bool isAvailable;
  ProductSizeType? sizes;
  int _quantity;
  List<String> images;
  bool isFavorite;
  double rating;
  ProductType type;

  int get quantity => _quantity;

  set quantity(int newQuantity) {
    if (newQuantity >= 0) _quantity = newQuantity;
  }

  ProductEcommerce({
    required this.name,
    required this.price,
    required this.about,
    required this.isAvailable,
    this.sizes,
    required this.off,
    required int quantity,
    required this.images,
    required this.isFavorite,
    required this.rating,
    required this.type,
  }) : _quantity = quantity;
}
