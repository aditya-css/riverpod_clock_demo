class TimeZoneModel {
  final String? countryCode;
  final String? countryName;
  final String? zoneName;
  final int? gmtOffset;
  final int? timestamp;
  final String? countryZoneName;

  const TimeZoneModel({
    this.countryCode,
    this.countryName,
    this.zoneName,
    this.gmtOffset,
    this.timestamp,
    this.countryZoneName,
  });

  factory TimeZoneModel.fromJson(Map<String, dynamic> json) {
    String? countryZoneName = json['countryName'];
    String? zone = json['zoneName'];
    if (countryZoneName != null && zone != null) {
      zone = zone.contains('/') ? zone.split('/').last : zone;
      countryZoneName = '$countryZoneName - $zone';
    }
    return TimeZoneModel(
      countryCode: json['countryCode'],
      countryName: json['countryName'],
      zoneName: json['zoneName'],
      gmtOffset: json['gmtOffset'],
      timestamp: json['timestamp'],
      countryZoneName: countryZoneName,
    );
  }

  Map<String, dynamic> toJson() => {
        'countryCode': countryCode,
        'countryName': countryName,
        'zoneName': zoneName,
        'gmtOffset': gmtOffset,
        'timestamp': timestamp,
      };
}
