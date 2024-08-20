// ignore_for_file: constant_identifier_names
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exquis8_hotel_app/app/models/api_exceptions.dart';
import 'package:exquis8_hotel_app/utils/Api_Constant.dart';
import 'package:exquis8_hotel_app/utils/constants.dart';
import 'package:exquis8_hotel_app/utils/locale_database_service.dart';

BaseOptions _dioConfig = BaseOptions(
  baseUrl: APIConstants.baseUrl,
  connectTimeout: 50000,
  receiveTimeout: 50000,
  headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  },
);

class BaseClient {
  static final Dio _dio = Dio(_dioConfig);
  static const int TIME_OUT_DURATION = 100;

  // GET request
  static get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    required Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    Function? onLoading,
  }) async {
    try {
      String? token = LocaleDatabase().getData(Constants.token);
      log('token  $token');

      // 1) indicate loading state
      onLoading?.call();
      // 2) try to perform http request
      var response = await _dio
          .get(
            url,
            onReceiveProgress: onReceiveProgress,
            queryParameters: queryParameters,
            
            options: Options(
              
              headers: {
                'login': '$token',
                 "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Headers":
                    "'Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token'",
                "Access-Control-Allow-Methods":
                    "GET,PUT,POST,DELETE,PATCH,OPTIONS"
              },
            ),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      if (response.statusCode != 200) {
        throw ApiException(url: url, message: response.data['message']);
      }
      // 3) return response (api done successfully)
      await onSuccess(response);
    } on DioError catch (error) {
      // dio error (api reach the server but not performed successfully
      // no internet connection
      if (error.message.toLowerCase().contains('socket')) {
        onError?.call(ApiException(
              message: "no internet connection",
              url: url,
            )) ??
            _handleError("no internet connection");
      }

      // no response
      if (error.response == null) {
        var exception = ApiException(
          url: url,
          message: error.message,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }

      if (error.response?.statusCode == 401) {
        var exception = ApiException(
          message: "UnAuthorized Access",
          url: url,
          statusCode: 401,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }

      // check if the error is 500 (server problem)
      if (error.response?.statusCode == 500) {
        var exception = ApiException(
          message: "Server Error",
          url: url,
          statusCode: 500,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }
    } on SocketException {
      // No internet connection
      onError?.call(ApiException(
            message: "No Internet Connection",
            url: url,
          )) ??
          _handleError("No Internet Connection");
    } on TimeoutException {
      // Api call went out of time
      onError?.call(ApiException(
            message: "Api call went out of time",
            url: url,
          )) ??
          _handleError("Api call went out of time");
    } catch (error) {
      // unexpected error for example (parsing json error)
      onError?.call(ApiException(
            message: error.toString(),
            url: url,
          )) ??
          _handleError(error.toString());
    }
  }

  static post(
    String url, {
    Map<String, dynamic>? postData,
    bool isRaw = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    required Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
  }) async {
    try {
      String? token = LocaleDatabase().getData(Constants.token);

      var response = await _dio
          .post(
            url,
            data: postData != null
                ? isRaw
                    ? json.encode(postData)
                    : FormData.fromMap(postData)
                : null,
            onReceiveProgress: onReceiveProgress,
            queryParameters: queryParameters,
            options: Options(
              validateStatus: (status) => status! < 500,
              contentType: Headers.contentTypeHeader,
              headers: {
                'login': '$token',
                "Access-Control-Allow-Origin": "*",
                "Access-Control-Allow-Headers":
                    "'Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token'",
                "Access-Control-Allow-Methods":
                    "GET,PUT,POST,DELETE,PATCH,OPTIONS"
              },
              
            ),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      var json2 = jsonDecode(response.data);

      if (json2['success'] == false) {
        throw ApiException(
          url: url,
          message: json2['message'],
          response: response,
        );
      }
      // 3) return response (api done successfully)
      await onSuccess(response);
    } on DioError catch (error) {
      // dio error (api reach the server but not performed successfully
      // no internet connection
      if (error.message.toLowerCase().contains('socket')) {
        onError?.call(ApiException(
              message: "no internet connection",
              url: url,
            )) ??
            _handleError("no internet connection");
      }

      // no response
      if (error.response == null) {
        var exception = ApiException(
          url: url,
          message: error.message,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }

      // check if the error is 500 (server problem)
      if (error.response?.statusCode == 500) {
        var exception = ApiException(
          message: "Server Error",
          url: url,
          statusCode: 500,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }
    } on SocketException {
      // No internet connection
      onError?.call(ApiException(
            message: "No Internet Connection",
            url: url,
          )) ??
          _handleError("No Internet Connection");
    } on TimeoutException {
      // Api call went out of time
      onError?.call(ApiException(
            message: "Api call went out of time",
            url: url,
          )) ??
          _handleError("Api call went out of time");
    } catch (error) {
      // unexpected error for example (parsing json error)
      if (error is ApiException) {
        onError?.call(error) ?? handleApiError(error);
      } else {
        onError?.call(ApiException(
              message: error.toString(),
              url: url,
            )) ??
            _handleError(error.toString());
      }
    }
  }

  static put(
    String url, {
    Map<String, dynamic>? postData,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    required Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
  }) async {
    try {
      String? token = LocaleDatabase().getData(Constants.token);

      var response = await _dio
          .put(
            url,
            data: postData != null ? FormData.fromMap(postData) : null,
            onReceiveProgress: onReceiveProgress,
            queryParameters: queryParameters,
            options: Options(
              validateStatus: (status) => status! < 500,
              headers: {
                'login': '$token',
              },
            ),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      if (response.data['status'] == false) {
        throw ApiException(
          url: url,
          message: response.data['message'],
          response: response,
        );
      }
      // 3) return response (api done successfully)
      await onSuccess(response);
    } on DioError catch (error) {
      // dio error (api reach the server but not performed successfully
      // no internet connection
      if (error.message.toLowerCase().contains('socket')) {
        onError?.call(ApiException(
              message: "no internet connection",
              url: url,
            )) ??
            _handleError("no internet connection");
      }

      // no response
      if (error.response == null) {
        var exception = ApiException(
          url: url,
          message: error.message,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }

      // check if the error is 500 (server problem)
      if (error.response?.statusCode == 500) {
        var exception = ApiException(
          message: "Server Error",
          url: url,
          statusCode: 500,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }
    } on SocketException {
      // No internet connection
      onError?.call(ApiException(
            message: "No Internet Connection",
            url: url,
          )) ??
          _handleError("No Internet Connection");
    } on TimeoutException {
      // Api call went out of time
      onError?.call(ApiException(
            message: "Api call went out of time",
            url: url,
          )) ??
          _handleError("Api call went out of time");
    } catch (error) {
      // unexpected error for example (parsing json error)
      if (error is ApiException) {
        onError?.call(error) ?? handleApiError(error);
      } else {
        onError?.call(ApiException(
              message: error.toString(),
              url: url,
            )) ??
            _handleError(error.toString());
      }
    }
  }

  static delete(
    String url, {
    Map<String, dynamic>? postData,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    required Function(ApiException)? onError,
  }) async {
    try {
      String? token = LocaleDatabase().getData(Constants.token);

      var response = await _dio
          .delete(
            url,
            data: postData != null ? FormData.fromMap(postData) : null,
            queryParameters: queryParameters,
            options: Options(
              validateStatus: (status) => status! < 500,
              headers: {
                'login': '$token',
              },
            ),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      if (response.data['status'] == false) {
        throw ApiException(
          url: url,
          message: response.data['message'],
          response: response,
        );
      }
      // 3) return response (api done successfully)
      await onSuccess(response);
    } on DioError catch (error) {
      // dio error (api reach the server but not performed successfully
      // no internet connection
      if (error.message.toLowerCase().contains('socket')) {
        onError?.call(ApiException(
              message: "no internet connection",
              url: url,
            )) ??
            _handleError("no internet connection");
      }

      // no response
      if (error.response == null) {
        var exception = ApiException(
          url: url,
          message: error.message,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }

      // check if the error is 500 (server problem)
      if (error.response?.statusCode == 500) {
        var exception = ApiException(
          message: "Server Error",
          url: url,
          statusCode: 500,
        );
        return onError?.call(exception) ?? handleApiError(exception);
      }
    } on SocketException {
      // No internet connection
      onError?.call(ApiException(
            message: "No Internet Connection",
            url: url,
          )) ??
          _handleError("No Internet Connection");
    } on TimeoutException {
      // Api call went out of time
      onError?.call(ApiException(
            message: "Api call went out of time",
            url: url,
          )) ??
          _handleError("Api call went out of time");
    } catch (error) {
      // unexpected error for example (parsing json error)
      if (error is ApiException) {
        onError?.call(error) ?? handleApiError(error);
      } else {
        onError?.call(ApiException(
              message: error.toString(),
              url: url,
            )) ??
            _handleError(error.toString());
      }
    }
  }

  /// handle error automaticly (if user didnt pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason
  static handleApiError(ApiException apiException) {
    // Map json = apiException.response?.data;
    // String msg = json['message'] ?? apiException.message;

    // CustomSnackBar.showCustomErrorToast(message: msg);
  }

  /// handle errors without response (500, out of time, no internet,..etc)
  static _handleError(String msg) {
    // CustomSnackBar.showCustomErrorToast(message: msg);
  }
}
