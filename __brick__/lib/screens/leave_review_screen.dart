import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/utils/app_images.dart';
import '../Utils/app_colors.dart';
import '../components/order_item_component.dart';
import '../extensions/app_text_field.dart';
import '../extensions/decorations.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';

class LeaveReviewScreen extends StatefulWidget {
  const LeaveReviewScreen({super.key});

  @override
  State<LeaveReviewScreen> createState() => _LeaveReviewScreenState();
}

class _LeaveReviewScreenState extends State<LeaveReviewScreen> {
  TextEditingController reviewCont = TextEditingController();
  double _selectedReview = 4.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Leave Review", center: true, context: context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderItemComponent(
              imagePath: ic_google,
              title: 'Brown suite',
              sizeQty: 'Size : XL | Qty : 10 pcs',
              price: '\$120',
              actionText: 'Re-Order',
              onActionPressed: () {
                // Do reorder
              },
            ),
            16.height,
            Divider(color: Colors.grey.withOpacity(0.1)),
            16.height,
            Text(
              "How is your order?",
              style: boldTextStyle(size: 24, color: blackNewColor),
            ).center(),
            16.height,

            Divider(color: Colors.grey.withOpacity(0.1)),
            16.height,

            Text(
              "Your overall rating",
              style: secondaryTextStyle(size: 14, color: Colors.grey),
            ).center(),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar(
                  initialRating: _selectedReview ?? 0,
                  maxRating: 5,
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  halfFilledIcon: Icons.star_half,
                  isHalfAllowed: true,
                  size: 50,
                  onRatingChanged: (value) {
                    setState(() {
                      _selectedReview = value;
                    });
                  },
                ),
              ],
            ),
            16.height,
            Text(
              "Add detailed review",
              style: boldTextStyle(size: 14, color: blackNewColor),
            ),
            16.height,
            AppTextField(
              maxLines: 4,
              minLines: 4,
              controller: reviewCont,
              textFieldType: TextFieldType.oTHER,
              isValidationRequired: true,
              // focus: mEmailFocus,
              // nextFocus: mLastNameFocus,
              decoration: defaultInputDecoration(
                context,
                label: 'Enter here',
                textStyle: secondaryTextStyle(color: Colors.grey),
              ),
            ),
            // .paddingSymmetric(horizontal: 16, vertical: 4),
            16.height,
            Row(
              children: [
                Image.asset(
                  ic_camera,
                  height: 14,
                  width: 14,
                  color: primaryColor,
                ),
                8.width,
                Text(
                  "add photo",
                  style: secondaryTextStyle(size: 14, color: primaryColor),
                ),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
      bottomNavigationBar:
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child:
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
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // Apply your filter logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Filters applied')),
                  );
                },
                child: Text(
                  'Submit',
                  style: boldTextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
