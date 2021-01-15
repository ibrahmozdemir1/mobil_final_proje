import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../kurye_islemleri/kurye_guncelle.dart';

class KuryeIslemleri extends StatefulWidget {
  @override
  KuryeIslemleriState createState() => KuryeIslemleriState();
}

class KuryeIslemleriState extends State<KuryeIslemleri> {
  TextEditingController kuryeAdSoyadi = TextEditingController();
  TextEditingController kuryeTelNo = TextEditingController();
  File _image;
  final picker = ImagePicker();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Reference _storageReference;
  String secilenTarih1;

  urunEkle() async {
    String kuryeURL = await uploadFile(_image);
    FirebaseFirestore.instance
        .collection("Kuryeler")
        .doc(kuryeAdSoyadi.text)
        .set({
      'adSoyad': kuryeAdSoyadi.text,
      'girisTarih': secilenTarih1,
      'kuryeFotograf': kuryeURL,
      'kuryeTelNo': kuryeTelNo.text,
    });
  }

  Future<String> uploadFile(File yuklenecekDosya) async {
    _storageReference =
        _firebaseStorage.ref().child('Kuryeler').child('adSoyad');
    var uploadTask = _storageReference.putFile(yuklenecekDosya);

    var url = await (await uploadTask).ref.getDownloadURL();

    return url;
  }

  Future<DateTime> tarihSec(BuildContext context) {
    return showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2023),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime secilenTarih = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Kurye Ekleme Ekranına Hoşgeldiniz"),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.folder),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => KuryeGuncelle()));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          heightFactor: 1.6,
          widthFactor: 10,
          child: Container(
            margin: EdgeInsets.all(10),
            height: 350,
            color: Colors.amber,
            width: 340,
            child: ListView(
              children: <Widget>[
                _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
                TextFormField(
                  controller: kuryeAdSoyadi,
                  style: TextStyle(color: Colors.blue),
                  cursorColor: Color(0xFF9b9b9b),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Kuryenin Adı ve Soyadı",
                      hintStyle: TextStyle(
                        color: Color(0xFF9b9b9b),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: kuryeTelNo,
                  style: TextStyle(color: Colors.blue),
                  cursorColor: Color(0xFF9b9b9b),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mobile_friendly),
                    hintText: "Kuryenin Telefon Numarası",
                    hintStyle: TextStyle(
                      color: Color(0xFF9b9b9b),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                FlatButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Text("İşe Giriş Tarihini Seç"),
                  onPressed: () async {
                    secilenTarih = await tarihSec(context);
                    if (secilenTarih != null) {
                      secilenTarih1 = secilenTarih.toString();
                      setState(() {});
                    } else {
                      print("Lütfen Bir Tarih Seçiniz");
                    }
                  },
                ),
                FlatButton(
                    color: Colors.blue,
                    child: Text("Kurye Fotoğrafı Yükle"),
                    textColor: Colors.white,
                    onPressed: getImage),
                FlatButton(
                  color: Colors.green,
                  child: Text("Kuryeyi Ekle"),
                  textColor: Colors.white,
                  onPressed: urunEkle,
                ),
              ],
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
