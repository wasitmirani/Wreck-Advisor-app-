import 'package:flutter/material.dart';
import 'package:wreckadvisor/helper/constants.dart';

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
      body:  Stack(
        children: <Widget>[
          appBackgroundScreen(),
          ListView(children: <Widget>[
            SizedBox(
              height: 60,
            ),
            customImage(context, '/images/homecar.png', 300.0, 0.0, 10.0),
            customImage(context, '/images/homeline.png', 8.0, 0.0, 5.0),
            Padding(
              padding: EdgeInsets.fromLTRB(60, 10, 40, 5),
              child: Column(
                children: [
                  whiteHeading("Wrecked Your Car!"),
                  whiteHeading("We Are Here"),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 40, 5),
                child: customText(
                    "There are many variations of passages of Lorem Ipsum available, but the Fost"),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 20,
              child: OutlinedButton(
                onPressed: () {
                  debugPrint('Received click');
                },
                child: Text('Skip', style: subcontentsStyle),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('trest');
                Navigator.pushNamed(context, '/login');
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: gradientButton(context, "Get Started"),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
