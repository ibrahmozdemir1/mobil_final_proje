import 'package:flutter/material.dart';
import 'package:mobil_final_proje/pages/login_page.dart';

void main(){
  runApp( MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue),
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
   ),
  );
}