import 'package:flutter/material.dart';
import 'package:mobil_final_proje/pages/yoneticilogin.dart';
import 'package:mobil_final_proje/pages/kullanıcikayitekrani.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  get passwordController => null;
  get nameController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Marketim'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
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
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı Adı',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
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
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
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
                            MaterialPageRoute(builder: (context) => KullaniciKayit()));
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
                                MaterialPageRoute(builder: (context) => Login()));
                          },
                        ),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            "Kurye Girişi",
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {},
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                ),
              ],
            )));
  }
}

