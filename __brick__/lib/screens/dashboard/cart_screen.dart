import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/checkout_screen.dart';
import 'package:{{name.snakeCase()}}/utils/app_images.dart';

import '../../Utils/app_colors.dart';
import '../../extensions/text_styles.dart';
import '../../extensions/widgets.dart';

class CartScreen extends StatefulWidget {
  final bool? isBack;
  CartScreen({super.key, this.isBack});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _count = 1;

  bool? isBack = true;

  @override
  void initState() {
    isBack = widget.isBack;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "My Cart",
        center: true,
        context: context,
        showBack: isBack!,
      ),
      body: Column(
        children: [
          Slidable(
            key: ValueKey(1),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  onPressed: (_) async {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            children: [
                              16.height,
                              Text(
                                'Remove from Cart?',
                                style: boldTextStyle(
                                  color: blackNewColor,
                                  size: 20,
                                ),
                              ),
                              6.height,
                              Divider(color: Colors.grey.withOpacity(0.1)),

                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      img_p1,
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pink T-shirt',
                                        style: primaryTextStyle(
                                          color: blackNewColor,
                                        ),
                                      ),
                                      Text(
                                        'Size : XL',
                                        style: primaryTextStyle(
                                          color: Colors.grey,
                                          size: 12,
                                        ),
                                      ),
                                      8.height,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$28.09",
                                            style: boldTextStyle(
                                              color: blackNewColor,
                                            ),
                                          ),
                                          60.width,
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (_count > 1) {
                                                      setState(() {
                                                        _count--;
                                                      });
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.grey.shade200,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                  ),
                                                  child: const Icon(
                                                    size: 20,
                                                    Icons.remove,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),

                                              const SizedBox(width: 8),

                                              // Count Text
                                              Text(
                                                '$_count',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),

                                              const SizedBox(width: 8),

                                              // Plus Button
                                              SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _count++;
                                                    });
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        primaryColor,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),

                                                    padding:
                                                        const EdgeInsets.all(2),
                                                  ),
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ).paddingAll(16),
                              20.height,
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: primaryColor,
                                        side: const BorderSide(
                                          color: primaryColor,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Yes, Remove',
                                        style: boldTextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 16, vertical: 16),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,

                  // label: 'Delete',
                ),
              ],
            ),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    img_p1,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pink T-shirt',
                      style: primaryTextStyle(color: blackNewColor),
                    ),
                    Text(
                      'Size : XL',
                      style: primaryTextStyle(color: Colors.grey, size: 12),
                    ),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$28.09",
                          style: boldTextStyle(color: blackNewColor),
                        ),
                        60.width,
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_count > 1) {
                                    setState(() {
                                      _count--;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.all(2),
                                ),
                                child: const Icon(
                                  size: 20,
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            const SizedBox(width: 8),

                            // Count Text
                            Text(
                              '$_count',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(width: 8),

                            // Plus Button
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _count++;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  padding: const EdgeInsets.all(2),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(16),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () {
            CheckoutScreen().launch(context);
          },
          child: Text(
            'Proceed to Checkout',
            style: boldTextStyle(color: Colors.white),
          ),
        ),
      ),

    );
  }
}
