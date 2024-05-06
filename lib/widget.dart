import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayText = '';
  double _result = 0;
  double _operand1 = 0;
  double _operand2 = 0;
  String _operator = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '';
        _result = 0;
        _operand1 = 0;
        _operand2 = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _operand1 = double.parse(_displayText);
        _operator = buttonText;
        _displayText = '';
      } else if (buttonText == '=') {
        _operand2 = double.parse(_displayText);
        if (_operator == '+') {
          _result = _operand1 + _operand2;
        } else if (_operator == '-') {
          _result = _operand1 - _operand2;
        } else if (_operator == '*') {
          _result = _operand1 * _operand2;
        } else if (_operator == '/') {
          _result = _operand1 / _operand2;
        }
        _displayText = _result.toString();
        _operand1 = 0;
        _operand2 = 0;
        _operator = '';
      } else {
        _displayText += buttonText;
      }
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _buttonPressed(buttonText);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: buttonColor,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayText,
                style: const TextStyle(
                    fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              _buildButton('7', Colors.grey),
              _buildButton('8', Colors.grey),
              _buildButton('9', Colors.grey),
              _buildButton('/', Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('4', Colors.grey),
              _buildButton('5', Colors.grey),
              _buildButton('6', Colors.grey),
              _buildButton('*', Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('1', Colors.grey),
              _buildButton('2', Colors.grey),
              _buildButton('3', Colors.grey),
              _buildButton('-', Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton('C', Colors.red),
              _buildButton('0', Colors.grey),
              _buildButton('=', Colors.orange),
              _buildButton('+', Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
