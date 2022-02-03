import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wreckadvisor/helper/constants.dart';
import 'package:wreckadvisor/helper/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:wreckadvisor/widgets/mainwidgets.dart';

class ListForm extends StatefulWidget {
  ListForm({Key? key}) : super(key: key);

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  final carmodelTextContainer = TextEditingController();
  final carnumberTextContainer = TextEditingController();
  final licensedTextContainer = TextEditingController();
  final addressTextContainer = TextEditingController();
  final titleTextContainer = TextEditingController();
  bool isnotlogin = false;
  final _formKey = GlobalKey<FormState>();

  onsubmitListing() async {
    var url = apiurl + "/store/listing";
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token").toString();
    print(url);
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'car_model': carmodelTextContainer.text.toString(),
          'car_number': carnumberTextContainer.text.toString(),
          'license': licensedTextContainer.text.toString(),
          'title': titleTextContainer.text.toString(),
          'address': addressTextContainer.text.toString(),
        }));

    print(response.body);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color(kgreenColor),
          content: Text('Your car trade has been successfully created')));
      Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/feeds'));
    }
  }

  Widget ListingForm() {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Container(
            child: TextFormField(
              controller: titleTextContainer,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Trade Title",
                  fillColor: Colors.white70),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter trade title';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TextFormField(
              controller: carmodelTextContainer,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Car Model",
                  fillColor: Colors.white70),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter car model';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TextFormField(
              controller: carnumberTextContainer,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Car Number",
                  fillColor: Colors.white70),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter car number';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TextFormField(
              controller: licensedTextContainer,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Licensed",
                  fillColor: Colors.white70),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter licensed';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TextFormField(
              controller: addressTextContainer,
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
                if (value == null || value.isEmpty) {
                  return 'Please enter complete address';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
                onsubmitListing();
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Color(kPrimaryColor),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Trade Your Car"),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xFF040733), Color(0xFF040733)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                          height: 40,
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
