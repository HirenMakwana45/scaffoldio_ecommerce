import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{name.snakeCase()}}/screens/sign_in_screen.dart';
import '../../extensions/app_button.dart';
import '../../extensions/extension_util/context_extensions.dart';
import '../../extensions/extension_util/int_extensions.dart';
import '../../extensions/extension_util/widget_extensions.dart';
import '../../utils/app_images.dart';
import '../extensions/common.dart';
import '../extensions/shared_pref.dart';
import '../extensions/text_styles.dart';
import '../main.dart';
import '../model/walk_through_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_config.dart';
import '../utils/app_constants.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController mPageController = PageController();

  List<WalkThroughModel> mWalkList = [];
  int mCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    mWalkList.add(
      WalkThroughModel(
        // image: img_chats,
        title: WALK1_TITLE,
        subTitle: SUBTITLE1,
      ),
    );
    mWalkList.add(
      WalkThroughModel(
        // image: img_chat_2,
        title: WALK2_TITLE,
        subTitle: SUBTITLE2,
      ),
    );
    mWalkList.add(
      WalkThroughModel(
        // image: img_chat_1,
        title: WALK3_TITLE,
        subTitle: SUBTITLE3,
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    mPageController.dispose();
    super.dispose();
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
        body: Stack(
          children: [
            Positioned(
              top: context.statusBarHeight + 30,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(ic_placeholder,
                  //         width: 40, height: 40, fit: BoxFit.cover)
                  //     .center(),
                  // Text(
                  //   '',
                  //   style: boldTextStyle(color: primaryColor, size: 24),
                  // )
                ],
              ),
            ),
            PageView(
              controller: mPageController,
              children:
                  mWalkList.map((e) {
                    return Column(
                      children: [
                        // Image.asset(
                        //   mWalkList[mCurrentIndex].image!,
                        //   height: context.height() * 0.4,
                        //   fit: BoxFit.fill,
                        // ),
                      ],
                    ).paddingTop(context.statusBarHeight + 130);
                  }).toList(),
              onPageChanged: (i) {
                mCurrentIndex = i;
                setState(() {});
              },
            ),
            Positioned(
              top: context.statusBarHeight,
              right: 4,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  setValue(IS_FIRST_TIME, true);
                  LoginScreen().launch(context);
                },
                child: Text('Skip', style: boldTextStyle(color: primaryColor)),
              ),
            ).visible(mCurrentIndex != 2),
            Positioned(
              right: 24,
              left: 24,
              bottom: 50,
              child: Column(
                children: [
                  Text(
                    mWalkList[mCurrentIndex].title.toString(),
                    style: boldTextStyle(size: 22),
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  Text(
                    mWalkList[mCurrentIndex].subTitle.toString(),
                    style: secondaryTextStyle(color: lightColor),
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  dotIndicator(mWalkList, mCurrentIndex),
                  30.height,
                  AppButton(
                    width: context.width() * 0.82,
                    height: context.height() * 0.066,
                    text: mCurrentIndex ==2 ?'Get Started':'Next',
                    color: primaryColor,
                    onTap: () {
                      // setValue(IS_FIRST_TIME, true);
                      if (mCurrentIndex.toInt() >= 2) {
                        // setValue(IS_FIRST_TIME, true);
                        LoginScreen().launch(context);
                      } else {
                      mPageController.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.linearToEaseOut,
                      );
                      }
                    },
                  ).center(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
