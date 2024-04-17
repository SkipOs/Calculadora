import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Calculadora',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('EXIBIÇÃO'),
              //Linha 1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: null, child: Text('7')),
                  ElevatedButton(onPressed: null, child: Text('8')),
                  ElevatedButton(onPressed: null, child: Text('9')),
                  ElevatedButton(onPressed: null, child: Text('/'))
                ],
              ),

              //Linha 2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: null, child: Text('4')),
                  ElevatedButton(onPressed: null, child: Text('5')),
                  ElevatedButton(onPressed: null, child: Text('6')),
                  ElevatedButton(onPressed: null, child: Text('*'))
                ],
              ),
              //Linha 3
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: null, child: Text('1')),
                  ElevatedButton(onPressed: null, child: Text('2')),
                  ElevatedButton(onPressed: null, child: Text('3')),
                  ElevatedButton(onPressed: null, child: Text('-'))
                ],
              ),
              //Linha 3
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: null, child: Text('C')),
                  ElevatedButton(onPressed: null, child: Text('0')),
                  ElevatedButton(onPressed: null, child: Text('=')),
                  ElevatedButton(onPressed: null, child: Text('+'))
                ],
              ),
            ],
          )),
    );
  }
}
