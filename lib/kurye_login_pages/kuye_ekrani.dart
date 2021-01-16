import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobil_final_proje/kurye_login_pages/siparis_goruntuleme.dart';

class KuryeEkrani extends StatefulWidget {
  @override
  _KuryeEkraniState createState() => _KuryeEkraniState();
}

class _KuryeEkraniState extends State<KuryeEkrani> {
  CollectionReference ref = FirebaseFirestore.instance.collection('Siparisler');
  TextEditingController urunAdi = TextEditingController();
  TextEditingController urunFiyat = TextEditingController();
  TextEditingController siparisAdres = TextEditingController();
  TextEditingController odemeturu = TextEditingController();
  TextEditingController adSoyad = TextEditingController();
  TextEditingController kuryeAd = TextEditingController();

  siparisList() async {
    FirebaseFirestore.instance
        .collection("Siparisler")
        .doc(siparisAdres.text)
        .set({
      'urunAdi': urunAdi.text,
      'urunFiyat': urunFiyat.text,
      'siparisAdres': siparisAdres.text,
      'odemeTuru': odemeturu,
      'adSoyad': adSoyad.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Text("Kurye Ekranına Hoşgeldiniz"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/arkaplan2.jpg'),
                fit: BoxFit.fill)),
        child: Form(
            child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(15, 85, 0, 0),
                child: Text(
                  'Mevcut Siparişleri Görmek İçin',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 25),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
                child: Text(
                  'Lütfen Butona Basınız.',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 25),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 40,
                      child: FlatButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          "Sipariş Görüntüle",
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                              //Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SiparisGoruntule()));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
          ],
        )),
      ),
    );
  }
}
