import 'package:flutter/material.dart';
import 'package:json_kullanimi/local_json.dart';
import 'package:json_kullanimi/remote_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json package api demo heka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => MyMenutoNavigate(),
        "localjsonkullanimi": (context) => LocalJsonKullanimi(),
        "remotejsonkullanimi": (context)=> RemoteJsonKullanimi(),
      },
    );
  }
}

class MyMenutoNavigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JSON kullanım türleri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Local JSON"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocalJsonKullanimi()));
                },
              ),
              RaisedButton(
                child: Text("Remote API JSON"),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RemoteJsonKullanimi()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
