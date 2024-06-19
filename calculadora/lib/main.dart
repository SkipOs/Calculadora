import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  String _buffer = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _clear();
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      _operand = buttonText;
      _num1 = double.parse(_output);
      _buffer = '';
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      _calculate();
    } else {
      setState(() {
        if (_buffer.length < 10) {
          _buffer += buttonText;
          _output = double.parse(_buffer).toStringAsFixed(2);
        }
      });
    }
  }

  void _calculate() {
    double result = 0;
    switch (_operand) {
      case '+':
        result = _num1 + _num2;
        break;
      case '-':
        result = _num1 - _num2;
        break;
      case '*':
        result = _num1 * _num2;
        break;
      case '/':
        result = _num1 / _num2;
        break;
    }
    setState(() {
      _output = result.toStringAsFixed(2);
      _operand = '';
      _buffer = '';
    });
  }

  void _clear() {
    setState(() {
      _output = '0';
      _operand = '';
      _buffer = '';
      _num1 = 0;
      _num2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _output,
            style: TextStyle(fontSize: 36),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('C'),
              _buildButton('0'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () {
        _buttonPressed(buttonText);
      },
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20),
      ),
    );
  }   
}
