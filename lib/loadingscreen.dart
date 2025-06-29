import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:whetherlocation/location.dart';
import 'package:http/http.dart' as http;
import 'package:whetherlocation/networking.dart';
import 'package:whetherlocation/weathermodel.dart';
import 'locationscreen.dart';

// const apikey = 'd5a4e05d62500691142416a26308aeb2';
const apikey = '6856474ada6ffde3ca281a749501f19a';

class loadingscreen extends StatefulWidget {
  const loadingscreen({super.key});


  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {


  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getcurrentlocation();
  }

  Future<void> getcurrentlocation() async {

    var weatherData = await Weathermodel().getweatherdataandlocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) => Locationscreen(
      Locationweather: weatherData,
    )));
  }



  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            ),

            Text('Fetching data...',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                color: Colors.white
              ),
            ),
          ],
        ),


      );
    }
  }

