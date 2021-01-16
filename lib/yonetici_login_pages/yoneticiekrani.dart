import 'package:flutter/material.dart';
import 'package:mobil_final_proje/kurye_login_pages/kuye_ekrani.dart';
import 'package:mobil_final_proje/siparis_list_yon/siparisislem.dart';
import '../urun_islemleri/urunEkle.dart';

class YoneticiEkran extends StatefulWidget {
  @override
  _YoneticiEkranState createState() => _YoneticiEkranState();
}

class _YoneticiEkranState extends State<YoneticiEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yönetici ekranına hoşgeldiniz"),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/yoneticiarkaplan.jpeg'),
                  fit: BoxFit.fill)),
          child: Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 210,
                      height: 40,
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => UrunEkle()));
                          },
                          child: Text("Ürün İşlemleri"),
                          textColor: Colors.white,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 210,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => KuryeEkrani()));
                        },
                        child: Text("Kurye İşlemleri"),
                        textColor: Colors.white,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 210,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SiparisIslem()));
                        },
                        child: Text("Siparişleri Görüntüle"),
                        textColor: Colors.white,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
