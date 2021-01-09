import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KullaniciKayit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KullaniciKayitState();
}

class KullaniciKayitState extends State<KullaniciKayit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  @override
  Widget build(BuildContext context) {
    KullaniciKayit();
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Kayıt Ekranı"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Lütfen geçerli bir e-mail giriniz.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Şifre'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Lütfen bir şifre giriniz.';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _register();
                  }
                },
                child: const Text('Kayıt Ol'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_success == null
                  ? ''
                  : (_success
                      ? 'Kayıt Başarılı' + _userEmail
                      : 'Kayıt Başarısız')),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _register() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (userCredential != null) {
      setState(() {
        _success = true;
        _userEmail = _emailController.text;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
