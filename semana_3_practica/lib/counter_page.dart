import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana_3_practica/counter_buttons.dart';
import 'package:semana_3_practica/counter_provider.dart';
import 'counter_text.dart';

/*class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increment() {
    _counter++;

    setState(() {});
  }

  void _decrement() {
    _counter--;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador con setState')),
      body: Column(
        children: [
          CounterText(value: _counter),
          SizedBox(height: 10),
          CounterButtons(onDecrement: _decrement, onIncrement: _increment),
        ],
      ),
    );
  }
}*/

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<Counterprovider>().value;
    return Scaffold(
      appBar: AppBar(title: Text('Contador con Provider')),
      body: Column(
        children: [
          CounterText(value: value),
          SizedBox(height: 16),
          CounterButtons(),
        ],
      ),
    );
  }
}
