import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = "";
  @override
  void initState() {
    super.initState();
    loadScreen();
  }

  loadScreen()  {
    setState(() {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/home'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.cover,
            ),
          ),
        )
        // child: Image.asset('/assets/images/logo.gif', fit: BoxFit.cover)),
      ],
    ));
  }
}
