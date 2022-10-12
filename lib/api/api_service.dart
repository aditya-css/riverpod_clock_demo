import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'api_constants.dart';
import 'model/time_response.dart';
import 'model/time_zone_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET(ApiConst.timeZoneListPath)
  Future<TimeZoneResponse> getTimeZonesList();

  @GET(ApiConst.timeByZonePath)
  Future<TimeResponse> getTimeByZone(@Query('zone') String timeZone);
}
