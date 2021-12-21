import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:wreckadvisor/widgets/mainwidgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(children: <Widget>[
        appBackgroundScreen(),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 60, 0, 10),
          child: Container(
              width: 150,
              height: 100,
              child: Image.asset('assets/images/logo.png',
                  width: MediaQuery.of(context).size.width / 1,
                  fit: BoxFit.contain)),
        ),
        ListView(children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: greenHeading("Login Now"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: customText(
                "There are many variations of passages Ipsum available, Now"),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFF071C37),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email Address',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ]),
      ]),
    );
  }
}
