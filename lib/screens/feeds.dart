import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wreckadvisor/helper/constants.dart';
import 'package:wreckadvisor/helper/helpers.dart';
import 'package:wreckadvisor/widgets/mainwidgets.dart';
import 'package:http/http.dart' as http;

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class Palette {
  static const Color primary = Color(0xFF2F4D7D);
}

class _FeedsState extends State<Feeds> {
  List listings = [];
  bool loading = false;

  fetchArticles() async {
    setState(() {
      loading = true;
    });

    var url = apiurl + "/listings";
    final response = await http.get(Uri.parse(url));

    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      if (items.length > 0) {
        setState(() {
          listings = items['listings'];
          print(listings);
          loading = false;
        });
      } else {
        listings = [];
        loading = false;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getColor();
    this.fetchArticles();
    print("state printing...");

    print(randcolor);
  }

  Widget getArticles() {
    if (listings.contains(null) || listings.length < 0 || loading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(kPrimaryColor)),
      ));
    }
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(children: <Widget>[
        // **THIS is the important part**
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => feedsCard(context, listings[index]),
          itemCount: listings.length,
        ),
      ]),
    );
  }

  Future<Null> _refreshArticles() async {
    setState(() {
      fetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return Future.delayed(const Duration(milliseconds: 500), () {
            exit(0);
          });
        },
        child: Theme(
            data: ThemeData(accentColor: Colors.black),
            child: Scaffold(
                appBar: AppBar(title: Text("")),
                drawer: Drawer(
                    // Add a ListView to the drawer. This ensures the user can scroll
                    // through the options in the drawer if there isn't enough vertical
                    // space to fit everything.
                    child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: const Text('My Profile'),
                      
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Item 2'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )),
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
                  RefreshIndicator(
                    onRefresh: _refreshArticles,
                    child: ListView(children: <Widget>[
                      SizedBox(
                        height: 150,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 20),
                        child: whiteHeading(
                            "We Make Everything Easy For Wrecked Users"),
                      ),
                      SizedBox(height: 60),
                      getArticles(),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                  ),
                ]))));
  }
}
