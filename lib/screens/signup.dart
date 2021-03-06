import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wreckadvisor/helper/constants.dart';
import 'package:wreckadvisor/widgets/mainwidgets.dart';

class Singup extends StatefulWidget {
  const Singup({Key? key}) : super(key: key);

  @override
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup> {
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
            child: greenHeading("Sign Up"),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFF071C37),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Enter Your Name',
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Full Name',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
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
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFF071C37),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: 'Enter Phone',
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
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/feeds');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: gradientButton(context, "Sign Up"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Or Signup With",
                          style: TextStyle(
                              color: Color(kcgreenColor), fontSize: 14),
                        ),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Material(
                                  color: Colors.blue, // Button color
                                  child: InkWell(
                                    splashColor:
                                        Colors.blueAccent, // Splash color
                                    onTap: () {},
                                    child: const SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(
                                          Icons.facebook,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(
                                width: 10,
                              ),
                              ClipOval(
                                child: Material(
                                  color: Colors.redAccent, // Button color
                                  child: InkWell(
                                    splashColor: Colors.red, // Splash color
                                    onTap: () {},
                                    child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: Icon(
                                          FontAwesomeIcons.googlePlus,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              )
                            ]),
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
