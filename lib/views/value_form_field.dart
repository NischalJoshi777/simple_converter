import 'package:flutter/material.dart';

class ValueFormField extends StatelessWidget {
  final TextEditingController valueController;

  const ValueFormField({
    super.key,
    required this.valueController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: valueController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: Colors.blue),
        hintText: 'Enter value',
        border: UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
