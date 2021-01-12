import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KuryeEkrani extends StatefulWidget {
  const KuryeEkrani({Key key, this.user}) : super(key: key);
  final UserCredential user;

  @override
  _KuryeEkraniState createState() => _KuryeEkraniState();
}

class _KuryeEkraniState extends State<KuryeEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Hoş Geldiniz.'),
      ),
      body: Form(
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(75, 50, 10, 10),
                child: RaisedButton(
                  // padding: EdgeInsets.fromLTRB(10, 100, 10, 100),
                  onPressed: () {},
                  child: Text('Tanımlanan Siparişleri Görüntüle'),
                  textColor: Colors.white,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
