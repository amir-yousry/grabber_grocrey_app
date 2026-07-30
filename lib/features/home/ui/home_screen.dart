import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          ],
        ),
      ),
    );
  }
}
