import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';

import '../extensions/app_text_field.dart';
import '../extensions/colors.dart';
import '../extensions/constants.dart';
import '../extensions/decorations.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';

class PasswordManagerScreen extends StatefulWidget {
  const PasswordManagerScreen({super.key});

  @override
  State<PasswordManagerScreen> createState() => _PasswordManagerScreenState();
}

class _PasswordManagerScreenState extends State<PasswordManagerScreen> {
  TextEditingController mPassCont = TextEditingController();
  FocusNode mPassFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Password Manager", center: true, context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Password',
            style: secondaryTextStyle(color: textPrimaryColorGlobal),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          4.height,
          AppTextField(
            controller: mPassCont,
            focus: mPassFocus,
            // nextFocus: mPassFocus,
            textFieldType: TextFieldType.PASSWORD,
            keyboardType: TextInputType.visiblePassword,
            decoration: defaultInputDecoration(
              context,
              label: '********',
              textStyle: secondaryTextStyle(color: Colors.grey),
            ),
            onFieldSubmitted: (c) {
              // save();
            },
            isValidationRequired: true,
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot Password?',
                style: primaryTextStyle(
                  color: primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: primaryColor,
                ),
              ),
            ],
          ).paddingRight(16),
          16.height,
          Text(
            'New Password',
            style: secondaryTextStyle(color: textPrimaryColorGlobal),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          4.height,
          AppTextField(
            controller: mPassCont,
            focus: mPassFocus,
            // nextFocus: mPassFocus,
            textFieldType: TextFieldType.PASSWORD,
            keyboardType: TextInputType.visiblePassword,
            decoration: defaultInputDecoration(
              context,
              label: '********',
              textStyle: secondaryTextStyle(color: Colors.grey),
            ),
            onFieldSubmitted: (c) {
              // save();
            },
            isValidationRequired: true,
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          16.height,
          Text(
            'Confirm New Password',
            style: secondaryTextStyle(color: textPrimaryColorGlobal),
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          4.height,
          AppTextField(
            controller: mPassCont,
            focus: mPassFocus,
            // nextFocus: mPassFocus,
            textFieldType: TextFieldType.PASSWORD,
            keyboardType: TextInputType.visiblePassword,
            decoration: defaultInputDecoration(
              context,
              label: '********',
              textStyle: secondaryTextStyle(color: Colors.grey),
            ),
            onFieldSubmitted: (c) {
              // save();
            },
            isValidationRequired: true,
          ).paddingSymmetric(horizontal: 16, vertical: 4),
          16.height,
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
          onPressed: () {},
          child: Text(
            'Change Password',
            style: boldTextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
