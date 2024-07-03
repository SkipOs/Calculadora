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
    } else if (buttonText == '⌫') {
      _delete();
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      _operand = buttonText;
      _num1 = double.parse(_buffer.isEmpty ? '0' : _buffer);
      _buffer = '';
      setState(() {
        _output = buttonText;
      });
    } else if (buttonText == '=') {
      _num2 = double.parse(_buffer.isEmpty ? '0' : _buffer);
      _calculate();
    } else if (buttonText == '.') {
      if (!_buffer.contains('.')) {
        setState(() {
          _buffer += buttonText;
          _output = _buffer;
        });
      }
    } else {
      setState(() {
        if (_buffer.length < 10) {
          _buffer += buttonText;
          _output = _buffer;
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
      _buffer = result.toString();
    });
  }

  void _delete() {
    setState(() {
      if (_buffer.isNotEmpty) {
        _buffer = _buffer.substring(0, _buffer.length - 1);
        _output = _buffer.isEmpty ? '0' : _buffer;
      }
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
          Expanded(child: const Text(' ')),
          Container(
            padding: EdgeInsets.only(top:40, right: 20),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Expanded(child: const Text(' ')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('C'),
              _buildButton('⌫')
            ],
          ),
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
              _buildButton('.'),
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
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      side: BorderSide(width: 2, color: Colors.blue),
   ),
        onPressed: () {
          _buttonPressed(buttonText);
        },
        child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 32,
          height: 3,
          color: Colors.black,
          letterSpacing:0,
        ),
        ),
        ),
    );
  }
}
