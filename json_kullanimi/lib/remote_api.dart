import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_kullanimi/models/Gonderi.dart';
//kullandığım kaynak: https://jsonplaceholder.typicode.com/guide.html
class RemoteJsonKullanimi extends StatefulWidget {
  @override
  _RemoteJsonKullanimiState createState() => _RemoteJsonKullanimiState();
}

class _RemoteJsonKullanimiState extends State<RemoteJsonKullanimi> {

  Future<List<Gonderi>> _gonderiGetir() async{
    var response =await http.get("https://jsonplaceholder.typicode.com/posts");
    if(response.statusCode ==200){
      return (jsonDecode(response.body) as List).map((tekGonderiMap)=> Gonderi.fromJsonMap(tekGonderiMap)).toList();
    }else{
      throw Exception("HATA!!! ${response.statusCode}");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Json Kullanımı"),
      ),
      body: FutureBuilder(future: _gonderiGetir(), builder: (BuildContext context, AsyncSnapshot<List<Gonderi>>snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount:snapshot.data.length,itemBuilder: (context, index){
            return ListTile(
              title: Text(snapshot.data[index].title),
              subtitle: Text(snapshot.data[index].body),
              leading: CircleAvatar(child:Text(snapshot.data[index].id.toString()) ,),
            );
          });
        }else{
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
