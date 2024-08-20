import 'dart:convert';

import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/app/services/base_client.dart';
import 'package:exquis8_hotel_app/utils/Api_Constant.dart';

class HotelApis {
  getMainPage({
    required Function(Map hotelData) onSuccess,
    required Function(ApiException)? onError,
  }) async {
    await BaseClient.get(
      APIConstants.homeItem,
      onSuccess: (response) {
        var json = jsonDecode(response.data);
        onSuccess(
          json,
        );
      },
      onError: onError,
    );
  }

  getItemMenu({
    required Function(Map itemMenyData) onSuccess,
    required Function(ApiException)? onError,
  }) async {
    await BaseClient.get(
      APIConstants.getItemMenu,
      onSuccess: (response) {
        var json = jsonDecode(response.data);
        onSuccess(
          json,
        );
      },
      onError: onError,
    );
  }

  getHotelDetails({
    required Function(Map hotelDetails) onSuccess,
    required Function(ApiException)? onError,
  }) async {
    await BaseClient.get(
      APIConstants.hotelDetails,
      onSuccess: (response) {
        var json = jsonDecode(response.data);

        onSuccess(
          json,
        );
      },
      onError: onError,
    );
  }
}
