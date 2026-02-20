import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/string_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/text_styles.dart';

import '../Utils/app_colors.dart';
import '../extensions/widgets.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> brandList = ["All", "Nike", "Adidas", "Puma", "Woman"];
  final List<String> genderList = ["All", "Men", "Women"];
  final List<String> sortList = [
    "Most Recent",
    "Popular",
    "Price High",
    "Price Low",
  ];

  String selectedBrand = "All";
  String selectedGender = "All";
  String selectedSort = "Popular";

  RangeValues _currentRangeValues = const RangeValues(7, 100);
  double? _selectedReview;

  final List<Map<String, dynamic>> _reviewOptions = [
    {'label': '4.5 and above', 'value': 4.5},
    {'label': '4.0 - 4.5', 'value': 4.0},
    {'label': '3.5 - 4.0', 'value': 3.5},
    {'label': '3.0 - 3.5', 'value': 3.0},
    {'label': '2.5 - 3.0', 'value': 2.5},
  ];

  void _resetFilter() {
    setState(() {
      _currentRangeValues = const RangeValues(7, 100);
      _selectedReview = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Filter", center: true, context: context),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Brands', style: boldTextStyle()),
            10.height,
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandList.length,
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
                      selectedBrand == brandList[index]
                          ? primaryColor
                          : Colors.white,
                      border: Border.all(
                        width: 0.6,
                        color:
                        selectedBrand == brandList[index]
                            ? primaryColor
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      brandList[index].toString().capitalizeFirstLetter(),
                      style: boldTextStyle(
                        size: 13,
                        color:
                        selectedBrand == brandList[index]
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  )
                      .onTap(() {
                    selectedBrand = brandList[index];
                    print("selectedBrand" + selectedBrand.toString());
                    setState(() {});
                  })
                      .paddingRight(10);
                },
              ),
            ),
            16.height,

            Text('Gender', style: boldTextStyle()),
            10.height,
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genderList.length,
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
                      selectedGender == genderList[index]
                          ? primaryColor
                          : Colors.white,
                      border: Border.all(
                        width: 0.6,
                        color:
                        selectedGender == genderList[index]
                            ? primaryColor
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      genderList[index].toString().capitalizeFirstLetter(),
                      style: boldTextStyle(
                        size: 13,
                        color:
                        selectedGender == genderList[index]
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  )
                      .onTap(() {
                    selectedGender = genderList[index];
                    print("selectedGender" + selectedGender.toString());
                    setState(() {});
                  })
                      .paddingRight(10);
                },
              ),
            ),
            16.height,

            Text('Sort by', style: boldTextStyle()),
            10.height,
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sortList.length,
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
                      selectedSort == sortList[index]
                          ? primaryColor
                          : Colors.white,
                      border: Border.all(
                        width: 0.6,
                        color:
                        selectedSort == sortList[index]
                            ? primaryColor
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      sortList[index].toString().capitalizeFirstLetter(),
                      style: boldTextStyle(
                        size: 13,
                        color:
                        selectedSort == sortList[index]
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                  )
                      .onTap(() {
                    selectedSort = sortList[index];
                    print("Selected Sort" + selectedSort.toString());
                    setState(() {});
                  })
                      .paddingRight(10);
                },
              ),
            ),
        16.height,
            Container(
              height: 450,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pricing Range',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 2,
                    max: 150,
                    divisions: 5,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    activeColor: primaryColor,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  16.height,
                  Text('Reviews', style: boldTextStyle()),
                  8.height,
                  ..._reviewOptions.map(
                    (option) => RadioListTile(
                      activeColor: primaryColor,
                      value: option['value'],
                      groupValue: _selectedReview,
                      onChanged: (value) {

                        print("Values is => "+value.toString());
                        setState(() {
                          _selectedReview = value ;
                        });
                      },
                      title: Row(
                        children: [
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 18,
                              );
                            }),
                          ),
                          8.height,
                          Text(option['label']),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryColor,
                  side: const BorderSide(color: primaryColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _resetFilter,
                child: const Text('Reset Filter'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // Apply your filter logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Filters applied')),
                  );
                },
                child:  Text('Apply', style: boldTextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
