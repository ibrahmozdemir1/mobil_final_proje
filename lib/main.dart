import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobil_final_proje/kullanici_ekrani/urunler_liste.dart';
import 'package:mobil_final_proje/kullanici_login_register/login_page.dart';
import 'package:mobil_final_proje/kurye_login_pages/kurye_giris.dart';
import 'package:mobil_final_proje/kurye_login_pages/kuye_ekrani.dart';
import 'package:mobil_final_proje/siparis_list_yon/siparisislem.dart';
import 'package:mobil_final_proje/yonetici_login_pages/yoneticiekrani.dart';
import 'package:mobil_final_proje/yonetici_login_pages/yoneticilogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
