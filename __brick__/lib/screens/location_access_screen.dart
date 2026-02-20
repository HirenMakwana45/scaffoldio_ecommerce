import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/context_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';

import '../Utils/app_colors.dart';
import '../extensions/app_button.dart';
import '../extensions/text_styles.dart';
import '../utils/app_images.dart';
import 'enter_location_screen.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,

            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
            ),
            child:
                Image.asset(
                  ic_location_fill,
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                  color: primaryColor,
                ).center(),
          ),
          30.height,
          Text(
            ('What is your Location?'),
            style: boldTextStyle(size: 24, color: blackNewColor),
          ),
          16.height,
          Text(
            textAlign: TextAlign.center,
            ("we need to know your location in order to suggest nearby services"),
            style: secondaryTextStyle(color: Colors.grey),
          ).center(),
          40.height,
          AppButton(
            text: 'Allow Location Access',
            padding: EdgeInsetsDirectional.all(0),
            width: context.width() * 0.82,
            height: context.height() * 0.056,
            color: primaryColor,
            onTap: () {
              // if (mFormKey.currentState!.validate()) {
              // }
            },
          ).center(),
          20.height,
          Text(
            'Enter Location Manually',
            style: primaryTextStyle(color: primaryColor),
          ).onTap(() {
            EnterLocationScreen().launch(context);
          }),
        ],
      ).center().paddingAll(16),
    );
  }
}
