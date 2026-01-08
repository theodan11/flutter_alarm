import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final double lat;
  final double lon;
  final String locationName;

  const LocationModel({
    required this.lat,
    required this.lon,
    this.locationName = '',
  });

  LocationModel copyWith({double? lat, double? lon, String? locationName}) {
    return LocationModel(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      locationName: locationName ?? this.locationName,
    );
  }

  @override
  List<Object?> get props => [lat, lon, locationName];
}
