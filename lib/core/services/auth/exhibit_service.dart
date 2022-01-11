import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:urancodetest/core/helpers/services_helpers.dart';
import 'package:urancodetest/core/models/models.dart';

class ExhibitRequestService {
  // the webservice for the http requests
  ExhibitRequestService() {
    _apiHandler = ApiHandler();
  }
  ApiHandler _apiHandler = ApiHandler();

  late DioError dioError;

  // get Exhibit method
  Future<ExhibitList> getExhibits() async {
    ApiResponse apiResponse = ApiResponse(error: false);
    try {
      final res = await _apiHandler.get();
      apiResponse.data = res.data;
      apiResponse.error = false;
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 500) {
        } else {
          final error = e.response!.data as Map;
          log('$error');
        }
      }
      apiResponse.error = true;
    }
    return ExhibitList.fromJson(apiResponse.data);
  }
}
