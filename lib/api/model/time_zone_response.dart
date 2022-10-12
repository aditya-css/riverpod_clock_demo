import 'time_zone_model.dart';

class TimeZoneResponse {
  final String? status;
  final String? message;
  final List<TimeZoneModel>? zones;

  const TimeZoneResponse({
    this.status,
    this.message,
    this.zones,
  });

  factory TimeZoneResponse.fromJson(Map<String, dynamic> json) =>
      TimeZoneResponse(
        status: json['status'],
        message: json['message'],
        zones: json['zones'] == null
            ? null
            : List<TimeZoneModel>.from(
                (json['zones'] as List)
                    .cast<Map<String, dynamic>>()
                    .map(TimeZoneModel.fromJson),
              ),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'zones': zones?.map((v) => v.toJson()).toList(),
      };
}
