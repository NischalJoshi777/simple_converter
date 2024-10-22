import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String headerText;

  const FormHeader({
    super.key,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      style: const TextStyle(
        fontSize: 36.0,
      ),
    );
  }
}