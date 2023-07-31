import 'package:e_commerce_flutter/src/model/product_size_type.dart';

enum ProductType { all, watch, mobile, headphone, tablet, tv }

class Product {
  String name;
  int amount;
  int? off;
  String about;
  ProductSizeType? sizes;
  int _quantity;
  List<String> images;
  ProductType type;

  int get quantity => _quantity;

  set quantity(int newQuantity) {
    if (newQuantity >= 0) _quantity = newQuantity;
  }

  Product({
    required this.name,
    required this.amount,
    required this.about,
    this.sizes,
    required this.off,
    required int quantity,
    required this.images,
    required this.type,
  }) : _quantity = quantity;
}
