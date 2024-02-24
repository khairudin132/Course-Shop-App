import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioService {
  DioService() {
    initialiseDioConfiguration();
  }

  late Dio dio;

  void initialiseDioConfiguration() {
    final options = BaseOptions(
      // baseUrl: 'http://10.0.2.2:8000/',
      // baseUrl: 'http://127.0.0.1:8000/',
      baseUrl: 'https://ecc2-115-134-105-243.ngrok-free.app/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors
      ..add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            return handler.next(options);
          },
          onResponse: (response, handler) {
            return handler.next(response);
          },
          onError: (DioException e, handler) {
            // final error = _createApiResult(e);

            return handler.next(e);
          },
        ),
      )
      ..add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
  }

  DioException _createApiResult(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          message: "Connection timed out",
        );

      case DioExceptionType.sendTimeout:
        return DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          message: "Send timed out",
        );

      case DioExceptionType.receiveTimeout:
        return DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          message: "Receive timed out",
        );

      case DioExceptionType.badCertificate:
        return DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          message: "Bad SSL certificates",
        );

      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case 400:
            return DioException(
              requestOptions: error.requestOptions,
              response: error.response,
              message: "Bad request",
            );
          case 401:
            return DioException(
              requestOptions: error.requestOptions,
              response: error.response,
              message: "Permission denied",
            );
          case 500:
            return DioException(
              requestOptions: error.requestOptions,
              response: error.response,
              message: "Server internal error",
            );
        }
        return DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          message: "Server bad response",
        );

      case DioExceptionType.cancel:
        return DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          message: "Server canceled it",
        );

      case DioExceptionType.connectionError:
        return DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          message: "Connection error",
        );

      case DioExceptionType.unknown:
        return DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          message: "Unknown error",
        );
    }
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Options requestOptions = Options(
      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Authorization':
            'Bearer 26|TJRRgBe5u9EWB3JuAvbpfZHwQmSl8Q2WjroVU2pH52de2595',
      },
    );

    // Map<String, dynamic>? authorization = _getAuthorizationHeader();

    // if (authorization != null && authorization.isNotEmpty) {
    //   requestOptions.headers?.addAll(authorization);
    // }

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response.data;
  }

  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Options requestOptions = Options(
      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        'Authorization':
            'Bearer 26|TJRRgBe5u9EWB3JuAvbpfZHwQmSl8Q2WjroVU2pH52de2595',
      },
    );

    // Map<String, dynamic>? authorization = _getAuthorizationHeader();

    // if (authorization != null && authorization.isNotEmpty) {
    //   requestOptions.headers?.addAll(authorization);
    // }

    var response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response.data;
  }

  Map<String, dynamic>? _getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    // var accessToken = getIt<AuthenticationRepo>().getAccountToken;
    // if (accessToken.isNotEmpty) {
    headers['Authorization'] =
        'Bearer 26|TJRRgBe5u9EWB3JuAvbpfZHwQmSl8Q2WjroVU2pH52de2595';
    // headers['Authorization'] = 'Bearer $accessToken';
    // }
    return headers;
  }
}
