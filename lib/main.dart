import 'package:flutter/material.dart';
import 'package:mobil_final_proje/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobil_final_proje/yoneticiekranıbutonları/urunEkle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UrunEkle(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
