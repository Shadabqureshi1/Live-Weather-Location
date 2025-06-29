import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whetherlocation/citylocation.dart';
import 'loadingscreen.dart';
import 'networking.dart';
import 'weathermodel.dart';

const centertext = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'BebasNeue',
  fontSize: 25
);


class Locationscreen extends StatefulWidget {
 Locationscreen({required this.Locationweather});

  final Locationweather;

  @override
  State<Locationscreen> createState() => _LocationscreenState();
}


class _LocationscreenState extends State<Locationscreen> {


  Weathermodel weathericon = Weathermodel();
  String? name;
  int? temperature;
  String? id;
  String? IconText;
  String? main;
  String? getmsg;

  @override
  void initState() {
    super.initState();
    updateUI(widget.Locationweather);
  }

   void updateUI(dynamic weatherdata)  {

    setState(() {

      if (weatherdata == null || weatherdata['name'] == null) {
        name = 'Unavailable';
        temperature = 0;
        main = 'No Data';
        getmsg = 'Please enable location or check internet!';
        IconText = '❌'; // Default icon for no data
        return;
      }

      name = weatherdata['name'];
      double temp = weatherdata['main']['temp'];
      temperature = temp.toInt();
      var id = weatherdata['weather'][0]['id'];
      IconText = weathericon.gettempIcon(id);
      main = weatherdata['weather'][0]['main'];
      getmsg = weathericon.getmessage(temp.toInt());


    });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Container(
                 decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage('assets/backimg.jpeg'),
                 fit: BoxFit.cover
                 ),
             ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () async {
                        var weatherrelocate = await weathericon.getweatherdataandlocation();
                        updateUI(weatherrelocate);
                      }, child: Icon(Icons.near_me,
                      color: Colors.orange,
                        size: 40,
        
                      )
                      ),
                      TextButton(onPressed: () async {
                        var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Citylocation();
                        }));
                        
                        if (typedName != null){
                          var weatherData = await weathericon.getCityWeather(typedName);
                          updateUI(weatherData);
                        }

        
                      }, child: Icon(Icons.location_city,
                        color: Colors.orange,
                        size: 40,
        
                      ))
        
                ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$temperature°C',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 50
                          )
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('$IconText',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50
                        )
                      ),
                    ],
                  ),
        
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('WEATHER CONDITION : ',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$main',
                        style: centertext,
                        ),
                      ),
        
                    ],
                  ),
        
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 200),
                    child: Text('$getmsg$name'
                      ,

                      style: centertext,
                      textAlign: TextAlign.center,
                    ),
                  ),
        
                ],
              ),
            ),
          ),
      ),
    );
  }
}

