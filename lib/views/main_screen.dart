import 'package:convertor/service/conversion_service.dart';
import 'package:convertor/service/conversion_service_impl.dart';
import 'package:convertor/views/dropdown_text_field.dart';
import 'package:convertor/views/form_header.dart';
import 'package:convertor/views/result.dart';
import 'package:convertor/views/value_form_field.dart';
import 'package:flutter/material.dart';

import 'convertor_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ///Text editing controller for value conversion
  final TextEditingController _valueController = TextEditingController();

  ///Conversion items
  List<String> items = [
    'miles',
    'feet',
    'kilometers',
    'meters',
  ];

  /// String to store the input value
  String _inputValue = '';

  ///Temporary  for the dropdown selections
  String _selectedFromValue = 'miles';
  String _selectedToValue = 'kilometers';

  ///String variable for from value
  String _fromValue = 'miles';

  ///String variable for to value
  String _toValue = 'kilometers';

  ///String variable to show result in the UI
  String _result = '';

  ///Creating instance of the conversion service
  final ConversionService conversionService = ConversionServiceImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Measures Convertor',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FormHeader(headerText: 'Value'),
              ValueFormField(valueController: _valueController),
              const FormHeader(headerText: 'From'),
              DropdownTextField(
                items: items,
                selectedValue: _selectedFromValue,
                onChanged: (String? value) {
                  //rebuilds the widgets by setting the new value
                  setState(() {
                    _selectedFromValue = value ?? "-";
                  });
                },
              ),
              const FormHeader(headerText: 'To'),
              DropdownTextField(
                items: items,
                selectedValue: _selectedToValue,
                onChanged: (String? value) {
                  //rebuilds the widgets by setting the new value
                  setState(() {
                    _selectedToValue = value ?? "-";
                  });
                },
              ),
              const SizedBox(height: 20.0),
              ConvertButton(onPressed: _convert),
              const SizedBox(height: 20.0),
              Result(
                value: _inputValue,
                fromMeasure: _fromValue,
                toMeasure: _toValue,
                result: _result,
              )
            ],
          ),
        ),
      ),
    );
  }

  ///method to handle conversion in UI
  void _convert() {
    try {
      double value = conversionService.convert(
        _valueController.text,
        _selectedFromValue,
        _selectedToValue,
      );
      //rebuilds the widgets by setting the new value
      setState(() {
        _inputValue = _valueController.text;
        _fromValue = _selectedFromValue; // Update _fromValue only on conversion
        _toValue = _selectedToValue; // Update _toValue only on conversion
        _result = value.toString();
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
