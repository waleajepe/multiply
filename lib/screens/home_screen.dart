import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:multiply/constants.dart';
import 'package:multiply/screens/input.dart';
import 'package:multiply/willpop.dart';

import '../ad_helper.dart';

class HomeScreen extends StatefulWidget {
  final int table;
  final int stop;

  HomeScreen({required this.table, required this.stop});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Adds service
  InterstitialAd? _interstitialAd;

  // TODO: Add _isInterstitialAdReady
  bool _isInterstitialAdReady = false;

  // TODO: Implement _loadInterstitialAd()

  int start = 1;
  List values = [];

  List addValue() {
    for (start; start <= widget.stop; start++) {
      print('${widget.table} * ${start} ${widget.table * start}');
      values.add(start * widget.table);
    }
    return values;
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addValue();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => WillPop().onWillPop(context),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => InputScreen()));
            },
            backgroundColor: Colors.blue,
            child: Icon(Icons.arrow_back_ios_outlined),
          ),
          backgroundColor: Colors.grey,
          body: SafeArea(
            child: Container(
              //margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Multiplication Table ${widget.table}',
                    style: GoogleFonts.montserrat(textStyle: kTableTitle),
                  ),
                  SizedBox(height: 2.0),
                  Expanded(
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          itemCount: widget.stop,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8.0),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    ('${widget.table} x ${index + 1} = ${values[index].toString()}'),
                                    style: GoogleFonts.montserrat(
                                        textStyle: kTableText),
                                  ),
                                ),
                                Divider(color: Colors.blueAccent)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
