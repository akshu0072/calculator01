import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0";
  String _input = "0";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _input = "0";
      _num1 = 0;
      _num2 = 0;
      _operator = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      _num1 = double.parse(_input);
      _operator = buttonText;
      _input = "0";
    } else if (buttonText == "=") {
      _num2 = double.parse(_input);
      if (_operator == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operator == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operator == "*") {
        _output = (_num1 * _num2).toString();
      } else if (_operator == "/") {
        _output = (_num1 / _num2).toString();
      }
      _input = _output;
      _operator = "";
    } else {
      _input = _input == "0" ? buttonText : _input + buttonText;
      _output = _input;
    }
    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator")),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(24.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("0"),
                  buildButton("C"),
                  buildButton("="),
                  buildButton("+")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
