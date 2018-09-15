import 'package:flutter/material.dart';
import 'package:weathr/weather_route.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:weathr/utils/utils.dart' as utils;
import 'package:weathr/weather_info.dart';

Future<WeatherInfo> getData(String userInputCity) async{
  var apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=$userInputCity&appid=${utils.appKey}&units=imperial";
  var response =  await http.get(apiUrl);
  Map rawData = json.decode(response.body);

  var city = rawData['name'];
  var temp = rawData['main']['temp'];
  var high = rawData['main']['temp_max'];
  var low = rawData['main']['temp_min'];
  var day = rawData['dt'];
  var description =  rawData['weather'][0]['main'];
  print(description.toString());
  var weatherInfo = new WeatherInfo(city, temp, high, low, day,"Clouds");
  return weatherInfo;

}

void goToWeatherRoute(String city, BuildContext context) async{
  WeatherInfo data = await getData(city);
  Navigator.push(context, MaterialPageRoute(builder: (context)=> new WeatherRoute(data)));
}
class InputCityRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new InputCityRouteState();
  }

}

class InputCityRouteState extends State<InputCityRoute>{
  @override
  Widget build(BuildContext context) {
    var _cityInputController = new TextEditingController();
    var _appBar = new AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: new Text(""),
    );
    var _body = new Container(
      padding: EdgeInsets.fromLTRB(50.0, 200.0, 50.0, 0.0),
      color: Colors.white,
      child: new Center(
        child: new Column(

          children: <Widget>[
            new Text("W E A T H R",
            style: new TextStyle(
              fontSize: 20.0,

            ),),
            new Padding(padding: EdgeInsets.all(10.0)),
            new TextField(

              controller: _cityInputController,
              onSubmitted: (String str)=> goToWeatherRoute(str, context),
              decoration: new InputDecoration(
                hintStyle: new TextStyle(letterSpacing: 3.0,),
                hintText: " enter a city name",
              ),
              //controller: _cityInputController,

            ),
          ],
        ),
      ),
    );
    var _scaffold = new Scaffold(
      appBar: _appBar,
      body: _body,
    );

    return Container(
      child: _scaffold,
    );
  }
}