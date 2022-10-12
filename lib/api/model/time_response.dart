class TimeResponse {
  final String? status;
  final String? message;
  final String? countryCode;
  final String? countryName;
  final String? regionName;
  final String? cityName;
  final String? zoneName;
  final String? abbreviation;
  final int? gmtOffset;
  final String? dst;
  final int? zoneStart;
  final int? zoneEnd;
  final String? nextAbbreviation;
  final int? timestamp;
  final String? formatted;

  const TimeResponse({
    this.status,
    this.message,
    this.countryCode,
    this.countryName,
    this.regionName,
    this.cityName,
    this.zoneName,
    this.abbreviation,
    this.gmtOffset,
    this.dst,
    this.zoneStart,
    this.zoneEnd,
    this.nextAbbreviation,
    this.timestamp,
    this.formatted,
  });

  factory TimeResponse.fromJson(Map<String, dynamic> json) => TimeResponse(
        status: json['status'],
        message: json['message'],
        countryCode: json['countryCode'],
        countryName: json['countryName'],
        regionName: json['regionName'],
        cityName: json['cityName'],
        zoneName: json['zoneName'],
        abbreviation: json['abbreviation'],
        gmtOffset: json['gmtOffset'],
        dst: json['dst'],
        zoneStart: json['zoneStart'],
        zoneEnd: json['zoneEnd'],
        nextAbbreviation: json['nextAbbreviation'],
        timestamp: json['timestamp'],
        formatted: json['formatted'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'countryCode': countryCode,
        'countryName': countryName,
        'regionName': regionName,
        'cityName': cityName,
        'zoneName': zoneName,
        'abbreviation': abbreviation,
        'gmtOffset': gmtOffset,
        'dst': dst,
        'zoneStart': zoneStart,
        'zoneEnd': zoneEnd,
        'nextAbbreviation': nextAbbreviation,
        'timestamp': timestamp,
        'formatted': formatted,
      };
}
