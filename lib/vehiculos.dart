import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MaterialApp(
  home: new VehiclesPage(),
));

class VehiclesPage extends StatefulWidget {
  @override
  VehiclesPageState createState() => new VehiclesPageState();
}

class VehiclesPageState extends State<VehiclesPage> {

  final String url="https://swapi.co/api/vehicles/";
  List data;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"}

    );

    print(response.body);

    setState(() {
      var toJsonData = json.decode(response.body);
      data = toJsonData['results'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Vehiculos"),
          backgroundColor: Colors.cyan,
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  child: new Center(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Card(
                              child: new Container(
                                child: new Text(data[index]['name']),
                                padding: const EdgeInsets.all(21),
                              ))
                        ],
                      )));
            }));
  }
}