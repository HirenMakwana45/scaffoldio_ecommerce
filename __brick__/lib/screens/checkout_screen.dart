import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';

import '../Utils/app_colors.dart';
import '../components/order_item_component.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Checkout", center: true, context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Shipping Address", style: boldTextStyle(color: blackNewColor)),
          16.height,

          Text(
            "Choosing Shipping Type",
            style: boldTextStyle(color: blackNewColor),
          ),
          16.height,
          orderItemComponent(
            imagePath: img_p1,
            title: 'Brown Jacket',
            sizeQty: 'Size : XL',
            price: '\$120',
            // actionText: 'Re-Order',
            onActionPressed: () {
              // Do reorder
            },
          ),
          8.height,
          Divider(color: Colors.grey.withOpacity(0.1)),
          orderItemComponent(
            imagePath: img_p2,
            title: 'Brown Jacket',
            sizeQty: 'Size : XL',
            price: '\$120',
            // actionText: 'Re-Order',
            onActionPressed: () {
              // Do reorder
            },
          ),
          8.height,

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
            // CheckoutScreen().launch(context);
          },
          child: Text(
            'Continue to Payment',
            style: boldTextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
