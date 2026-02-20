import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/context_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/string_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/filter_screen.dart';
import 'package:{{name.snakeCase()}}/utils/app_colors.dart';

import '../../Utils/app_common.dart';
import '../../components/count_down_timer.dart';
import '../../extensions/app_text_field.dart';
import '../../extensions/decorations.dart';
import '../../extensions/text_styles.dart';
import '../../extensions/widgets.dart';
import '../../main.dart';
import '../../utils/app_images.dart';
import '../notification_screen.dart';
import '../product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController mSearch = TextEditingController();
  FocusNode mSearchFocus = FocusNode();
  String? mSearchValue = "";

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  List<Widget> imageItems = [
    ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Image.asset(img_banner_1, fit: BoxFit.fill),
    ),
    ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Image.asset(img_banner_1, fit: BoxFit.fill),
    ),
    ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Image.asset(img_banner_1, fit: BoxFit.fill),
    ),
    ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Image.asset(img_banner_1, fit: BoxFit.fill),
    ),
  ];
  final List<String> saleList = ["All", "Newest", "Popular", "Man", "Woman"];
  String selectedStatus = "Newest";
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        '',
        titleWidget: Row(
          children: [
            8.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: primaryTextStyle(size: 14, color: Colors.grey),
                ),
                Row(
                  children: [
                    Image.asset(
                      ic_location_fill,
                      fit: BoxFit.cover,
                      height: 20,
                      width: 20,
                      color: primaryColor,
                    ),
                    6.width,
                    Text(
                      'New York,USA',
                      style: boldTextStyle(color: blackNewColor),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: blackNewColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ).onTap(() {}),
        titleSpacing: 10,
        showBack: false,
        context: context,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.14),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Image.asset(
              ic_notification,
              fit: BoxFit.cover,
              width: 20,
              height: 20,
            ).paddingAll(8).onTap(() {
              NotificationScreen().launch(context);
            }),
          ),
          8.width,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                AppTextField(
                  controller: mSearch,
                  textFieldType: TextFieldType.OTHER,
                  isValidationRequired: false,
                  autoFocus: false,

                  decoration: defaultInputDecoration(
                    mPrefix: mSuffixTextFieldIconWidget(ic_search),
                    context,
                    isFocusTExtField: true,
                    label: 'Search',
                  ),
                  onChanged: (v) {
                    mSearchValue = v;

                    setState(() {});
                  },
                ).expand(),
                10.width,
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Image.asset(
                    ic_filter,
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ).paddingAll(8).onTap(() {
                    FilterScreen().launch(context);
                  }),
                ),
              ],
            ),
            26.height,
            CarouselSlider(
              items: imageItems,
              carouselController: _controller,
              options: CarouselOptions(
                pageSnapping: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 6),
                autoPlayAnimationDuration: Duration(milliseconds: 3000),
                aspectRatio: 2.2,
                enlargeCenterPage: true,

                // enlargeFactor: 2,
                // viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  imageItems.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 4.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : primaryColor)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category", style: boldTextStyle(color: blackNewColor)),
                Text("See All", style: secondaryTextStyle(color: primaryColor)),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        ic_t_shirt,
                        height: 30,
                        width: 30,
                        color: primaryColor,
                      ).paddingAll(22),
                    ),
                    4.height,
                    Text("T-shirt", style: boldTextStyle(color: blackNewColor)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        ic_pant,
                        height: 40,
                        width: 40,
                        color: primaryColor,
                      ).paddingAll(18),
                    ),
                    4.height,
                    Text("Pant", style: boldTextStyle(color: blackNewColor)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        ic_dress,
                        height: 30,
                        width: 30,
                        color: primaryColor,
                      ).paddingAll(22),
                    ),
                    4.height,
                    Text("Dress", style: boldTextStyle(color: blackNewColor)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        ic_jacket,
                        height: 30,
                        width: 30,
                        color: primaryColor,
                      ).paddingAll(22),
                    ),
                    4.height,
                    Text("Jacket", style: boldTextStyle(color: blackNewColor)),
                  ],
                ),
              ],
            ),
            26.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Flash Sale", style: boldTextStyle(color: blackNewColor)),

                CountdownTimer(
                  duration: Duration(hours: 2, minutes: 12, seconds: 56),
                ),
              ],
            ),
            18.height,
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
          ],
        ).paddingAll(16),
      ),
    );
  }
}
