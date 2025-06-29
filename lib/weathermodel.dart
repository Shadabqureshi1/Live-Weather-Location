import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:whetherlocation/location.dart';
import 'package:http/http.dart' as http;
import 'package:whetherlocation/networking.dart';
import 'locationscreen.dart';


const apikey = '6856474ada6ffde3ca281a749501f19a';

class Weathermodel {

  Future<dynamic> getCityWeather (String cityname) async {

    var apicity = 'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=d5a4e05d62500691142416a26308aeb2&units=metric';
    NetworkHelper apicall = NetworkHelper(url: apicity);

    var weatherData = await apicall.getData();
    return weatherData;

  }


  Future<dynamic> getweatherdataandlocation() async {

  Location locationobject = Location();
  await locationobject.getCurrentLocation();

  NetworkHelper apicall = NetworkHelper(url:
  'https://api.openweathermap.org/data/2.5/weather?lat=${locationobject.latitude}&lon=${locationobject.longitude}&appid=$apikey&units=metric', );
  var weatherdata = await apicall.getData();

  return weatherdata;
}


  getmessage (int temp) {
    if (temp > 25) {
      return 'its 🍦 time in ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in ';
    } else if (temp < 10) {
      return 'Its Cold outside in ';
    } else {
      return 'Bring your jacket in  ';
    }
  }

  gettempIcon (int id){

    if (id < 300){
      return '⛈️';
    } else if (id < 400){
      return '🌩️';
    } else if (id < 600){
      return '🌧️';
    } else if (id < 700){
      return '🌨️';
    } else if (id < 800){
      return '⛅';
    } else if (id <= 800){
      return '☀️';
    } else if (id >= 800){
      return '☁️';
}

}



}