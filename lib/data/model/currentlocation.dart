import 'package:flutter/material.dart';

class CurrentLocation {
  final String locationName;
  final String locationAddress;
  final double? latitude;
  final double? longitude;

  CurrentLocation({
    required this.locationName,
    required this.locationAddress,
    required this.longitude,
    required this.latitude
  });

  factory CurrentLocation.fromJson(Map<dynamic, dynamic> parsedJson) {
    return new CurrentLocation(
        locationName: parsedJson['locationName'] ?? "",
        locationAddress: parsedJson['locationAddress'] ?? "",
        longitude: parsedJson['longitude'] ?? "",
        latitude: parsedJson['latitude'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "locationName": this.locationName,
      "locationAddress": this.locationAddress,
      "longitude": this.longitude,
      "latitude": this.latitude,
    };
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CurrentLocation &&
        o.locationName == locationName &&
        o.locationAddress == locationAddress &&
        o.latitude == latitude &&
        o.longitude == longitude;
  }

}