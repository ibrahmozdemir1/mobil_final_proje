import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class KuryeEkrani extends StatefulWidget {
  const KuryeEkrani({Key key, this.user}) : super(key: key);
  final UserCredential user;

  @override
  _KuryeEkraniState createState() => _KuryeEkraniState();
}

class _KuryeEkraniState extends State<KuryeEkrani> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Home ${widget.user.user.email}'),
          ),
      body: Center(
          child: RaisedButton(
              onPressed: () => print(_determinePosition.toString()))),
    );
  }
}
