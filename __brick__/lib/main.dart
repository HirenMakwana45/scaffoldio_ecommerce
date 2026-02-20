import 'dart:async';

// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/splash_screen.dart';
import 'package:{{name.snakeCase()}}/store/UserStore/UserStore.dart';
import 'package:{{name.snakeCase()}}/store/app_store.dart';
// import 'package:{{name.snakeCase()}}/utils/app_common.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import 'Utils/app_colors.dart';
// import 'Utils/app_common.dart';
import 'Utils/app_config.dart';
import 'Utils/app_constants.dart';
import 'app_theme.dart';
import 'extensions/common.dart';
import 'extensions/constants.dart';
import 'extensions/decorations.dart';

import 'extensions/system_utils.dart';
import 'screens/no_internet_screen.dart';
import 'utils/app_common.dart' show setLogInValue, showToast;

AppStore appStore = AppStore();
UserStore userStore = UserStore();

late SharedPreferences sharedPreferences;
final navigatorKey = GlobalKey<NavigatorState>();
// ValueNotifier<bool> appAppearanceNotifier = ValueNotifier(false);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  sharedPreferences = await SharedPreferences.getInstance();

  setLogInValue();

  defaultAppButtonShapeBorder = RoundedRectangleBorder(
    borderRadius: radius(defaultAppButtonRadius),
  );

  // oneSignalData();
  // await AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic Notifications',
  //       channelDescription: 'Basic Notification Channel',
  //       defaultColor: primaryColor,
  //       playSound: true,
  //       importance: NotificationImportance.High,
  //       locked: true,
  //       enableVibration: true,
  //     ),
  //     NotificationChannel(
  //       channelKey: 'scheduled_channel',
  //       channelName: 'Scheduled Notifications',
  //       channelDescription: 'Scheduled Notification Channel',
  //       defaultColor: primaryColor,
  //       locked: true,
  //       importance: NotificationImportance.High,
  //       playSound: true,
  //       enableVibration: true,
  //     ),
  //   ],
  // );
  // setTheme();
  // if (!getStringAsync(PROGRESS_SETTINGS_DETAIL).isEmptyOrNull) {
  //   userStore.addAllProgressSettingsListItem(jsonDecode(getStringAsync(PROGRESS_SETTINGS_DETAIL)).map<ProgressSettingModel>((e) => ProgressSettingModel.fromJson(e)).toList());
  // } else {
  //   userStore.addAllProgressSettingsListItem(progressSettingList());
  // }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
      _,
      ) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  static String tag = '/MyApp';

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool isCurrentlyOnNoInternet = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
        e,
        ) {
      if (e.contains(ConnectivityResult.none)) {
        log('not connected');
        isCurrentlyOnNoInternet = true;
        push(NoInternetScreen());
      } else {
        if (isCurrentlyOnNoInternet) {
          pop();
          isCurrentlyOnNoInternet = false;
          // showToast(
          //   'Internet is connected',
          //   type: ToastificationType.error,
          //   progressColor: primaryColor,
          // );
        }
        log('connected');
      }
    });
    // getFcmToken();
  }
  // Future<String?> getFcmToken() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   print("FCM Token: $token");
  //   return token;
  // }
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ToastificationWrapper(
          child: MaterialApp(
            title: APP_NAME,
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            scrollBehavior: SBehavior(),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            localeResolutionCallback: (locale, supportedLocales) => locale,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
