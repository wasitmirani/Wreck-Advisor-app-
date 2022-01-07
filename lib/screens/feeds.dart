import 'package:flutter/material.dart';
import 'package:wreckadvisor/helper/constants.dart';
import 'package:wreckadvisor/widgets/mainwidgets.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
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
          height: 150,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 20),
          child: whiteHeading("We Make Everything Easy For Wrecked Users"),
        ),
        SizedBox(height: 60),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 190,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/feeds.png',
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: whiteHeading("Trade Your Car"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'There are many variations of passages Ipsum available, Now',
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
                            primary: Color(0xFF26EAFA),
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
                      Color(0xFF088B95).withOpacity(0.5)
                    ],
                  )),
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    ]));
  }
}
