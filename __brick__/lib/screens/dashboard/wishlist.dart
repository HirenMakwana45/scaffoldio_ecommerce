import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/string_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';

import '../../Utils/app_colors.dart';
import '../../extensions/text_styles.dart';
import '../../extensions/widgets.dart';
import '../../utils/app_images.dart';
import '../product_detail_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<String> saleList = ["All", "Jacket", "Shirt", "Pant", "T-Shirt"];
  String selectedStatus = "Jacket";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "My Wishlist",
        center: true,
        context: context,
        showBack: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: saleList.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                      bottom: 6,
                      top: 6,
                    ),
                    decoration: BoxDecoration(
                      color:
                      selectedStatus == saleList[index]
                          ? primaryColor
                          : Colors.white,
                      border: Border.all(
                        width: 0.6,
                        color:
                        selectedStatus == saleList[index]
                            ? primaryColor
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      saleList[index].toString().capitalizeFirstLetter(),
                      style: boldTextStyle(
                        size: 13,
                        color:
                        selectedStatus == saleList[index]
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  )
                      .onTap(() {
                    selectedStatus = saleList[index];
                    print("Selected Index" + selectedStatus.toString());
                    setState(() {});
                  })
                      .paddingRight(10);
                },
              ),
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              img_p1,
                              height: 130,
                              width: 140,
                              fit: BoxFit.cover,
                              // scale:10,
                            ),
                          ),
                          Image.asset(
                            ic_like_fill,
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ).paddingAll(8).paddingRight(8),
                        ],
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('Brown Jacket'),
                          Row(
                            children: [
                              Image.asset(
                                ic_rating_star,
                                height: 12,
                                width: 12,
                              ),
                              Text(
                                '4.9',
                                style: secondaryTextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.height,
                      Text('\$83.97', style: boldTextStyle()),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ).onTap(() {
                  ProductDetailScreen().launch(context);
                }),
                // 10.width,
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              img_p8,
                              height: 130,
                              width: 140,
                              fit: BoxFit.cover,
                              // scale:10,
                            ),
                          ),
                          Image.asset(
                            ic_like_fill,
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ).paddingAll(8).paddingRight(8),
                        ],
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('Brown Jacket'),
                          Row(
                            children: [
                              Image.asset(
                                ic_rating_star,
                                height: 12,
                                width: 12,
                              ),
                              Text(
                                '4.9',
                                style: secondaryTextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.height,
                      Text('\$83.97', style: boldTextStyle()),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              img_p9,
                              height: 130,
                              width: 140,
                              fit: BoxFit.cover,
                              // scale:10,
                            ),
                          ),
                          Image.asset(
                            ic_like_fill,
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ).paddingAll(8).paddingRight(8),
                        ],
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('Brown Jacket'),
                          Row(
                            children: [
                              Image.asset(
                                ic_rating_star,
                                height: 12,
                                width: 12,
                              ),
                              Text(
                                '4.9',
                                style: secondaryTextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.height,
                      Text('\$83.97', style: boldTextStyle()),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                // 10.width,
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              img_p4,
                              height: 130,
                              width: 140,
                              fit: BoxFit.cover,
                              // scale:10,
                            ),
                          ),
                          Image.asset(
                            ic_like_fill,
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ).paddingAll(8).paddingRight(8),
                        ],
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('Brown Jacket'),
                          Row(
                            children: [
                              Image.asset(
                                ic_rating_star,
                                height: 12,
                                width: 12,
                              ),
                              Text(
                                '4.9',
                                style: secondaryTextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.height,
                      Text('\$83.97', style: boldTextStyle()),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              img_p7,
                              height: 130,
                              width: 140,
                              fit: BoxFit.cover,
                              // scale:10,
                            ),
                          ),
                          Image.asset(
                            ic_like_fill,
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ).paddingAll(8).paddingRight(8),
                        ],
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('Brown Jacket'),
                          Row(
                            children: [
                              Image.asset(
                                ic_rating_star,
                                height: 12,
                                width: 12,
                              ),
                              Text(
                                '4.9',
                                style: secondaryTextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.height,
                      Text('\$83.97', style: boldTextStyle()),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                // 10.width,
                SizedBox(
                  width: 160,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              img_p12,
                              height: 130,
                              width: 140,
                              fit: BoxFit.cover,
                              // scale:10,
                            ),
                          ),
                          Image.asset(
                            ic_like_fill,
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            color: primaryColor,
                          ).paddingAll(8).paddingRight(8),
                        ],
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('Brown Jacket'),
                          Row(
                            children: [
                              Image.asset(
                                ic_rating_star,
                                height: 12,
                                width: 12,
                              ),
                              Text(
                                '4.9',
                                style: secondaryTextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.height,
                      Text('\$83.97', style: boldTextStyle()),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
