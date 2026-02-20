import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/password_manager_screen.dart';

import '../Utils/app_colors.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Settings",
        center: true,
        context: context,
        // showBack: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    8.width,
                    Image.asset(
                      ic_profile_user,
                      color: primaryColor,
                      width: 20,
                      height: 20,
                    ).paddingBottom(4),
                    14.width,
                    Text('Notification Settings', style: primaryTextStyle()),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ).onTap(() {
              // FaqComponent().launch(context);
            }),
            8.height,

            Divider(color: Colors.grey.withOpacity(0.1)),
            8.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    8.width,
                    Image.asset(
                      ic_key,
                      color: primaryColor,
                      width: 20,
                      height: 20,
                    ).paddingBottom(4),
                    14.width,
                    Text('Password Manager', style: primaryTextStyle()),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ).onTap(() {
              PasswordManagerScreen().launch(context);
            }),
            8.height,

            Divider(color: Colors.grey.withOpacity(0.1)),
            8.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    8.width,
                    Image.asset(
                      ic_card,
                      color: primaryColor,
                      width: 20,
                      height: 20,
                    ).paddingBottom(4),
                    14.width,
                    Text('Delete Account', style: primaryTextStyle()),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ).onTap(() {
              // FaqComponent().launch(context);
            }),
            8.height,
          ],
        ).paddingAll(16),
      ),
    );
  }
}
