import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabber_grocrey_app/core/constants/colors.dart';
import 'package:grabber_grocrey_app/features/home/data/categories.dart';
import 'package:grabber_grocrey_app/features/home/data/items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            
            /// banner
            CarouselSlider.builder(
              itemCount: items.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Image.asset(items[itemIndex]),
              options: CarouselOptions(
                height: 170,
                aspectRatio: 1,
                viewportFraction: 0.6,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 3),
                autoPlayCurve: Curves.ease,
                enlargeCenterPage: true,
              ),
            ),

            /// category
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(category.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              category[index].image,
                              width: 50,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          category[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fruits",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
