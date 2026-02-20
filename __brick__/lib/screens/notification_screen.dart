import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/text_styles.dart';
import 'package:{{name.snakeCase()}}/utils/app_images.dart';

import '../extensions/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Notification",
        center: true,
        context: context,
        // showBack: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TODAY', style: primaryTextStyle(letterSpacing: 2)),
                Text(
                  'Marks all as read',
                  style: secondaryTextStyle(color: primaryColor),
                ),
              ],
            ),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(

                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset(
                        ic_order_shipped,
                        height: 30,
                        width: 30,
                        color: primaryColor,
                      ).paddingAll(22),
                    ),
                    12.width,
                    SizedBox(
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Shipped",
                            style: boldTextStyle(color: blackNewColor,size: 20),
                          ),
                          Text(
                            softWrap: true,
                            maxLines: 4,

                            "Lorem text Lorem text Lorem textLorem textLorem textLorem textLorem textLorem text",
                            style: secondaryTextStyle(color: Colors.grey,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).expand(),


                Text(
                  "1 h",
                  style: primaryTextStyle(color: primaryColor,),
                ),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
