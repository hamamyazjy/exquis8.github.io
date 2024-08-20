// ignore_for_file: unnecessary_null_comparison
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/app/modules/Authentication/Apis/Authentication_api.dart';
import 'package:exquis8_hotel_app/app/routes/app_routes.dart';
import 'package:exquis8_hotel_app/utils/common.dart';
import 'package:exquis8_hotel_app/utils/constants.dart';
import 'package:exquis8_hotel_app/utils/locale_database_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();
  String? email;
  String? password;
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();

  setEmail(String email) => this.email = email;
  setPassword(String password) => this.password = password;
  login() async {
    if (signInKey.currentState!.validate()) {
      BotToast.showLoading();
      // String? token = await NotificationHelper().getToken();
      await _authenticationAPI.login(
        data: {
          "login": email,
          "pwd": password,
          // "fcm_token": token,
        },
        onSuccess: (Map response) {
          LocaleDatabase().setData(Constants.token, response['token']);
          BotToast.closeAllLoading();

          // Get.offAllNamed(AppRoutes.mainPage);
        },
        onError: (ApiException exception) {
          BotToast.closeAllLoading();
          Common.showNotoficationDialog(
            'Error',
            exception.message,
            Colors.red,
          );
        },
      );
    }
  }

  authByRoom() async {
    BotToast.showLoading();

    await _authenticationAPI.authByRoom(
      data: {
        "room_number": int.tryParse(
            Uri.base.pathSegments.isNotEmpty ? Uri.base.pathSegments[0] : '1'),
      },
      onSuccess: (Map response) {
        BotToast.closeAllLoading();

        LocaleDatabase().setData(Constants.token, response['token']);

        Get.offAllNamed(AppRoutes.mainPage);
      },
      onError: (ApiException exception) {
        BotToast.closeAllLoading();
        log('exception.message ${exception.message}');
        Common.showNotoficationDialog(
          'Error',
          exception.message,
          Colors.red,
        );
      },
    );
  }
}
