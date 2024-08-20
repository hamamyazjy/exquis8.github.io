// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/app/services/base_client.dart';
import 'package:exquis8_hotel_app/utils/Api_Constant.dart';

class AuthenticationAPI {
  Future<void> login({
    required Function(Map signInResponse) onSuccess,
    required Function(ApiException)? onError,
    required Map<String, dynamic> data,
  }) async {
    await BaseClient.post(
      APIConstants.signin,
      postData: data,
      isRaw: true,
      onSuccess: (response) {
        log('data $data');
 
        onSuccess(jsonDecode(response.data));

      },
      onError: onError,
    );
  }

   Future<void> authByRoom({
    required Function(Map signInResponse) onSuccess,
    required Function(ApiException)? onError,
    required Map<String, dynamic> data,
  }) async {
    await BaseClient.post(
      APIConstants.authByRoom,
      postData: data,
      isRaw: true,
      onSuccess: (response) {
 
        onSuccess(jsonDecode(response.data));

      },
      onError: onError,
    );
  }


    logout({
    required Function(Map logoutData) onSuccess,
    required Function(ApiException)? onError,
  }) async {
    await BaseClient.post(
      APIConstants.logout,
      onSuccess: (response) {
        onSuccess(jsonDecode(response.data));
      },
      onError: onError,
    );
  }
  
}
