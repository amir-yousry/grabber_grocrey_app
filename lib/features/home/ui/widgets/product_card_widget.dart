import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabber_grocrey_app/features/home/models/product.dart';
import 'package:grabber_grocrey_app/features/home/ui/widgets/product_item_widget.dart';

class ProductCardWidget extends StatelessWidget {
  final List<Product> products;
  final List<Product> basketList;
  final Function()? onTap;

  const ProductCardWidget({
    super.key,
    required this.products,
    required this.basketList,
    required this.onTap,
  });

  bool isSelected(Product product) => basketList.contains(product);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: List.generate(products.length, (index) {
            return ProductItem(
              image: products[index].image,
              name: products[index].name,
              rate: products[index].rate,
              rateCount: products[index].rateCount,
              price: products[index].price,
              onTap: onTap,
              icon: isSelected(products[index])
                  ? Icon(
                      CupertinoIcons.delete,
                      color: Colors.red.shade900,
                      size: 15,
                    )
                  : Icon(Icons.add),
            );
          }),
        ),
      ),
    );
  }
}
