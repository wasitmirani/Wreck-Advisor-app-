import 'dart:math';

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

Widget whiteHeading(value) {
  return Text(value, style: kTitleStyle);
}

Widget greenHeading(value) {
  return Text(value, style: greenTitleStyle);
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
        end: Alignment(0.2, 1.2),
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

void getColor() {
  var rand = new Random().nextInt(4);
  switch (rand) {
    case 1:
      "0xFFFFC198";
      break;
    case 2:
      "0x";
      break;

    default:
  }
}

Widget feedsCard(BuildContext context, item) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 190,
    child: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(item.img.toString()),
          ),
        ),
      ),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: whiteHeading("Sale Your Car"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.title.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Color(0xFFFFC198),
                    ),
                    onPressed: () {},
                    child: const Text('Trade Now'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                        width: 80,
                        height: 60,
                        child: Image.asset('assets/images/logo.png',
                            width: MediaQuery.of(context).size.width / 1,
                            fit: BoxFit.contain)),
                  ),
                ],
              ),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment(0.2, 1.2),
              colors: [
                Color(0xFF020420).withOpacity(0.9),
                Color(0xFFB44116).withOpacity(0.5)
              ],
            )),
      )
    ]),
  );
}

Widget storiesCard(context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(right: 10),
          height: 200,
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              Text(
                "There are many variations of passages There are many variations of passages",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "There are many variations of passages There are many variations of passages",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 200,
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              Text(
                "There are many variations of passages There are many variations of passages",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
