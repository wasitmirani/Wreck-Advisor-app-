import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wreckadvisor/helper/constants.dart';
import 'package:wreckadvisor/widgets/mainwidgets.dart';

class ListForm extends StatefulWidget {
  ListForm({Key? key}) : super(key: key);

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  final emailTextContainer = TextEditingController();
  final passwordTextContainer = TextEditingController();
  bool isnotlogin = false;
  final _formKey = GlobalKey<FormState>();

  Widget ListingForm() {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Car Model",
                  fillColor: Colors.white70),
              validator: (value) {
                // validation logic
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Car Number",
                  fillColor: Colors.white70),
              validator: (value) {
                // validation logic
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "licensed",
                  fillColor: Colors.white70),
              validator: (value) {
                // validation logic
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Address",
                  suffixIcon: Icon(Icons.location_on),
                  fillColor: Colors.white70),
              validator: (value) {
                // validation logic
              },
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xFF040733), Color(0xFF040733)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Container(
                        width: 150,
                        height: 100,
                        child: Image.asset('assets/images/logo.png',
                            width: MediaQuery.of(context).size.width / 1,
                            fit: BoxFit.contain)),
                  ),
                  Text(
                    "Trade Your Car",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Submit Details",
                    style: TextStyle(color: Color(0xFF15DDEC), fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(32, 132, 232, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              ListingForm(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
