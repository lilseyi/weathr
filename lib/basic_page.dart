import 'package:flutter/material.dart';

class BasicPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BasicPageStateState();
  }

}

class BasicPageStateState extends State<BasicPage>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.yellow,
      home: new Container(
        color: Colors.yellow,
        child: new Text("Imma Basic Page"),
      )
    );
  }

}