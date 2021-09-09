import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiply/screens/home_screen.dart';
import 'package:multiply/widgets/table_buttons.dart';

import '../constants.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController _table = TextEditingController();
  TextEditingController _stop = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final int formValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.92,
            width: MediaQuery.of(context).size.width * 0.9,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 8.0),
                      Center(
                        child: Text(
                          'Multiplication Table',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  kTableTitle.copyWith(color: Colors.blue)),
                        ),
                      ),
                      Divider(thickness: 2.0),
                      Column(
                        children: [
                          SizedBox(height: 6.0),
                          Text('Enter Table Number',  style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w500)),

                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 60.0
                            ),

                            width: 140.0,
                            height: 60.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            decoration: BoxDecoration(color: Colors.blue[50],
                               borderRadius: BorderRadius.circular(22.0),
                               //shape: BoxShape.circle
                              ),

                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                                      fontSize: 10.0)
                                    ),
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
                          Text('From 1 - ?', style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w500)),
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 60.0
                            ),

                            width: 140.0,
                            height: 60.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            decoration: BoxDecoration(color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(22.0),
                              //shape: BoxShape.circle
                            ),

                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                                        fontSize: 10.0)
                                ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                            table: int.parse(_table.text),
                                            stop: int.parse(_stop.text),
                                          )));
                            }
                          },
                          child: const Text('Display Table', style: TextStyle(
                            fontSize: 16.0
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 4.0, color: Colors.orange),
                SizedBox(height: 8.0),

                Text('Basic Tables',  style: TextStyle(color: Colors.black54, fontSize: 24.0, fontWeight: FontWeight.w500)),
                SizedBox(height: 8.0),
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
            ),
          ),
        ),
      ),
    );
  }
}
