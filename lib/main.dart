import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KalScreen(),
    );
  }
}

class KalScreen extends StatefulWidget {
  @override
  _KalScreenState createState() => _KalScreenState();
}

class _KalScreenState extends State<KalScreen> {
  final textFieldOne = TextEditingController();
  final textFieldtwo = TextEditingController();

  double? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              TextField(
                controller: textFieldOne,
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: textFieldtwo,
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                      child: Text('+'), onPressed: () => kalkulator('+')),
                  RaisedButton(
                      child: Text('-'), onPressed: () => kalkulator('-')),
                  RaisedButton(
                      child: Text('*'), onPressed: () => kalkulator('*')),
                  RaisedButton(
                      child: Text('/'), onPressed: () => kalkulator('/')),
                ],
              ),
              Text('${result ?? ''}')
            ],
          ),
        ),
      ),
    );
  }

  void kalkulator(String operation) {
    final firstNumber = double.parse(textFieldOne.value.text);
    final secondNumber = double.parse(textFieldtwo.value.text);
    switch (operation) {
      case '+':
        setState(() {
          result = firstNumber + secondNumber;
        });
        break;
      case '-':
        setState(() {
          result = firstNumber - secondNumber;
        });
        break;
      case '*':
        setState(() {
          result = firstNumber * secondNumber;
        });
        break;
      case '/':
        setState(() {
          result = firstNumber / secondNumber;
        });
    }
  }
}
