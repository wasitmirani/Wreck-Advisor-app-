import 'package:flutter/material.dart';

Widget appBackgroundScreen() {
  return Container(
    decoration:  BoxDecoration(
      image:  DecorationImage(
        image: AssetImage("assets/images/bgscreen.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}