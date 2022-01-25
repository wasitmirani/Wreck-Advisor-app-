import 'package:flutter/material.dart';
import 'package:wreckadvisor/helper/constants.dart';
import 'package:wreckadvisor/screens/feeds.dart';
import 'package:wreckadvisor/screens/home.dart';
import 'package:wreckadvisor/screens/login.dart';
import 'package:wreckadvisor/screens/signup.dart';
import 'package:wreckadvisor/screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wreck Advisor',
      theme: ThemeData(
          primaryColor: Color(kPrimaryColor),
          accentColor: Color(kPrimaryColor),
          primarySwatch: Colors.deepPurple,
          errorColor: Colors.yellow),
      debugShowCheckedModeBanner: false,
      // Start the app with the "/" named route. In this case, the app starts
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => Singup(),
        '/feeds': (context) => Feeds(),
      },
    );
  }
}
