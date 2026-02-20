import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/text_styles.dart';
import 'package:{{name.snakeCase()}}/utils/app_images.dart';

import '../extensions/widgets.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Invite Friends", center: true, context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(ic_google, height: 50, width: 50),
                    10.width,
                    Column(
                      children: [
                        Text(
                          'Carla Schoen',
                          style: boldTextStyle(color: blackNewColor),
                        ),
                        Text(
                          '207.555.0119',
                          style: primaryTextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Invite',
                    style: boldTextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            6.height,
            Divider(color: Colors.grey.withOpacity(0.2)),

            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Image.asset(ic_google, height: 50, width: 50),
                    10.width,
                    Column(
                      children: [
                        Text(
                          'Carla Schoen',
                          style: boldTextStyle(color: blackNewColor),
                        ),
                        Text(
                          '207.555.0119',
                          style: primaryTextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Invite',
                    style: boldTextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            6.height,
            Divider(color: Colors.grey.withOpacity(0.2)),
            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Image.asset(ic_google, height: 50, width: 50),
                    10.width,
                    Column(
                      children: [
                        Text(
                          'Carla Schoen',
                          style: boldTextStyle(color: blackNewColor),
                        ),
                        Text(
                          '207.555.0119',
                          style: primaryTextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Invite',
                    style: boldTextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            6.height,
            Divider(color: Colors.grey.withOpacity(0.2)),

            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Image.asset(ic_google, height: 50, width: 50),
                    10.width,
                    Column(
                      children: [
                        Text(
                          'Carla Schoen',
                          style: boldTextStyle(color: blackNewColor),
                        ),
                        Text(
                          '207.555.0119',
                          style: primaryTextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Invite',
                    style: boldTextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            6.height,
            Divider(color: Colors.grey.withOpacity(0.2)),

            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Image.asset(ic_google, height: 50, width: 50),
                    10.width,
                    Column(
                      children: [
                        Text(
                          'Carla Schoen',
                          style: boldTextStyle(color: blackNewColor),
                        ),
                        Text(
                          '207.555.0119',
                          style: primaryTextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Invite',
                    style: boldTextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            6.height,
            Divider(color: Colors.grey.withOpacity(0.2)),

            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Image.asset(ic_google, height: 50, width: 50),
                    10.width,
                    Column(
                      children: [
                        Text(
                          'Carla Schoen',
                          style: boldTextStyle(color: blackNewColor),
                        ),
                        Text(
                          '207.555.0119',
                          style: primaryTextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Invite',
                    style: boldTextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            6.height,
          ],
        ).paddingAll(16),
      ),
    );
  }
}
