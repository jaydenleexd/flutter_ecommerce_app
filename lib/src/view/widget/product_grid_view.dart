import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/model/product.dart';
import 'package:e_commerce_flutter/src/view/animation/open_container_wrapper.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
    required this.items,
    required this.isPriceOff,
    required this.likeButtonPressed,
  }) : super(key: key);

  final List<Product> items;
  final bool Function(Product product) isPriceOff;
  final void Function(int index) likeButtonPressed;

  Widget _gridItemHeader(Product product, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       
        ],
      ),
    );
  }
Widget _gridItemBody(Product product) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color(0xFFE5E6E8),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(product.images[0], scale: 1), // Align the image to the left
        const SizedBox(width:150,),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "Balance:", // Replace "Your Word" with the word you want to align to the right
              style: TextStyle(
                fontSize: 16,
              ),
            ),
             SizedBox(height: 1),
             Text(
              "5000", // Add another Text widget with the value "5000"
              style: TextStyle(
                fontSize: 16,
                                fontWeight: FontWeight.bold,

              ),
              
            ),
                         SizedBox(height: 10),

              Text(
              "Baki:", // Replace "Your Word" with the word you want to align to the right
              style: TextStyle(
                fontSize: 16,
              ),
            ),
             SizedBox(height: 1),
             Text(
              "5000", // Add another Text widget with the value "5000"
              style: TextStyle(
                fontSize: 16,
                                fontWeight: FontWeight.bold,

              ),
            ),
          ],
        ),
      ],
    ),
  );
}

  Widget _gridItemFooter(Product product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w500, 
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(

              children: [
              
                
                const SizedBox(width: 3),
                Visibility(
                  child: Text(
                    "\$${product.amount}",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 10 / 6,
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          Product product = items[index];
          return OpenContainerWrapper(
            product: product,
            child: GridTile(
              header: _gridItemHeader(product, index),
              child: _gridItemBody(product),
            ),
          );
        },
      ),
    );
  }
}
