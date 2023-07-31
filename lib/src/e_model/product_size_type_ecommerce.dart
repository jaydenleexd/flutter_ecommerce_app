import 'package:e_commerce_flutter/src/e_model/categorical_ecommerce.dart';
import 'package:e_commerce_flutter/src/e_model/numerical_ecommerce.dart';

class ProductSizeType {
  List<Numerical>? numerical;
  List<Categorical>? categorical;

  ProductSizeType({this.numerical, this.categorical});
}
