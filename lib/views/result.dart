import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String value;
  final String fromMeasure;
  final String toMeasure;
  final String result;

  const Result({
    super.key,
    required this.value,
    required this.fromMeasure,
    required this.toMeasure,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return value.isEmpty
        ? const Text('Result:')
        : Text('$value $fromMeasure are $result $toMeasure');
  }
}
