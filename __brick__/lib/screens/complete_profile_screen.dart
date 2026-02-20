import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/context_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/location_access_screen.dart';

import '../Utils/app_colors.dart';
import '../extensions/app_button.dart';
import '../extensions/app_text_field.dart';
import '../extensions/colors.dart';
import '../extensions/constants.dart';
import '../extensions/decorations.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  GlobalKey<FormState> mFormKey = GlobalKey<FormState>();
  TextEditingController mNameCont = TextEditingController();
  TextEditingController mGenderCont = TextEditingController();
  TextEditingController mMobileCont = TextEditingController();
  String cCode = '+91';
  String? selectedGender;

  FocusNode mNameFocus = FocusNode();
  FocusNode mGenderFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("", center: true, context: context),
      body: Form(
        key: mFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 60.height,
              Text(
                ('Complete Your Profile'),
                style: boldTextStyle(size: 30, color: blackNewColor),
              ),
              16.height,
              Text(
                textAlign: TextAlign.center,
                ("Don't worry, only you can see your personal data, No one else will be able to see it."),
                style: secondaryTextStyle(color: Colors.grey),
              ).center(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: secondaryTextStyle(color: textPrimaryColorGlobal),
                  ),
                  2.width,
                  Text('*', style: secondaryTextStyle(color: RedColor)),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 4),
              4.height,
              AppTextField(
                controller: mNameCont,
                textFieldType: TextFieldType.NAME,
                isValidationRequired: true,
                focus: mNameFocus,
                // nextFocus: mEmailFocus,
                decoration: defaultInputDecoration(
                  context,
                  label: 'John Doe',
                  textStyle: secondaryTextStyle(color: Colors.grey),
                ),
              ).paddingSymmetric(horizontal: 16, vertical: 4),
              16.height,
              Row(
                children: [
                  Text(
                    'Phone Number',
                    style: secondaryTextStyle(color: textPrimaryColorGlobal),
                  ),
                  2.width,
                  Text('*', style: secondaryTextStyle(color: redColor)),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 4),
              4.height,
              AppTextField(
                // focus: _focusNode,
                controller: mMobileCont,
                textFieldType: TextFieldType.PHONE,
                // maxLength: 10,
                isValidationRequired: true,
                inputFormatters: [
                  // LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Phone number';
                  } else if (value.length < 10) {
                    return 'Phone number must be 10 digits long';
                  }
                  return null;
                },
                decoration: defaultInputDecoration(
                  context,
                  label: 'Enter mobile number',
                  mPrefix: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CountryCodePicker(
                          enabled: false,
                          initialSelection: cCode,
                          showCountryOnly: false,
                          showFlag: false,
                          boxDecoration: BoxDecoration(
                            borderRadius: radius(defaultRadius),
                            color: context.scaffoldBackgroundColor,
                          ),
                          showFlagDialog: true,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          textStyle: primaryTextStyle(),
                          onInit: (c) {
                            // countryCode = c!.dialCode;
                            // setValue(COUNTRY_CODE, c.code);
                          },
                          onChanged: (c) {
                            cCode = c.dialCode.toString();
                            // countryCode = c.dialCode;
                            // setValue(COUNTRY_CODE, c.code);
                          },
                        ),
                        VerticalDivider(color: Colors.grey.withOpacity(0.5)),
                        16.width,
                      ],
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 16, vertical: 4),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: secondaryTextStyle(color: textPrimaryColorGlobal),
                  ),
                  2.width,
                  Text('*', style: secondaryTextStyle(color: RedColor)),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 4),
              4.height,

              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: defaultInputDecoration(
                  context,
                  textStyle: secondaryTextStyle(color: Colors.grey),
                ),
                isExpanded: true,
                hint: Text(
                  'Select',
                  style: secondaryTextStyle(color: Colors.grey),
                ),
                items:
                    ['Male', 'Female', 'Other'].map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                onChanged: (value) {
                  selectedGender = value;
                  mGenderCont.text = value ?? '';
                },
              ).paddingSymmetric(horizontal: 16, vertical: 4),
              40.height,

              AppButton(
                text: 'Complete Profile',
                padding: EdgeInsetsDirectional.all(0),
                width: context.width() * 0.82,
                height: context.height() * 0.056,
                color: primaryColor,
                onTap: () {
                  LocationAccessScreen().launch(context);
                  // if (mFormKey.currentState!.validate()) {
                  // }
                },
              ).center(),
            ],
          ),
        ),
      ).paddingAll(16),
    );
  }
}
