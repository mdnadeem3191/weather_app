import 'dart:convert';

import 'package:http/http.dart';

class Networking {
  String location;
  Networking({required this.location});

  String? airSpeed;
  String? humidity;
  String? description;
  String? temprature;
  String? main;
  String? icon;
  Future<void> getData() async {
    try {
      Response responce = await get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$location&appid=cf2c9e5af2e4c1d9f1dabb542a131a51'));
      Map data = jsonDecode(responce.body); //getting all data

      //Getting temp,himidity
      Map mainData = data["main"];
      double getTemp = mainData["temp"] - 273.15; //getting temprature
      String getHumidity = mainData["humidity"].toString(); //getting humidity

      //Getting main,description,icon
      List weatherData = data["weather"];
      Map weatherMainData = weatherData[0];
      String getMain = weatherMainData["main"]; //getiing main
      String getDescription =
          weatherMainData["description"]; //getting description
      String getIcon = weatherMainData["icon"];

      //getting airspeed
      Map windData = data["wind"];
      double getAirspeed = windData["speed"] - 0.27777777777778;

      airSpeed = (getAirspeed.toString()).substring(0, 4);
      humidity = getHumidity;
      description = getDescription;

      temprature = (getTemp.toString()).substring(0, 4);
      main = getMain;
      icon = getIcon;
    } catch (error) {
      airSpeed = "NA";
      humidity = "NA";
      description = "NA";
      temprature = "NA";
      main = "NA";
      icon = "01d";
    }
  }
}
