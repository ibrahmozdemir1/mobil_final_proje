import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class urunEkle extends StatefulWidget {
  @override
  _urunEkleState createState() => _urunEkleState();
}

class _urunEkleState extends State<urunEkle> {
  TextEditingController urunAdi    =   TextEditingController();
  TextEditingController urunMiktar =   TextEditingController();
  TextEditingController urunFiyat  =   TextEditingController();
  File _imageFile;
  urunEkle(){
    FirebaseFirestore.instance
        .collection("Urunler")
        .doc(urunAdi.text).
        set({'urunAdi' : urunAdi.text, 'urunMiktari': urunMiktar.text,'urunFiyat': urunFiyat.text});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Ürün Ekleme Ekranına Hoşgeldiniz"),
      ),
      body: Center(
        child: Container(
          child: Form(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: urunAdi,
                    style: TextStyle(color: Colors.blue),
                    cursorColor: Color(0xFF9b9b9b),
                    decoration: InputDecoration(
                      hintText: "Ürünün Adını Giriniz",
                      hintStyle:  TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      )
                    ),
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
                  Row(
                    children: [
                      RaisedButton(child: Text("Ürünü Ekle"), onPressed: urunEkle,)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.image),
      ),
    );
  }
  //Kameradan veya galeriden resim seçme
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }
}
