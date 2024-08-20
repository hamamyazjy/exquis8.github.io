import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:exquis8_hotel_app/app/modules/splash_page.dart';
import 'package:exquis8_hotel_app/app/routes/app_pages.dart';
import 'package:exquis8_hotel_app/config/translations/internationalization.dart';
import 'package:exquis8_hotel_app/utils/locale_database_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   print('Handling a background message ${message.messageId}');
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleDatabase().initSharedPrefrences();

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

final botToastBuilder = BotToastInit(); //1. call BotToastInit

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Parse the current URL
    final uri = Uri.base;
    // Extract the path from the URL and convert it to an integer
    final int? number =
        int.tryParse(uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : '');
    log('number $number');

    super.initState();
    // NotificationHelper().initialNotification();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return GetMaterialApp(
          defaultTransition: Transition.leftToRight,
          title: "Royal L'azure".tr,
          initialRoute: AppPages.inital,
          getPages: AppPages.routes,
          home: SplashPage(),
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          locale: InternationalizationService.getCurrentLocal(),
          fallbackLocale: InternationalizationService.getCurrentLocal(),
          translations:
              InternationalizationMessages(), // localization services in app (controller app language)
          builder: (context, widget) {
            widget = botToastBuilder(context, widget);
        
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
