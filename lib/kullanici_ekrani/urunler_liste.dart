import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_proje/kullanici_login_register/login_page.dart';

class UrunListe extends StatefulWidget {
  @override
  _UrunListeState createState() => _UrunListeState();
}

class _UrunListeState extends State<UrunListe> {
  CollectionReference ref = FirebaseFirestore.instance.collection('Urunler');
  TextEditingController urunAdi = TextEditingController();
  TextEditingController urunFiyat = TextEditingController();
  TextEditingController siparisAdres = TextEditingController();
  TextEditingController adSoyad = TextEditingController();
  String odemeturu;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> _signOut() async {
    await auth.signOut().whenComplete(() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  siparisEkle() async {
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
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: Text("Hoşgeldiniz"),
        actions: <Widget>[
          Icon(
            Icons.exit_to_app,
            color: Colors.black,
            size: 30.0,
          ),
          FlatButton(
            child: Text(
              "Çıkış Yap",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/arkaplan1.jpg'),
                fit: BoxFit.fill)),
        child: StreamBuilder(
            stream: ref.snapshots(),
            builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                var urunUzunluk = snapshot.data.docs.length;
                return ListView.builder(
                    itemCount: urunUzunluk,
                    itemBuilder: (context, index) {
                      var urunler = snapshot.data.docs[index];
                      return ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.shopping_cart_rounded),
                          color: Colors.black,
                          iconSize: 40,
                          onPressed: () {
                            urunAdi.text = urunler['urunAdi'];
                            urunFiyat.text = urunler['urunFiyat'];
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      child: Container(
                                        width: 300,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              TextField(
                                                enabled: false,
                                                controller: urunAdi,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                cursorColor: Color(0xFF9b9b9b),
                                                decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      borderSide: BorderSide(),
                                                    ),
                                                    hintStyle: TextStyle(
                                                      color: Color(0xFF9b9b9b),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    )),
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
                                              TextField(
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
                                                  hintText: "Ad Soyad Giriniz",
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
                                              TextField(
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
                                                  hintText:
                                                      "Sipariş Adresini Giriniz",
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
                                              DropdownButton<String>(
                                                items: [
                                                  DropdownMenuItem<String>(
                                                    value: "Pesin Ödeme",
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Icon(Icons.money),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Pesin Ödeme"),
                                                      ],
                                                    ),
                                                  ),
                                                  DropdownMenuItem<String>(
                                                    value: "Kredi Kartı",
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Icon(Icons.credit_card),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Kredi Kartı"),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                                onChanged: (value) {
                                                  print("value : $value");
                                                  setState(() {
                                                    odemeturu = value;
                                                  });
                                                },
                                                hint: Text(
                                                  "Lütfen Ödeme Yöntemini Seçiniz.",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                value: odemeturu,
                                                isExpanded: true,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              FlatButton(
                                                  color: Colors.green,
                                                  child: Text("Sipariş Ver"),
                                                  textColor: Colors.white,
                                                  onPressed: () {
                                                    siparisEkle();
                                                    siparisAdres.clear();
                                                    adSoyad.clear();
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                        ),
                        title: Text(
                          urunler['urunAdi'],
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            Text(
                              urunler['urunFiyat'],
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              urunler['urunMiktari'],
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        trailing: Image.network(
                          urunler["urunURL"],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
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
