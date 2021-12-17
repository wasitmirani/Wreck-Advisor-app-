import 'package:flutter/material.dart';
import 'package:wreckadvisor/components/imageComponent.dart';
import 'package:wreckadvisor/widgets/mainwidgets.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          appBackgroundScreen(),
          ListView(children: <Widget>[
            SizedBox(
              height: 60,
            ),
            customImage(context, '/images/homecar.png', 300.0, 0.0, 10.0),
            customImage(context, '/images/homeline.png', 8.0, 0.0, 5.0),
          ]),
        ],
      ),
    );
  }
}
