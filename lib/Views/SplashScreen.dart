import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../globals/Globals.dart';
import 'LoginScreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  final _storage = const FlutterSecureStorage();
  startTimer() {
    var logdName;
    Timer(const Duration(seconds: 3), () async {
      try {
        logdName = await _storage.read(key: "name");
      } catch (e) {}

      if (globalUser != "") {
        if (!mounted) return;
        // Navigator.push(context,
        //         MaterialPageRoute(builder: (c) => Lea(rideType: "")))
        //     .then((value) => startTimer());
      } else if (logdName != null) {
        if (!mounted) return;
        // Navigator.pushReplacement(context,
        //         MaterialPageRoute(builder: (c) => NewTripScreen(rideType: "")))
        //     .then((value) => startTimer());
      } else {
        if (!mounted) return;
        Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (c) => LoginPage()))
            .then((value) => startTimer());
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 60, 60, 0),
                    child: Image.asset("images/splash.png"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            )),
      ),
    );
  }
}
