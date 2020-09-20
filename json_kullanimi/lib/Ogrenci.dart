import 'package:flutter/material.dart';

class Ogrenci{
  int id;
  String name;

  Ogrenci(this.id,this.name);

  @override
  String toString() {
    return "Student name: $name , id: $id";
  }
  //return döndüren constructor oluşturmamızı sağlar.
  factory Ogrenci.mapiNesneyeDonustur(Map<String, dynamic> gelenmap){
    return Ogrenci(gelenmap['id'],gelenmap['name']);
  }

  Ogrenci.fromMap(Map<String, dynamic> gelenmap):
      id=gelenmap['id'],
      name=gelenmap['name'];
}

class OgrenciMaptoJsonOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> ogrenci1 = {'id': 15, 'name':"Hasan"};
    Ogrenci objeOgrenci = Ogrenci.mapiNesneyeDonustur(ogrenci1);
    debugPrint(objeOgrenci.toString());

    return Container();
  }
}
//json obje kullanımının genel mantığı
