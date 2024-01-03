import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Makinesi'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildOperatorButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildOperatorButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildOperatorButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('0'),
              _buildDecimalButton('.'),
              _buildOperatorButton('+'),
              _buildEqualButton(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildClearButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => _onDigitPress(buttonText),
      child: Text(buttonText),
    );
  }

  Widget _buildOperatorButton(String operator) {
    return ElevatedButton(
      onPressed: () => _onOperatorPress(operator),
      child: Text(operator),
    );
  }

  Widget _buildEqualButton() {
    return ElevatedButton(
      onPressed: _onEqualPress,
      child: Text('='),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: _onClearPress,
      child: Text('C'),
    );
  }

  Widget _buildDecimalButton(String decimal) {
    return ElevatedButton(
      onPressed: () => _onDecimalPress(decimal),
      child: Text(decimal),
    );
  }

  void _onDigitPress(String digit) {
    setState(() {
      _output += digit;
    });
  }

  void _onOperatorPress(String operator) {
    setState(() {
      _num1 = double.parse(_output);
      _operator = operator;
      _output = '';
    });
  }

  void _onEqualPress() {
    setState(() {
      _num2 = double.parse(_output);
      switch (_operator) {
        case '+':
          _output = (_num1 + _num2).toString();
          break;
        case '-':
          _output = (_num1 - _num2).toString();
          break;
        case '*':
          _output = (_num1 * _num2).toString();
          break;
        case '/':
          if (_num2 != 0) {
            _output = (_num1 / _num2).toString();
          } else {
            _output = 'Hata';
          }
          break;
        default:
          _output = 'Hata';
      }
    });
  }

  void _onClearPress() {
    setState(() {
      _output = '';
      _num1 = 0;
      _num2 = 0;
      _operator = '';
    });
  }

  void _onDecimalPress(String decimal) {
    if (!_output.contains('.')) {
      setState(() {
        _output += decimal;
      });
    }
  }
}
