import 'package:flutter/material.dart';

class DropdownTextField extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onChanged;
  final List<String> items;

  const DropdownTextField({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: onChanged,
      isExpanded: true,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Colors.blue),
          ),
        );
      }).toList(),
    );
  }
}
