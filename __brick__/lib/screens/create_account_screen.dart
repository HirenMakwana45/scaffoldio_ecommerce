import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/context_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/sign_in_screen.dart';
import 'package:lottie/lottie.dart';

import '../Utils/app_colors.dart';
import '../extensions/app_button.dart';
import '../extensions/app_text_field.dart';
import '../extensions/colors.dart';
import '../extensions/common.dart';
import '../extensions/constants.dart';
import '../extensions/decorations.dart';
import '../extensions/text_styles.dart';
import '../main.dart';
import '../utils/app_images.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  GlobalKey<FormState> mFormKey = GlobalKey<FormState>();

  TextEditingController mNameCont = TextEditingController();
  TextEditingController mEmailCont = TextEditingController();
  TextEditingController mPassCont = TextEditingController();

  FocusNode mNameFocus = FocusNode();
  FocusNode mEmailFocus = FocusNode();
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
      body: Stack(
        children: [
          Form(
            key: mFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  60.height,
                  Text(
                    ('Create Account'),
                    style: boldTextStyle(size: 30, color: blackNewColor),
                  ).center(),
                  Text(
                    textAlign: TextAlign.center,
                    ("Fill your information below or register with your social account"),
                    style: secondaryTextStyle(color: Colors.grey),
                  ).paddingSymmetric(horizontal: 16, vertical: 4).center(),
                  40.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: secondaryTextStyle(
                          color: textPrimaryColorGlobal,
                        ),
                      ),
                      2.width,
                      Text('*', style: secondaryTextStyle(color: RedColor)),
                    ],
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                  4.height,
                  AppTextField(
                    controller: mNameCont,
                    textFieldType: TextFieldType.nAME,
                    isValidationRequired: true,
                    focus: mNameFocus,
                    nextFocus: mEmailFocus,
                    decoration: defaultInputDecoration(
                      context,
                      label: 'John Doe',
                      textStyle: secondaryTextStyle(color: Colors.grey),
                    ),
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                  16.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: secondaryTextStyle(
                          color: textPrimaryColorGlobal,
                        ),
                      ),
                      2.width,
                      Text('*', style: secondaryTextStyle(color: RedColor)),
                    ],
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                  4.height,

                  AppTextField(
                    controller: mEmailCont,
                    textFieldType: TextFieldType.eMAIL,
                    isValidationRequired: true,
                    focus: mEmailFocus,
                    nextFocus: mPassFocus,
                    decoration: defaultInputDecoration(
                      context,
                      label: 'example@gmail.com',
                      textStyle: secondaryTextStyle(color: Colors.grey),
                    ),
                  ).paddingSymmetric(horizontal: 16, vertical: 4),
                  16.height,

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

                  28.height,
                  AppButton(
                    text: 'Sign Up',
                    padding: EdgeInsetsDirectional.all(0),
                    width: context.width() * 0.82,
                    height: context.height() * 0.056,
                    color: primaryColor,
                    onTap: () {
                      LoginScreen().launch(context);
                      // if (mFormKey.currentState!.validate()) {
                      //   sendOTP();
                      // }
                    },
                  ).center(),
                  40.height,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 24,
                          endIndent: 14,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or sign up with",
                          style: secondaryTextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 14,
                          endIndent: 24,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),

                  30.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4), // Border color
                            width: 1, // Border width
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            ic_apple, // Your image asset path
                            fit: BoxFit.cover,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      10.width,
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4), // Border color
                            width: 1, // Border width
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            ic_google, // Your image asset path
                            fit: BoxFit.cover,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                      10.width,
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4), // Border color
                            width: 1, // Border width
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            ic_facebook, // Your image asset path
                            fit: BoxFit.cover,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  30.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: secondaryTextStyle(size: 14),
                      ),
                      6.width,
                      Text(
                        'Sign In',
                        style: secondaryTextStyle(
                          size: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: primaryColor,
                          color: primaryColor,
                        ),
                      ).onTap(
                        () {
                          LoginScreen().launch(context);
                          // ForgotPwdScreen().launch(context);
                        },
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 16),
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
