import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana_3_practica/counter_provider.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.read<Counterprovider>();
    return Row(
      children: [
        IconButton(onPressed: counter.decrement, icon: Icon(Icons.remove)),
        SizedBox(width: 16),
        IconButton(onPressed: counter.increment, icon: Icon(Icons.add)),
      ],
    );
  }
}

/*class CounterButtons extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterButtons({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onDecrement, icon: Icon(Icons.remove)),
        SizedBox(width: 16),
        IconButton(onPressed: onIncrement, icon: Icon(Icons.add)),
      ],
    );
  }
}*/
