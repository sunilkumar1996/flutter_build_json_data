import 'dart:convert';
import 'package:flutter/material.dart';


void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal, 
  ),
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState()=> new HomePageState();

}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    List data;
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
       title: Text("Load Json App"), 
      ),
      body: new Container(
        child: Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).load('load_json/persion.json'),
            builder: (context, snapshot) {
              var mydata = JSON.decode(snapshot.data.toString());
              return new ListView.builder(itemBuilder: (BuildContext context, int index){
                return new Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text("name: " + mydata[index]['name']),
                      new Text("Age: " + mydata[index]['age']),
                      new Text("Email: " + mydata[index]['email']),
                      new Text("Genger: " + mydata[index]['gender']),
                    ],
                  ), 
                );
              },
              itemCount: mydata == null ? 0: mydata.length,
              );
            }, 
          ),
        ), 
      ),
    );
  }
}
