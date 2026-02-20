import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/context_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:lottie/lottie.dart';

import '../Utils/app_colors.dart';
import '../extensions/app_button.dart';
import '../extensions/app_text_field.dart';
import '../extensions/colors.dart';
import '../extensions/common.dart';
import '../extensions/constants.dart';
import '../extensions/decorations.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';
import '../main.dart';
import '../utils/app_images.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // String cCode = '+91';
  GlobalKey<FormState> mFormKey = GlobalKey<FormState>();

  TextEditingController mConfirmPassCont = TextEditingController();
  TextEditingController mPassCont = TextEditingController();

  FocusNode mConfirmPassFocus = FocusNode();
  FocusNode mPassFocus = FocusNode();

  Future<void> sendOTP() async {
    hideKeyboard(context);
    appStore.setLoading(true);

    // String number = '$cCode${mMobileCont.text.trim()}';
    // if (!number.startsWith('+')) {
    //   number = '$mMobileCont ${mMobileCont.text.trim()}';
    // }
    //
    // await loginWithOTP(
    //   context,
    //   number,
    //   mMobileCont.text.trim(),
    // ).then((value) {}).catchError((e) {
    //   showToast(
    //     e.toString(),
    //     type: ToastificationType.error,
    //     progressColor: primaryColor,
    //   );
    //   // toast(e.toString());
    //   appStore.setLoading(false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("", center: true, context: context),
      body: Stack(
        children: [
          Form(
            key: mFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  30.height,
                  Text(
                    ('New Password'),
                    style: boldTextStyle(size: 30, color: blackNewColor),
                  ).center(),
                  16.height,
                  Text(
                    textAlign: TextAlign.center,
                    ("Your new password must be different from previously used password."),
                    style: secondaryTextStyle(color: Colors.grey),
                  ).center(),
                  40.height,
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: secondaryTextStyle(
                          color: textPrimaryColorGlobal,
                        ),
                      ),
                      2.width,
                      Text('*', style: secondaryTextStyle(color: redColor)),
                    ],
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                  4.height,
                  AppTextField(
                    controller: mPassCont,
                    focus: mPassFocus,
                    // nextFocus: mPassFocus,
                    textFieldType: TextFieldType.pASSWORD,
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
                  Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: secondaryTextStyle(
                          color: textPrimaryColorGlobal,
                        ),
                      ),
                      2.width,
                      Text('*', style: secondaryTextStyle(color: redColor)),
                    ],
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                  4.height,
                  AppTextField(
                    controller: mConfirmPassCont,
                    focus: mConfirmPassFocus,
                    // nextFocus: mPassFocus,
                    textFieldType: TextFieldType.pASSWORD,
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

                  60.height,
                  AppButton(
                    text: 'Create New Password',
                    padding: EdgeInsetsDirectional.all(0),
                    width: context.width() * 0.82,
                    height: context.height() * 0.056,
                    color: primaryColor,
                    onTap: () {
                      // if (mFormKey.currentState!.validate()) {
                      //   sendOTP();
                      // }
                    },
                  ).center(),
                  40.height,
                ],
              ).paddingAll(16),
            ),
          ),
          Lottie.asset(
            // frameRate: FrameRate(1),
            ic_heart_loader,
            fit: BoxFit.fill,
          ).center().visible(appStore.isLoading),
        ],
      ),
    );
  }
}
