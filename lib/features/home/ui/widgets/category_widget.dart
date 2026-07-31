import 'package:flutter/material.dart';
import 'package:grabber_grocrey_app/features/home/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final List<Category> categories;
  const CategoryWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(categories[index].image, width: 50),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  categories[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
