import 'package:flutter/material.dart';

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
