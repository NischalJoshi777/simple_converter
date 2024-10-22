import 'package:flutter/material.dart';

///Elevated button UI
class ConvertButton extends StatelessWidget {
  final VoidCallback?  onPressed;

  const ConvertButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Convert',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}