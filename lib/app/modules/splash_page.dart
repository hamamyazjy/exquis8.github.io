// ignore_for_file: use_key_in_widget_constructors

import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/config/theme/app_colors.dart';
import 'package:exquis8_hotel_app/config/theme/assets_manager.dart';
import 'package:exquis8_hotel_app/utils/constants.dart';
import 'package:exquis8_hotel_app/utils/locale_database_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    var delay = const Duration(seconds: 3);
    Future.delayed(
      delay,
      () {
        // String token = LocaleDatabase().getData(Constants.token) ?? '';

        // if (token == '') {
          LocaleDatabase().setData(Constants.token, 'eydsb2dpbic6ICdnZ0BnLmNvbScsICdwd2QnOiAnMTIzMTIzJ30=');
        Get.offAllNamed(AppRoutes.boarding);
        // } else {
        //   Get.offAllNamed(AppRoutes.boarding);
        // }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // width: Get.width,
          // height: Get.height,
          decoration: BoxDecoration(
            color: AppColors.primaryColor2,
            image: DecorationImage(
              image: AssetImage(
                ImageAssetsPngs.splashPng,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
