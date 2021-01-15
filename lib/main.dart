import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'yonetici_login_pages/yoneticiekrani.dart';
import 'kurye_islemleri/kurye_ekle.dart';
import 'kurye_login_pages/kuye_ekrani.dart';
import 'kullanici_ekrani/urunler_liste.dart';

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
    initializeDateFormatting('tr');
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UrunListe(),
      debugShowCheckedModeBanner: false,
    );
  }
}
