import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';

import '../Utils/app_colors.dart';
import '../extensions/text_styles.dart';

class orderItemComponent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String sizeQty;
  final String price;
  final String? actionText;
  final VoidCallback? onActionPressed;

  orderItemComponent({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.sizeQty,
    required this.price,
    this.actionText,
    this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: primaryTextStyle(color: blackNewColor)),
            Text(
              sizeQty,
              style: primaryTextStyle(color: Colors.grey, size: 12),
            ),
            const SizedBox(height: 2),
            Text(price, style: boldTextStyle(color: blackNewColor)),
          ],
        ),
        const Spacer(),
        if (actionText != null)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              onActionPressed != null
                  ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    onPressed: onActionPressed,
                    child: Text(
                      actionText!,
                      style: boldTextStyle(color: Colors.white, size: 14),
                    ).paddingSymmetric(horizontal: 10),
                  )
                  : Text(
                    actionText!,
                    style: boldTextStyle(color: Colors.grey, size: 14),
                  ),
            ],
          ),
      ],
    );
  }
}
