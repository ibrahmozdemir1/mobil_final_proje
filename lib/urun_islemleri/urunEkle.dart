import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:mobil_final_proje/urun_islemleri/urunGuncelle.dart';

class UrunEkle extends StatefulWidget {
  @override
  UrunEkleState createState() => UrunEkleState();
}

class UrunEkleState extends State<UrunEkle> {
  TextEditingController urunAdi = TextEditingController();
  TextEditingController urunMiktar = TextEditingController();
  TextEditingController urunFiyat = TextEditingController();
  File _image;
  final picker = ImagePicker();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Reference _storageReference;

  urunEkle() async {
    String urunURL = await uploadFile(_image);
    FirebaseFirestore.instance.collection("Urunler").doc(urunAdi.text).set({
      'urunAdi': urunAdi.text,
      'urunMiktari': urunMiktar.text,
      'urunFiyat': urunFiyat.text,
      'urunURL': urunURL
    });
  }

  Future<String> uploadFile(File yuklenecekDosya) async {
    _storageReference =
        _firebaseStorage.ref().child('urunler').child('urunAdi');
    var uploadTask = _storageReference.putFile(yuklenecekDosya);

    var url = await (await uploadTask).ref.getDownloadURL();

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Ekleme Ekranına Hoşgeldiniz"),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.folder),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => UrunGuncelle()));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Form(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _image == null
                        ? Text('No image selected.')
                        : Image.file(_image),
                    TextField(
                      controller: urunAdi,
                      style: TextStyle(color: Colors.blue),
                      cursorColor: Color(0xFF9b9b9b),
                      decoration: InputDecoration(
                          hintText: "Ürünün Adını Giriniz",
                          hintStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    TextField(
                      controller: urunFiyat,
                      style: TextStyle(color: Colors.blue),
                      cursorColor: Color(0xFF9b9b9b),
                      decoration: InputDecoration(
                        hintText: "Ürün Fiyatını Giriniz",
                        hintStyle: TextStyle(
                          color: Color(0xFF9b9b9b),
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    TextField(
                      controller: urunMiktar,
                      style: TextStyle(color: Colors.blue),
                      cursorColor: Color(0xFF9b9b9b),
                      decoration: InputDecoration(
                        hintText: "Ürünün Miktarını Giriniz",
                        hintStyle: TextStyle(
                          color: Color(0xFF9b9b9b),
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    FlatButton(
                        color: Colors.blue,
                        child: Text("Resim Yükle"),
                        textColor: Colors.white,
                        onPressed: getImage),
                    FlatButton(
                      color: Colors.blue,
                      child: Text("Ürünü Ekle"),
                      textColor: Colors.white,
                      onPressed: urunEkle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}