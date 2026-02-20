import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/common.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/utils/app_images.dart';

import 'dashboard/cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedSize = 0;
  int selectedColor = 0;

  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  final List<Color> colors = [
    Color(0xFFF5E9E3),
    Color(0xffe494b6),
    Color(0xffdb5a93),
    Color(0xffb92b69),
    Colors.black
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5E9E3),
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios).onTap((){
                  pop();
                }),
                SizedBox(width: 8),
                Text(
                  "Product Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.favorite_border),
              ],
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            img_p1,
            height: 250,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 12),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    img_p1, // Replace accordingly
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Female's Style", style: TextStyle(color: Colors.grey)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Light Brown Jacket",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            SizedBox(width: 4),
                            Text("4.5", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Product Details",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Read more",
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                    SizedBox(height: 16),
                    Text("Select Size", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: List.generate(sizes.length, (index) {
                        return ChoiceChip(
                          label: Text(sizes[index]),
                          selected: selectedSize == index,
                          onSelected: (val) => setState(() => selectedSize = index),
                          selectedColor:primaryColor,
                          labelStyle: TextStyle(
                              color: selectedSize == index ? Colors.white : Colors.black),
                          backgroundColor: Colors.grey.shade200,
                        );
                      }),
                    ),
                    SizedBox(height: 16),
                    Text("Select Color : Brown", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      children: List.generate(colors.length, (index) {
                        return GestureDetector(
                          onTap: () => setState(() => selectedColor = index),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: colors[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedColor == index
                                    ? primaryColor
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$83.97", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            CartScreen(isBack: true,).launch(context);
                          },
                          icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                          label: Text("Add to Cart", style: TextStyle(color: Colors.white)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
