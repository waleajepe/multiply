
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiply/screens/home_screen.dart';

class TableWidget extends StatelessWidget {
  final int stop = 12;
  final int table;
  final String label;
  TableWidget({Key? key, required this.table, required this.label}): super(key: key);

  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3.0),
        child: ElevatedButton(
          onPressed: () {

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      table: table,
                      stop: stop,
                    )));

          },
          child: Text('$label', style: TextStyle(
              fontSize: 24.0
          )),
        ),
      ),
    );
  }
}
//
// class  extends StatelessWidget {
//   const ({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
