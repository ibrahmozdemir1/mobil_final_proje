import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobil_final_proje/pages/kuye_ekrani.dart';
import 'package:mobil_final_proje/pages/login_page.dart';
import 'package:mobil_final_proje/yon_ekran_button/urunEkle.dart';
import 'package:mobil_final_proje/yon_ekran_button/urunGuncelle.dart';

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
