import 'dart:ffi';

import 'package:whetherlocation/weathermodel.dart';

import 'loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'locationscreen.dart';

class Location {
  double? latitude;
  double? longitude;



  Future<void> getCurrentLocation() async {
    try {
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 100,
      );
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      // Set default values when location fails

      longitude = null;
      latitude = null;

    }
  }
}
