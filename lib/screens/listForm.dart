import 'package:flutter/material.dart';
import 'package:wreckadvisor/widgets/mainwidgets.dart';

class ListForm extends StatefulWidget {
  const ListForm({Key? key}) : super(key: key);

  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
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
          height: 160,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: greenHeading("Login Now"),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: customText(
              "Enter your email and password to login in to your account"),
        ),
      ]),
    ]));
  }
}
