import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:multiply/screens/home_screen.dart';
import 'package:multiply/widgets/table_buttons.dart';
import 'package:multiply/ad_helper.dart';

import '../constants.dart';
import '../willpop.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  double topSpace = 10.0;
  TextEditingController _table = TextEditingController();
  TextEditingController _stop = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final int formValue;

  // Google Ad_Mob

  // TODO: Add _bannerAd
  late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // TODO: Initialize _bannerAd
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => WillPop().onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          SizedBox(height: _isBannerAdReady?45.0:20.0),
                          Text(
                            'Multiplication Table',
                            style: GoogleFonts.montserrat(
                                textStyle:
                                    kTableTitle.copyWith(color: Colors.blue)),
                          ),
                          Divider(thickness: 2.0),
                          Column(
                            children: [
                              SizedBox(height: 3.0),
                              Text(
                                'Enter Table Number',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                constraints: BoxConstraints(maxHeight: 60.0),
                                width: 140.0,
                                height: 60.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(22.0),
                                  //shape: BoxShape.circle
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    controller: _table,
                                    maxLength: 6,
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        errorStyle: TextStyle(
                                            backgroundColor: Colors.white,
                                            color: Colors.red[800],
                                            fontSize: 10.0)),
                                    keyboardType: TextInputType.number,
                                    // decoration: kTextFieldDecoration.copyWith(
                                    //     labelText: 'First Name'),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Input a number';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Text('From 1 - ?',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500)),
                              Container(
                                constraints: BoxConstraints(maxHeight: 60.0),
                                width: 140.0,
                                height: 60.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(22.0),
                                  //shape: BoxShape.circle
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    controller: _stop,
                                    maxLength: 6,
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        errorStyle: TextStyle(
                                            backgroundColor: Colors.white,
                                            color: Colors.red[800],
                                            fontSize: 10.0)),
                                    keyboardType: TextInputType.number,
                                    // decoration: kTextFieldDecoration.copyWith(
                                    //     labelText: 'First Name'),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Input a number';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                                table: int.parse(_table.text),
                                                stop: int.parse(_stop.text),
                                              )));
                                }
                              },
                              child: const Text('Display Table',
                                  style: TextStyle(fontSize: 16.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 4.0, color: Colors.blue[50]),
                    SizedBox(height: 4.0),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text('Basic Tables',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 8.0),
                            Expanded(
                                child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TableWidget(table: 1, label: '1'),
                                    TableWidget(table: 2, label: '2'),
                                    TableWidget(table: 3, label: '3'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TableWidget(table: 4, label: '4'),
                                    TableWidget(table: 5, label: '5'),
                                    TableWidget(table: 6, label: '6'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TableWidget(table: 7, label: '7'),
                                    TableWidget(table: 8, label: '8'),
                                    TableWidget(table: 9, label: '9'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TableWidget(table: 10, label: '10'),
                                    TableWidget(table: 11, label: '11'),
                                    TableWidget(table: 12, label: '12'),
                                  ],
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_isBannerAdReady)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: _bannerAd.size.width.toDouble(),
                    height: _bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd),
                  ),
                )
            ]),
          ),
        ),
      ),
    );
  }
}
