import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/settings_screen.dart';

import '../../Utils/app_colors.dart';
import '../../extensions/decorations.dart';
import '../../extensions/text_styles.dart';
import '../../extensions/widgets.dart';
import '../../main.dart';
import '../../utils/app_images.dart';
import '../help_center_screen.dart';
import '../invite_friends_screen.dart';
import '../my_orders.dart';
import '../privacy_policy_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? image;
  String? profileImg = '';
  bool isImageUploading = false;

  Future getImage() async {
    image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (image != null) {
      isImageUploading = true;
    }
    setState(() {});
  }

  Widget profileImage() {
    if (image == null) {
      return Container(
          height: 85,
          width: 85,
          padding: EdgeInsets.all(1),
          decoration: boxDecorationWithRoundedCorners(
            boxShape: BoxShape.circle,
            border: Border.all(width: 2, color: primaryColor.withOpacity(0.5)),
          ),
          child: CircleAvatar(
            maxRadius: 60,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(img_p10),
          ));//   Container(
      //   padding: EdgeInsets.all(1),
      //   decoration: boxDecorationWithRoundedCorners(
      //     boxShape: BoxShape.circle,
      //     border: Border.all(width: 2, color: primaryColor.withOpacity(0.5)),
      //   ),
      //   child: Image.file(
      //     File(image!.path),
      //     height: 85,
      //     width: 85,
      //     fit: BoxFit.cover,
      //   ).cornerRadiusWithClipRRect(65),
      // );
    } else if (!profileImg!.isEmpty || userStore.profileImage.isEmpty) {
      return CircleAvatar(
        // backgroundColor: primaryColor.withOpacity(0.6),
        radius: 42.5,
        child: Text(
          (userStore.fName.isNotEmpty && userStore.fName.length >= 2)
              ? userStore.fName.substring(0, 2).toUpperCase()
              : (userStore.fName.isNotEmpty && userStore.fName.isNotEmpty)
              ? userStore.fName.substring(0, 1).toUpperCase()
              : '',
          style: boldTextStyle(color: Colors.white, size: 30),
        ),
      );
    } else {
      return Container(
        height: 85,
        width: 85,
        padding: EdgeInsets.all(1),
        decoration: boxDecorationWithRoundedCorners(
          boxShape: BoxShape.circle,
          border: Border.all(width: 2, color: primaryColor.withOpacity(0.5)),
        ),
        child: CircleAvatar(
          maxRadius: 60,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(img_p10),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Profile",
        center: true,
        context: context,
        showBack: false,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              profileImage(),
              Container(
                decoration: boxDecorationWithRoundedCorners(
                  boxShape: BoxShape.circle,
                  backgroundColor: primaryOpacity,
                ),
                padding: EdgeInsets.all(6),
                child: Image.asset(
                  ic_camera,
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
              ).onTap(() {
                getImage();
              }),
              // .visible(!getBoolAsync(IS_SOCIAL))
            ],
          ).center(),
          10.height,
          Text("Esther Howard", style: boldTextStyle(color: blackNewColor)),
          24.height,
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
                  Text('Your Profile', style: primaryTextStyle()),
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
                    ic_card,
                    color: primaryColor,
                    width: 20,
                    height: 20,
                  ).paddingBottom(4),
                  14.width,
                  Text('Payment Methods', style: primaryTextStyle()),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ).onTap(() {
            /// Razorpay integrate
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
                    ic_orders,
                    color: primaryColor,
                    width: 20,
                    height: 20,
                  ).paddingBottom(4),
                  14.width,
                  Text('My Orders', style: primaryTextStyle()),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ).onTap(() {
            MyOrders().launch(context);
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
                    ic_settings,
                    color: primaryColor,
                    width: 20,
                    height: 20,
                  ).paddingBottom(4),
                  14.width,
                  Text('Settings', style: primaryTextStyle()),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ).onTap(() {
            SettingsScreen().launch(context);
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
                    ic_help,
                    color: primaryColor,
                    width: 20,
                    height: 20,
                  ).paddingBottom(4),
                  14.width,
                  Text('Help Center', style: primaryTextStyle()),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ).onTap(() {
            HelpCenterScreen().launch(context);
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
                    ic_lock,
                    color: primaryColor,
                    width: 20,
                    height: 20,
                  ).paddingBottom(4),
                  14.width,
                  Text('Privacy Policy', style: primaryTextStyle()),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ).onTap(() {
            PrivacyPolicyScreen().launch(context);
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
                    ic_invite_friend,
                    color: primaryColor,
                    width: 20,
                    height: 20,
                  ).paddingBottom(4),
                  14.width,
                  Text('Invite Friends', style: primaryTextStyle()),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ).onTap(() {
            InviteFriendsScreen().launch(context);
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
                    ic_logout,
                    color: primaryColor,
                    width: 20,
                    height: 20,
                  ).paddingBottom(4),
                  14.width,
                  Text('Log out', style: primaryTextStyle()),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          ).onTap(() {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
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
                      20.height,
                      Text("Logout", style: boldTextStyle(color: primaryColor)),
                      10.height,
                      Text(
                        "Are you sure want to log out?",
                        style: secondaryTextStyle(color: Colors.grey),
                      ),
                      20.height,
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primaryColor,
                                side: const BorderSide(color: primaryColor),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Yes, Logout',
                                style: boldTextStyle(color: Colors.white),
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
            // FaqComponent().launch(context);
          }),

        ],
      ).paddingAll(16),
    );
  }
}
