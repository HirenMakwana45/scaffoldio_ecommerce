import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/text_styles.dart';

import '../extensions/widgets.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Coupon", center: true, context: context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Best Offer for you',
              style: boldTextStyle(color: blackNewColor),
            ),
            const SizedBox(height: 16),
          ],
        ).paddingAll(16),
      ),
    );
  }
}