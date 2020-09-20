import 'package:flutter/material.dart';
import 'dart:convert';

import 'models/Araba.dart';

class LocalJsonKullanimi extends StatefulWidget {
  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List<Araba> tumarabalar;

  @override
  void initState() {
    super.initState();
    /* veriKaynaginiOku().then((gelenArabaListesi){
      setState(() {
        tumarabalar = gelenArabaListesi;
      });

    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local JSON Kullanımı"),
      ),
      body: Container(
          child: FutureBuilder(
              future: veriKaynaginiOku(),
              builder: (context, sonuc) {
                if(sonuc.hasData){
                  tumarabalar =sonuc.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(tumarabalar[index].araba_adi),
                        subtitle: Text(tumarabalar[index].ulke),
                      );
                    },
                    itemCount: tumarabalar.length,
                  );
                }else{
                    return Center(child: CircularProgressIndicator(),);
                }

              })),
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Local JSON Kullanımı"),
      ),
      body: tumarabalar != null ? Container(
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(
            title:Text(tumarabalar[index]["araba_adi"]),
            subtitle:Text(tumarabalar[index]["ulke"]),
          );
        },
        itemCount: tumarabalar.length,),

      ):Center(child: CircularProgressIndicator(),)
    );
  }
  */

  Future<List<Araba>> veriKaynaginiOku() async {
    /*Future<String> jsonOku =DefaultAssetBundle.of(context).loadString("assets/data/araba.json");
    jsonOku.then((okunanJson){
      debugPrint(okunanJson);
      return okunanJson;
    }); */

    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/araba.json");
    //local jsonumuzu objeye dönüştürdük
    List<Araba> arabaListesi =(json.decode(gelenJson) as List).map((mapYapisi)=>Araba.fromJsonMap(mapYapisi)).toList();

    debugPrint("toplam kayıt:" + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint(arabaListesi[i].araba_adi.toString());
    }

    return arabaListesi;
  }
}
