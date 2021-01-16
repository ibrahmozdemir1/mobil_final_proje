import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SiparisIslem extends StatefulWidget {
  @override
  _SiparisIslemState createState() => _SiparisIslemState();
}

class _SiparisIslemState extends State<SiparisIslem> {
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
      'kuryeAd': kuryeAd.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: Text("Siparişleri Görüntüle"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/arkaplan.png'),
                fit: BoxFit.fill)),
        child: StreamBuilder(
            stream: ref.snapshots(),
            builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                var siparisuzunluk = snapshot.data.docs.length;
                return ListView.builder(
                    itemCount: siparisuzunluk,
                    itemBuilder: (context, index) {
                      var siparisler = snapshot.data.docs[index];
                      return ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.post_add),
                          color: Colors.purple,
                          iconSize: 40,
                          onPressed: () {
                            urunAdi.text = siparisler['urunAdi'];
                            urunFiyat.text = siparisler['urunFiyat'];
                            siparisAdres.text = siparisler['siparisAdres'];
                            adSoyad.text = siparisler['adSoyad'];
                            odemeturu.text = siparisler['odemeTuru'];
                            kuryeAd.text = siparisler['kuryeAd'];
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      child: Container(
                                        width: 300,
                                        color: Colors.deepPurple,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 20,
                                              ),
                                              TextField(
                                                enabled: false,
                                                controller: urunAdi,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                cursorColor: Color(0xFF9b9b9b),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    borderSide: BorderSide(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              TextField(
                                                enabled: false,
                                                controller: urunFiyat,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                cursorColor: Color(0xFF9b9b9b),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    borderSide: BorderSide(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              TextField(
                                                enabled: false,
                                                controller: adSoyad,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                cursorColor: Color(0xFF9b9b9b),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    borderSide: BorderSide(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              TextField(
                                                enabled: false,
                                                controller: siparisAdres,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                cursorColor: Color(0xFF9b9b9b),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    borderSide: BorderSide(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              TextField(
                                                enabled: false,
                                                controller: odemeturu,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                cursorColor: Color(0xFF9b9b9b),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    borderSide: BorderSide(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              TextField(
                                                controller: kuryeAd,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                cursorColor: Color(0xFF9b9b9b),
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    borderSide: BorderSide(),
                                                  ),
                                                  hintText: "Kurye Adı Giriniz",
                                                  hintStyle: TextStyle(
                                                    color: Color(0xFF9b9b9b),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              FlatButton(
                                                  color: Colors.green,
                                                  child: Text(
                                                      "Kurye Ekranına Gönder"),
                                                  textColor: Colors.white,
                                                  onPressed: () {
                                                    siparisList();
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                        ),
                        title: Text(
                          "Ürün Adı : " + siparisler['urunAdi'] + "",
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Form(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Ürün Fiyatı : " + siparisler['urunFiyat'] + "",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Siparis Adresi : " +
                                    siparisler['siparisAdres'] +
                                    "",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Kullanıcı Adı : " + siparisler['adSoyad'] + "",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Ödeme Türü : " + siparisler['odemeTuru'] + "",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      );
                    });
              } else {
                return Text(
                  "Olmuyor",
                  style: TextStyle(color: Colors.black),
                );
              }
            }),
      ),
    );
  }
}
