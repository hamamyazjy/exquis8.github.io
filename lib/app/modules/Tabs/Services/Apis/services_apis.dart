import 'dart:convert';

import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/app/services/base_client.dart';
import 'package:exquis8_hotel_app/utils/Api_Constant.dart';

class ServicesApis {

  getServicesHotel({
    required Function(Map servicesHotel) onSuccess,
    required Function(ApiException)? onError,
  }) async {
    await BaseClient.get(
      APIConstants.servicesHotel,
      onSuccess: (response) {
        var json = jsonDecode(response.data);

        onSuccess(
          json,
        );
      },
      onError: onError,
    );
  }

  getServicesLaundryHotel({
    required Function(Map servicesLaundryHotel) onSuccess,
    required Function(ApiException)? onError,
    required String services,
  }) async {
    await BaseClient.get(
      APIConstants.subServices,
      queryParameters: {
        'services':services
      },
      onSuccess: (response) {
        var json = jsonDecode(response.data);

        onSuccess(
          json,
        );
      },
      onError: onError,
    );
  }

   addRequestOrder({
    required Function(Map managementLaundryData) onSuccess,
    required Function(ApiException)? onError,
    required Map<String, dynamic> data,
  }) async {
    await BaseClient.post(
      APIConstants.addRequestOrder,
      postData: data,
      isRaw: true,
      onSuccess: (response) {
        onSuccess(jsonDecode(response.data));
      },
      onError: onError,
    );
  }
  
}
