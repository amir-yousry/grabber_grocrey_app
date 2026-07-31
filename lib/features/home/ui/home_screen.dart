import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabber_grocrey_app/features/home/data/categories.dart';
import 'package:grabber_grocrey_app/features/home/data/items.dart';
import 'package:grabber_grocrey_app/features/home/data/products.dart';
import 'package:grabber_grocrey_app/features/home/models/product.dart';
import 'package:grabber_grocrey_app/features/home/ui/widgets/banner_widget.dart';
import 'package:grabber_grocrey_app/features/home/ui/widgets/card_widget.dart';
import 'package:grabber_grocrey_app/features/home/ui/widgets/category_widget.dart';
import 'package:grabber_grocrey_app/features/home/ui/widgets/product_card_widget.dart';
import 'package:grabber_grocrey_app/features/home/ui/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> basketList = [];

  void toggleSelection(Product product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/motor.svg"),
            SizedBox(width: 10),
            Text("61 Hopper street..", style: TextStyle(fontSize: 19)),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_rounded, size: 34),
            Spacer(),
            SvgPicture.asset("assets/icons/basket.svg"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerWidget(items: items),
            CategoryWidget(categories: categories),
            SizedBox(height: 20),
            const SearchWidget(),
            SizedBox(height: 20),
            ProductCardWidget(
              products: products,
              basketList: basketList,
              onTap: () => toggleSelection,
            ),
            SizedBox(height: 20),
            CardWidget(basketList: basketList),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
