import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/text_styles.dart';

import '../Utils/app_common.dart';
import '../extensions/app_text_field.dart';
import '../extensions/common.dart';
import '../extensions/decorations.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';

class EnterLocationScreen extends StatefulWidget {
  const EnterLocationScreen({super.key});

  @override
  State<EnterLocationScreen> createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  TextEditingController mSearch = TextEditingController();
  FocusNode mSearchFocus = FocusNode();
  String? mSearchValue = "";

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _getClearButton() {


    return IconButton(
      onPressed: () {
        mSearch.clear();
        mSearchValue = "";
        hideKeyboard(context);
      },
      icon: Icon(Icons.clear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Enter Your Location",
        center: true,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: mSearch,
              textFieldType: TextFieldType.oTHER,
              isValidationRequired: false,
              autoFocus: false,

              suffix: _getClearButton(),


              decoration: defaultInputDecoration(
                mPrefix:  mSuffixTextFieldIconWidget(ic_search),
                context,
                isFocusTExtField: true,
                label: 'Golden Avenue',
              ),
              onChanged: (v) {
                mSearchValue = v;

                setState(() {});
              },
            ),
            40.height,
            Row(
              children: [
                Icon(Icons.location_on_sharp, color: primaryColor),
                8.width,
                Text(
                  'Use my current location',
                  style: boldTextStyle(color: blackNewColor),
                ),
              ],
            ),
            Divider(color: Colors.grey.withOpacity(0.5)),
            8.height,
            Text(
              'SEARCH RESULT',
              style: secondaryTextStyle(color: Colors.grey),
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_sharp, color: primaryColor, size: 16),
                4.width,
                Text(
                  'Golden Avenue',
                  style: secondaryTextStyle(color: blackNewColor, size: 16),
                ),
              ],
            ),
            Text(
              '8502 Preston Rd. Ingl..',
              style: primaryTextStyle(color: Colors.grey),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
