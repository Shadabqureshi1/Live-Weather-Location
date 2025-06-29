import 'package:flutter/material.dart';
import 'package:whetherlocation/weathermodel.dart';
import 'loadingscreen.dart';
import 'citylocation.dart';
import 'package:geolocator/geolocator.dart';
import 'locationscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'screen1',
      routes: {
        'screen1': (context) => loadingscreen(),
        'screen2': (context) => Locationscreen(Locationweather: Weathermodel),
        'screen3': (context) => Citylocation(),
      },
      
    );
  }
}
