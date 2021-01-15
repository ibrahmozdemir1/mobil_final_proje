import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_proje/kurye_login_pages/kurye_giris.dart';
import 'package:mobil_final_proje/yonetici_login_pages/yoneticilogin.dart';
import '../home.dart';
import 'package:mobil_final_proje/kullanici_login_register/kullanicikayitekrani.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Marketim'),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Marketim',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Lütfen email girişi yapınız' : null,
                    onSaved: (value) => _email = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) =>
                        value.isEmpty ? 'Lütfen şifre girişi yapınız' : null,
                    onSaved: (value) => _password = value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Şifremi Unuttum'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Giriş'),
                      onPressed: () => signIn(),
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Henüz kaydolmadınız mı?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Kaydol',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            //Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KullaniciKayit()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            "Yönetici Girişi",
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                //Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => YoneticiGiris()));
                          },
                        ),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            "Kurye Girişi",
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                //Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KuryeGiris()));
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
              ],
            )));
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      //todo login to firebase
      formState.save();
      try {
        // Firebase ile iletişim noktası
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
