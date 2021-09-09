import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiply/constants.dart';
import 'package:multiply/screens/input.dart';

class HomeScreen extends StatefulWidget {
  final int table;
  final int stop;

  HomeScreen({required this.table, required this.stop});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InputScreen()));
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.arrow_back_ios_outlined),
        ),
        backgroundColor: Colors.orange,
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
                          return ListTile(
                              title: Text(
                            ('${widget.table} x ${index + 1} = ${values[index].toString()}'),
                            //style: kTableText,
                                style: GoogleFonts.montserrat(textStyle: kTableText)
                          ));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Expanded(
// child: Container(
// width: MediaQuery.of(context).size.width,
// color: Colors.white,
// child: Image(
// image: AssetImage('assets/check.jpeg'),
// fit: BoxFit.cover,
// ),
// ),
// ),
// Expanded(
// child: Container(
// width: MediaQuery.of(context).size.width,
// decoration: BoxDecoration(
// color: Colors.blue,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(30.0),
// topRight: Radius.circular(30.0)
// )
// ),
// child: Center(child: Text('Container 2', style: TextStyle(color: Colors.white),)),
// ),
// )
// ],
// )
