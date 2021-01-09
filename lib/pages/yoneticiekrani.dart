import 'package:flutter/material.dart';
import 'package:mobil_final_proje/yoneticiekran%C4%B1butonlar%C4%B1/urunEkle.dart';

class YoneticiEkran extends StatefulWidget {
  @override
  _YoneticiEkranState createState() => _YoneticiEkranState();
}

class _YoneticiEkranState extends State<YoneticiEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yönetici ekranına hoşgeldiniz..."),
        ),
        body: Container(
          color: Colors.grey,
          child: Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(85, 10, 85, 10),
                        onPressed: () => UrunEkle(),
                        child: Text("Ürün Ekle"),
                        textColor: Colors.blue,
                        color: Colors.white),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                      onPressed: () {},
                      child: Text("Kuryeleri Görüntüle"),
                      textColor: Colors.blue,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      onPressed: () {},
                      child: Text("Siparişleri Görüntüle"),
                      textColor: Colors.blue,
                      color: Colors.white,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
