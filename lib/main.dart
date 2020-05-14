import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

// Stateful Widget -> stful
// It allows changes in the app's state. So, the state of Stateless Widget is not meant to change.
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // a variable set place above @override in order to be created once.
  // if inside the build method, it is going to be rebuilding every time on hotreload, etc.
//  CONCLUSION: HERE YOU CREATE THE VARIABLE
//https://stackoverflow.com/questions/59710334/placing-int-inside-built-function-dont-change-image-of-dice-but-when-move-it
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceNumber() {
    // nextInt() method Generates a non-negative random integer uniformly distributed in the range from 0 (inclusive) to max (exclusive).
    // So it is necessary to add +1 to achieve the range between 1 and 6.
    leftDiceNumber = Random().nextInt(6) + 1; // 0 - 5 => 1 - 6
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
// HERE YOU UPDATE THE VARIABLE (changing the State)

    return Center(
      child: Row(
        children: <Widget>[
          // Expanded() creates flexible layouts
          // void callback -> () { //do something }
          // function in Dart -> void Getmilk() {}
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(
                  () {
                    changeDiceNumber();
                    print('Left button got pressed');
                  },
                );
              }, // void callback
              // String Interpolation -> To insert a variable inside a string uses dollar sign ($).
              child: Image.asset("images/dice$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            child: FlatButton(
              // Arrow function
              onPressed: () {
                setState(() {
                  changeDiceNumber();
                  print('Right button got pressed.');
                });
              }, // void callback
              child: Image.asset("images/dice$rightDiceNumber.png"),
            ),
          ),
        ],
      ),
    );
  }
}
