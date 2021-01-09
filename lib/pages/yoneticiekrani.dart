import 'package:flutter/material.dart';
import '../yon_ekran_button/urunEkle.dart';

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
                        child: Text("Ürün İşlemleri"),
                        textColor: Colors.blue,
                        color: Colors.white),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
                      onPressed: () {},
                      child: Text("Kurye İşlemleri"),
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
