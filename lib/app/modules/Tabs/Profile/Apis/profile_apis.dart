import 'dart:convert';
import 'dart:developer';

import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/app/services/base_client.dart';
import 'package:exquis8_hotel_app/utils/Api_Constant.dart';

class ProfileApis {
  getAccountProfile({
    required Function(Map accountData) onSuccess,
    required Function(ApiException)? onError,
  }) async {
    await BaseClient.post(
      APIConstants.account,
      onSuccess: (response) {
        var json = jsonDecode(response.data);

        onSuccess(
          json,
        );
      },
      onError: onError,
    );
  }

  updateProfile({
    required Function(Map profileData) onSuccess,
    required Function(ApiException)? onError,
    required Map<String, dynamic> data,
  }) async {
    log('data $data');
    await BaseClient.post(
      APIConstants.updateProfile,
      postData: data,
      isRaw: true,
      onSuccess: (response) {
        onSuccess(jsonDecode(response.data));
      },
      onError: onError,
    );
  }

  addAccommodation({
    required Function(Map accommodationData) onSuccess,
    required Function(ApiException)? onError,
    required Map<String, dynamic> data,
  }) async {
    await BaseClient.post(
      APIConstants.addAccommodation,
      postData: data,
      isRaw: true,
      onSuccess: (response) {
        onSuccess(jsonDecode(response.data));
      },
      onError: onError,
    );
  }
}
