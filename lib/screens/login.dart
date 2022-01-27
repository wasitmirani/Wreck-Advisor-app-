// ignore_for_file: prefer_const_constructors

import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wreckadvisor/helper/constants.dart';
import 'package:wreckadvisor/helper/helpers.dart';
import 'package:wreckadvisor/widgets/mainwidgets.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailTextContainer = TextEditingController();
  final passwordTextContainer = TextEditingController();
  bool isnotlogin = false;
  final _formKey = GlobalKey<FormState>();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  var user;

  // Future<void> signup(BuildContext context) async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);

  //     // Getting users credential
  //     UserCredential result = await auth.signInWithCredential(authCredential);
  //     user = result.user;

  //     if (result != null) {
  //       Navigator.pushNamed(context, '/feeds');
  //     } // if result not null we simply call the MaterialpageRoute,
  //     // for go to the HomePage screen
  //   }
  // }

  loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // setState(() {
    //   loading = true;
    // });
    var url = apiurl + "/login";
    if (emailTextContainer.toString().length > 0) {
      print("hello");
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': emailTextContainer.text.toString(),
          'password': passwordTextContainer.text.toString(),
        }),
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        print(res['token']);
        prefs.setString('token', res['token']);

        print(prefs.getString('token'));
        // print(res);
        isnotlogin = false;
        // Navigator.pushNamed('/feeds');
        Navigator.pushNamed(context, '/feeds');
      } else {
        isnotlogin = false;
      }
    }
  }

  Widget loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              validator: (value) {
                print("hello");
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: emailTextContainer,
              decoration: InputDecoration(
                fillColor: Color(0xFF071C37),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Enter Email Address',
                labelStyle: TextStyle(color: Colors.white),
                labelText: 'Email',
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: TextField(
              controller: passwordTextContainer,
              decoration: InputDecoration(
                fillColor: Color(0xFF071C37),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: '*******',
                labelStyle: TextStyle(color: Colors.white),
                labelText: 'Password',
                hintStyle: TextStyle(color: Colors.white),
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Text("forgot Password",
                style: TextStyle(color: Color(kcgreenColor))),
          ]),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      color: Color(0xff090A16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircularProgressIndicator(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Loading....",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
              Future.delayed(new Duration(seconds: 3), () {
                Navigator.pop(context); //pop dialog
                if (emailTextContainer.text.length < 1) {
                  final snackBar = SnackBar(
                    content: const Text('Please enter email & password'),
                    backgroundColor: Colors.blueAccent,
                    duration: Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'Error',
                      textColor: Colors.white,
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  loginUser();
                }

                if (isnotlogin) {
                  final snackBar = SnackBar(
                    content: const Text(
                        'Please check your username and password and try again'),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'Error',
                      textColor: Colors.white,
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: gradientButton(context, "Login"),
            ),
          ),
        ],
      ),
    );
  }

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
            height: 200,
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                loginForm(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        // Text(
                        //   "Login With",
                        //   style: TextStyle(
                        //       color: Color(kcgreenColor), fontSize: 20),
                        // ),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ClipOval(
                              //   child: Material(
                              //     color: Colors.blue, // Button color
                              //     child: InkWell(
                              //       splashColor:
                              //           Colors.blueAccent, // Splash color
                              //       onTap: () {},
                              //       child: SizedBox(
                              //           width: 56,
                              //           height: 56,
                              //           child: Icon(
                              //             Icons.facebook,
                              //             color: Colors.white,
                              //           )),
                              //     ),
                              //   ),
                              // ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 10,
                              ),
                              // ClipOval(
                              //   child: Material(
                              //     color: Colors.redAccent, // Button color
                              //     child: InkWell(
                              //       splashColor: Colors.red, // Splash color
                              //       onTap: () {
                              //         signup(context);
                              //       },
                              //       child: SizedBox(
                              //           width: 56,
                              //           height: 56,
                              //           child: Icon(
                              //             FontAwesomeIcons.googlePlus,
                              //             color: Colors.white,
                              //           )),
                              //     ),
                              //   ),
                              // )
                            ]),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 20, bottom: 20),
                        //   child: Text(
                        //     "Or",
                        //     style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.w700),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     "Sign Up Now",
                        //     style: TextStyle(
                        //         color: Color(kcgreenColor), fontSize: 20),
                        //   ),
                        // )
                      ],
                    ),
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
