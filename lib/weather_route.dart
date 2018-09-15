import 'package:flutter/material.dart';
import 'package:weathr/input_city_route.dart';
import 'package:weathr/weather_info.dart';

class WeatherRoute extends StatefulWidget{
  final WeatherInfo _weatherInfo;
  @override
  State<StatefulWidget> createState() {
    return new WeatherRouteState(_weatherInfo);
  }
  WeatherRoute(this._weatherInfo);

}

class WeatherRouteState extends State<WeatherRoute>{
  WeatherInfo _weatherInfo;

  WeatherRouteState(this._weatherInfo);

  @override
  Widget build(BuildContext context) {
    //APP BAR

    var _appBar = new AppBar(elevation: 0.0, title: new Text(""), backgroundColor: Colors.white,
      iconTheme: new IconThemeData(color: Colors.black),

    );

    //DIVIDERS
    var _standardDivider = new Container(color: Colors.black, height: 1.0, width: 300.0,);

    //MOST TXT WILL USE THIS STYLING
    var _standardTextStyle = new TextStyle(fontSize: 28.0, letterSpacing: 15.0, fontWeight: FontWeight.w300,);

    //STANDARD PADDING
    var _standardPadding =  new Padding(padding: EdgeInsets.all(18.0));

    //ROW SHOWING TEMPERATURE
    var _tempRow = new Row(
      children: <Widget>[
        new Padding(padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 25.0)),
        new Text("${_weatherInfo.tempF.round()}°F", style: new TextStyle(fontSize: 50.0,fontWeight: FontWeight.w300),),
        new Padding(padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0)),
        new Column(
          children: <Widget>[
            new Text("${_weatherInfo.high.round()}",style: new TextStyle(letterSpacing: 2.0),),
            new Padding(padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 0.0),),
            new Transform.rotate(
                angle: 0.85,
                child: new Container(height: 12.0, width: 12.0, decoration: new BoxDecoration(color: Colors.black,),),
            ),
            new Padding(padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 0.0),),
            new Text("${_weatherInfo.low.round()}",style: new TextStyle(letterSpacing: 2.0),),
          ],
        ),
        new Padding(padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0)),
        new Text("${_weatherInfo.tempC.round()}°C", style: new TextStyle(fontSize: 50.0, fontWeight: FontWeight.w300, color: Colors.grey,),),
      ],
    );

    //CONTAINER PUTTING IT TOGETHER
    var _mainContainer = new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          _standardPadding,
          new Text(_weatherInfo.city, style: _standardTextStyle,),
          _standardPadding,
          _weatherInfo.image,
          _standardPadding,
          _tempRow,
          _standardPadding,
          _standardDivider,
          _standardPadding,
          new Text(_weatherInfo.clothing, style: _standardTextStyle ,),
          _standardPadding,
          _standardDivider,
          _standardPadding,
          new Text("${_weatherInfo.day}", style: _standardTextStyle ,),
        ],
      ),
    );

    //A LITTLE EXTRA BUT IM JUST LIKE THAT
    var _scaffold = new Scaffold(
      backgroundColor: Colors.white,
      drawer: new Drawer(
        child: new InputCityRoute(),
      ),
      appBar: _appBar,
      body: new ListView(
        children: <Widget>[
          new Center(
            child: _mainContainer,
          ),
        ],
      )
    );
    return new Container(child: _scaffold,);

  }
}