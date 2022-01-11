import 'dart:io';

import 'package:dio/dio.dart';
import 'package:urancodetest/resources/resources.dart';

//dio base class to make our http requests, specifying some base properties....
class ApiHandler {
  ApiHandler() {
    const baseUrl = baseURL;

    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );

    _dio = Dio(options);

    final headers = {
      Headers.acceptHeader: '*/*',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    _dio.options.headers = headers;
  }

  Dio _dio = Dio();

  //the get method
  Future get() async {
    return _dio.get(baseURL);
  }
}
