import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  final int value;
  const CounterText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text('Valor $value', style: TextStyle(fontSize: 32));
  }
}
