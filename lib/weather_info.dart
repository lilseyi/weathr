import 'package:flutter/material.dart';
class WeatherInfo {
  static var _thickness= 13.0;
  var _city;
  var _tempF;
  var _clothing = "T-SHIRT";
  var _image;
  var _tempC;
  var _high;
  var _low;
  var _day;
  var _description;

  static var _verticalPadding = new Padding(padding: EdgeInsets.symmetric(vertical: _thickness/2),);
  static var _horizontalPadding = new Padding(padding: EdgeInsets.symmetric(horizontal: _thickness/2),);

  static var _rainColor = Colors.blue;
  var _hazeImage = new Stack(
  children: <Widget>[
  new Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  new Padding(padding: EdgeInsets.symmetric(vertical: _thickness/4),),
  new Container(color: Colors.grey.shade200, width: 160.0, height: _thickness,),
  _verticalPadding,
  new Container(color: Colors.grey, width: 96.0, height: _thickness,margin: EdgeInsets.fromLTRB(64.0, 0.0, 0.0, 0.0),),
  _verticalPadding,
  new Container(color: Colors.grey.shade200, width: 160.0, height: _thickness,),
  _verticalPadding,
  new Container(color: Colors.grey, width: 160.0, height: _thickness,),
  _verticalPadding,
  new Container(color: Colors.grey.shade200, width: 64.0, height: _thickness,),
  _verticalPadding,
  new Container(color: Colors.grey, width: 160.0, height: _thickness,),
  _verticalPadding,
  ],
  )
  ],
  );

  var _rainImage = new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Container(color: _rainColor, width: _thickness, height: 160.0,),
      _horizontalPadding,
      new Container(child: new Column(
       children: <Widget>[
         new Container(color: _rainColor, height: 60.0,width: _thickness,margin: EdgeInsets.symmetric(vertical:20.0 ),),
         new Container(color: _rainColor, height: 60.0,width: _thickness,),

       ],
      ),),
      _horizontalPadding,
      new Container(color: _rainColor, width: _thickness, height: 65.0,),
      _horizontalPadding,
      new Container(color: _rainColor, width: _thickness, height: 70.0,margin: EdgeInsets.fromLTRB(0.0,90.0,0.0,0.0),),
      _horizontalPadding,
      new Container(color: _rainColor, width: _thickness, height: 120.0,margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,40.0),),
      _horizontalPadding,
      new Container(child: new Column(
        children: <Widget>[
          new Container(color: _rainColor, height: 32.0,width: _thickness,margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,32.0),),
          new Container(color: _rainColor, height: 48.0,width: _thickness,margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,16.0),),
          new Container(color: _rainColor, height: 32.0,width: _thickness,),


        ],
      ),),
    ],
  );

  var _cloudyImage = new Stack(
    children: <Widget>[
      new CircleAvatar(backgroundColor: Colors.yellow,radius: 80.0,),
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(padding: EdgeInsets.symmetric(vertical: _thickness/4),),
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 96.0, height: _thickness,margin: EdgeInsets.fromLTRB(64.0, 0.0, 0.0, 0.0),),
          _verticalPadding,
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 64.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
        ],
      )
    ],
  );
  var _cloudsImage = new Stack(
    children: <Widget>[
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(padding: EdgeInsets.symmetric(vertical: _thickness/4),),
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
          new Container(color: Colors.grey, width: 160.0, height: _thickness,),
          _verticalPadding,
        ],
      )
    ],
  );

  var _sunImage = new CircleAvatar(backgroundColor: Colors.yellow,radius: 80.0,);

  var _thunderImage = new CircleAvatar(backgroundColor: Colors.black,radius: 80.0,);
  var _snowImage = new CircleAvatar(backgroundColor: Colors.black,radius: 80.0,);
  var _defaultImage = new CircleAvatar(backgroundColor: Colors.black,radius: 80.0,);



  WeatherInfo(String city, this._tempF,this._high,this._low,int day, String description){
    this._tempC = (_tempF - 32)*(5/9);
    this._city = city.toUpperCase();
    this._day = toWeekDayString(DateTime.fromMillisecondsSinceEpoch(day*1000).weekday);
    useDescription(description);
  }

  String toWeekDayString(int intDay){
    switch(intDay){
      case 1: return "MONDAY"; break;
      case 2: return "TUESDAY"; break;
      case 3: return "WEDNESDAY"; break;
      case 4: return "THURSDAY"; break;
      case 5: return "FRIDAY"; break;
      case 6: return "SATURDAY"; break;
      case 7: return "SUNDAY"; break;
      default: return "NODAY";
    }
  }

  String useDescription(String description){
    switch(description){
      case "Rain": this._clothing = "RAINCOAT"; this._image = _rainImage; break;
      case "Sunny": this._clothing = "T-SHIRT"; this._image = _sunImage; break;
      case "Cloudy": this._clothing = "NICE DAY"; this._image = _cloudyImage; break;
      case "Clouds": this._clothing = "MEH"; this._image = _cloudsImage; break;
      case "Thunder": this._clothing = "STAYYOASSINSIDE"; this._image = _thunderImage; break;
      case "Haze": this._clothing = "BLIND"; this._image = _hazeImage; break;
      case "Snow": this._clothing = "SNOWGLOVES"; this._image = _snowImage; break;
      default: this._clothing = "NAKED"; this._image = _defaultImage;
    }
  }
  get day => _day;

  get low => _low;

  get high => _high;

  get tempC => _tempC;

  get clothing => _clothing;

  get tempF => _tempF;

  get city => _city;

  get description => _description;

  get image => _image;


}