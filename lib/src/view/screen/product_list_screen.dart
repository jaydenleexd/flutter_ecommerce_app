import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/src/controller/product_controller.dart';
import 'package:e_commerce_flutter/src/view/widget/product_grid_view.dart';
import 'package:e_commerce_flutter/src/view/widget/list_item_selector.dart';
import 'package:e_commerce_flutter/src/view/screen/add_data.dart';
import 'package:e_commerce_flutter/src/view/screen/admin_homepage.dart';

enum AppbarActionType { leading, trailing }

final ProductController controller = ProductController();

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  Widget appBarActionButton(AppbarActionType type, BuildContext context) {
    IconData icon = Icons.plus_one;  
    VoidCallback? onPressed;

    if (type == AppbarActionType.trailing) {
      icon = Icons.admin_panel_settings;
    onPressed = () {
           Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AdminHomepage()),
    );
      };

    } else {
      onPressed = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddDataScreen()),
        );
      };
    }

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.lightGrey,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appBarActionButton(AppbarActionType.leading, context),
              appBarActionButton(AppbarActionType.trailing, context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getAllItems();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Jayden!",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "Let's get something?",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Builder(
                  builder: (BuildContext context) {
                    // Use the context to access the inherited widget or state
                    // and build the desired widget tree
                    final controller = ProductController();
                    return ProductGridView(
                      items: controller.filteredProducts,
                       likeButtonPressed: (index) => controller,

                      isPriceOff: (product) => controller.isPriceOff(product),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
