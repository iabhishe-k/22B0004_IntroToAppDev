import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                'Counter Value',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Wrap(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              child: Icon(Icons.add),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}