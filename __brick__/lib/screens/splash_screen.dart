import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/duration_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/coupon_screen.dart';
import 'package:{{name.snakeCase()}}/screens/filter_screen.dart';
import 'package:{{name.snakeCase()}}/screens/product_detail_screen.dart';
import 'package:{{name.snakeCase()}}/screens/sign_in_screen.dart';
import 'package:{{name.snakeCase()}}/screens/track_order_screen.dart';
import 'package:{{name.snakeCase()}}/screens/walk_through_screen.dart';
// import 'package:{{name.snakeCase()}}/profile_setup_info_screen.dart';

import 'package:{{name.snakeCase()}}/utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/utils/app_images.dart';

import '../../../../main.dart';
import '../../Utils/app_config.dart';
import '../../extensions/text_styles.dart';
import '../Utils/app_common.dart';
import '../Utils/app_constants.dart';
import '../extensions/shared_pref.dart';
import 'complete_profile_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'leave_review_screen.dart';
import 'my_orders.dart';
// import 'dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.seconds.delay;
    // WalkThroughScreen().launch(context);
    DashboardScreen().launch(context);
    // print("USER LOGGEIN==>"+userStore.isLoggedIn.toString());

    // if (!getBoolAsync(IS_FIRST_TIME)) {
    //   WalkThroughScreen().launch(context, isNewTask: true);
    // } else {
    //   if (userStore.isLoggedIn) {
    //    // const DashboardScreen().launch(context, isNewTask: true);
    //   } else {
    //      LoginScreen().launch(context, isNewTask: true);
    //   }
    // }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            appStore.isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness:
            appStore.isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        body:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(img_logo,
                //          fit: BoxFit.cover)
                //     .center(),
                30.height,
                Text(
                  "{{name.snakeCase()}}",
                  style: boldTextStyle(color: primaryColor, size: 28),
                ),
              ],
            ).center(),
      ),
    );
  }
}
