import 'package:dio/dio.dart';

import 'api_service.dart';

class ApiConst {
  static const String apiKey = 'P4L3KSYLFU5V';
  static const String baseUrl = 'http://api.timezonedb.com/v2.1';
  static const String keyFormatQuery = '?key=$apiKey&format=json';
  static const String timeZoneListPath = '/list-time-zone$keyFormatQuery';
  static const String timeByZonePath = '/get-time-zone$keyFormatQuery&by=zone';

  static ApiService client = ApiService(Dio(BaseOptions(baseUrl: baseUrl)));
}
