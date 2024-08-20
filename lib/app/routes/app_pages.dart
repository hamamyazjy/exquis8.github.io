import 'package:exquis8_hotel_app/app/modules/Authentication/Bindings/Authentication_bindings.dart';
import 'package:exquis8_hotel_app/app/modules/Authentication/Pages/login_page.dart';
import 'package:exquis8_hotel_app/app/modules/Authentication/Pages/register_page.dart';
import 'package:exquis8_hotel_app/app/modules/Authentication/Pages/verification_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/Bindings/hotel_bindings.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/page/food_details_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/page/hotel_details_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Hotel/page/room_service_menue_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Main/Bindings/main_bindings.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Main/page/main_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/Bindings/profile_bindings.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/page/about_accommodation_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Profile/page/personal_information_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Services/Bindings/services_bindings.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Services/page/fast_check_in_step1_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Services/page/fast_check_in_step2_page.dart';
import 'package:exquis8_hotel_app/app/modules/Tabs/Services/page/laundry_page.dart';
import 'package:exquis8_hotel_app/app/modules/boarding_screen.dart';
import 'package:exquis8_hotel_app/app/modules/splash_page.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();

  static const inital = AppRoutes.spalsh;

  static final routes = [
    GetPage(
      name: AppRoutes.spalsh,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.boarding,
      page: () => BoardingPage(),
    ),
    GetPage(
      name: AppRoutes.logInPage,
      page: () => LogInPage(),
      binding: AuthenticationBindings(),
    ),
    GetPage(
      name: AppRoutes.registerPage,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.verificationPage,
      page: () => VerificationPage(),
    ),
    GetPage(
      name: AppRoutes.mainPage,
      page: () => const MainPage(),
      bindings: [
        MainBindings(),
        HotelBindings(),
        ServicesBindings(),
        ProfileBindings(),
      ],
    ),
    GetPage(
      name: AppRoutes.hotelDetailsPage,
      page: () => const HotelDetailsPage(),
    ),
    GetPage(
      name: AppRoutes.roomServiceMenuePage,
      page: () => RoomServiceMenuePage(),
    ),
    GetPage(
      name: AppRoutes.foodDetailsPage,
      page: () => FoodDetailsPage(),
    ),
    GetPage(
      name: AppRoutes.personalInformationPage,
      page: () => PersonalInformationPage(),
    ),
    GetPage(
      name: AppRoutes.aboutAccommodationPage,
      page: () => AboutAccommodationPage(),
    ),
    GetPage(
      name: AppRoutes.laundryPage,
      page: () => LaundryPage(),
    ),
      GetPage(
      name: AppRoutes.fastCheckInStep1,
      page: () => FastCheckInStep1(),
    ),
      GetPage(
      name: AppRoutes.fastCheckInStep2,
      page: () => FastCheckInStep2(),
    ),
  ];
}
