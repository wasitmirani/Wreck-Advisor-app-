import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wreckadvisor/helper/constants.dart';

Widget appBackgroundScreen() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/bgscreen.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget customImage(context, path, hvalue, wvalue, pvalue) {
  return Container(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.all(pvalue),
      child: Image.asset('assets/' + path,
          height: hvalue,
          width: wvalue > 0 ? wvalue : MediaQuery.of(context).size.width / 1,
          fit: BoxFit.contain),
    ),
  );
}

Widget customHeading(value) {
  return Text(value, style: kTitleStyle);
}

Widget customText(value) {
  return Text(value, style: subcontentsStyle);
}

Widget gradientButton(context, value) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF020420),
          Color(0xFF10AEBA),
        ],
      )),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
