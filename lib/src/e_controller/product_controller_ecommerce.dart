import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:e_commerce_flutter/e_core/app_data_ecommerce.dart';
import 'package:e_commerce_flutter/src/e_model/product_ecommerce.dart';
import 'package:e_commerce_flutter/src/e_model/numerical_ecommerce.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:e_commerce_flutter/src/e_model/product_category_ecommerce.dart';
import 'package:e_commerce_flutter/src/e_model/product_size_type_ecommerce.dart';

class ProductControllerEcommerce extends GetxController {
  List<ProductEcommerce> allProducts = AppData.products;
  RxList<ProductEcommerce> filteredProducts = AppData.products.obs;
  RxList<ProductEcommerce> cartProducts = <ProductEcommerce>[].obs;
  RxList<ProductCategory> categories = AppData.categories.obs;
  RxInt totalPrice = 0.obs;

  void filterItemsByCategory(int index) {
    for (ProductCategory element in categories) {
      element.isSelected = false;
    }
    categories[index].isSelected = true;

    if (categories[index].type == ProductType.all) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(allProducts.where((item) {
        return item.type == categories[index].type;
      }).toList());
    }
    update();
  }

  void isFavorite(int index) {
    filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;
    update();
  }

  void addToCart(ProductEcommerce product) {
    product.quantity++;
    cartProducts.add(product);
    cartProducts.assignAll(cartProducts);
    calculateTotalPrice();
  }

  void increaseItemQuantity(ProductEcommerce product) {
    product.quantity++;
    calculateTotalPrice();
    update();
  }

  void decreaseItemQuantity(ProductEcommerce product) {
    product.quantity--;
    calculateTotalPrice();
    update();
  }

  bool isPriceOff(ProductEcommerce product) => product.off != null;

  bool get isEmptyCart => cartProducts.isEmpty;

  bool isNominal(ProductEcommerce product) => product.sizes?.numerical != null;

  void calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartProducts) {
      if (isPriceOff(element)) {
        totalPrice.value += element.quantity * element.off!;
      } else {
        totalPrice.value += element.quantity * element.price;
      }
    }
  }

  getFavoriteItems() {
    filteredProducts.assignAll(
      allProducts.where((item) => item.isFavorite),
    );
  }

  getCartItems() {
    cartProducts.assignAll(
      allProducts.where((item) => item.quantity > 0),
    );
  }

  getAllItems() {
    filteredProducts.assignAll(allProducts);
  }

  List<Numerical> sizeType(ProductEcommerce product) {
    ProductSizeType? productSize = product.sizes;
    List<Numerical> numericalList = [];

    if (productSize?.numerical != null) {
      for (var element in productSize!.numerical!) {
        numericalList.add(Numerical(element.numerical, element.isSelected));
      }
    }

    if (productSize?.categorical != null) {
      for (var element in productSize!.categorical!) {
        numericalList.add(
          Numerical(
            element.categorical.name,
            element.isSelected,
          ),
        );
      }
    }

    return numericalList;
  }

  void switchBetweenProductSizes(ProductEcommerce product, int index) {
    sizeType(product).forEach((element) {
      element.isSelected = false;
    });

    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        element.isSelected = false;
      }

      product.sizes?.categorical![index].isSelected = true;
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        element.isSelected = false;
      }

      product.sizes?.numerical![index].isSelected = true;
    }

    update();
  }

  String getCurrentSize(ProductEcommerce product) {
    String currentSize = "";
    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.categorical.name}";
        }
      }
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.numerical}";
        }
      }
    }
    return currentSize;
  }
}
