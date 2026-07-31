import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabber_grocrey_app/core/constants/colors.dart';
import 'package:grabber_grocrey_app/features/home/models/product.dart';

class CardWidget extends StatelessWidget {
  final List<Product> basketList;
  const CardWidget({super.key, required this.basketList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              SizedBox(
                width: 170,
                child: ListView.builder(
                  itemCount: basketList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(basketList[index].image),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(width: 2, height: 40, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "View Basket",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 10),
              Badge(
                backgroundColor: Colors.red,
                label: Text(
                  basketList.length.toString(),
                  style: TextStyle(fontSize: 13),
                ),
                largeSize: 12,
                child: SvgPicture.asset(
                  "assets/icons/basket.svg",
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
