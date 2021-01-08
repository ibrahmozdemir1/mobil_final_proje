/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobil_final_proje/pages/yoneticiekrani.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 4.0,
                color: Colors.white,
                margin: EdgeInsets.only(left: 20,right: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          validator: (value) => value.isEmpty ? 'Lütfen email girişi yapınız' : null,
                          onSaved: (value) => _email = value,
                          style: TextStyle(color: Color(0xFF000000)),
                          cursorColor: Color(0xFF9b9b9b),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_box,
                              color: Colors.grey,
                            ),
                            hintText: "e-posta",
                            hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) =>
                          value.isEmpty ? 'Lütfen şifre girişi yapınız' : null,
                          onSaved: (value) => _password = value,
                          style: TextStyle(color: Color(0xFF000000)),
                          cursorColor: Color(0xFF9b9b9b),
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_box,
                              color: Colors.grey,
                            ),
                            hintText: "Şifre",
                            hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,

                            ),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(10), child:
                        RaisedButton(
                          onPressed: () => signIn(),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Giriş'),
                        ),
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
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
            context, MaterialPageRoute(builder: (context) => yonetici()));
      } catch (e) {
        print(e.toString());
      }
    }
  }
}

*/
