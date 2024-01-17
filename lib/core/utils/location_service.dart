import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import '../../features/profile/data/models/location.dart';

@injectable
class LocationService {
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  Future<Location?> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        return null;
      }

      final Position position = await _geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );

      return Location(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } on LocationServiceDisabledException {
      debugPrint('Location services are disabled.');
      return null;
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }
}
