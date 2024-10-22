import 'conversion_service.dart';

class ConversionServiceImpl implements ConversionService {
  @override
  double convert(String stringValue, String fromUnit, String toUnit) {
    try {
      //Converting string to double
      double value = double.parse(stringValue);
      switch (fromUnit) {
        case 'meters':
          return _convertMeters(value, toUnit);
        case 'kilometers':
          return _convertKilometers(value, toUnit);
        case 'feet':
          return _convertFeet(value, toUnit);
        case 'miles':
          return _convertMiles(value, toUnit);
        default:
          throw Exception('Something went wrong!');
      }
    } catch (e) {
      if (e is FormatException) {
        throw ('Invalid Value');
      }
      throw (e.toString());
    }
  }

  ///Method to convert distance measure in meter to kilometers, miles or feet.
  double _convertMeters(double value, String toUnit) {
    switch (toUnit) {
      case 'kilometers':
        return value * 0.001; // Convert meters to kilometers
      case 'miles':
        return value * 0.000621371; // Convert meters to miles
      case 'feet':
        return value * 3.28084; // Convert meters to feet
      default:
        return value;
    }
  }

  ///Method to convert distance measure in kilometers to meter, miles or feets.
  double _convertKilometers(double value, String toUnit) {
    switch (toUnit) {
      case 'meters':
        return value * 1000; // Convert kilometers to meters
      case 'miles':
        return value * 0.621371; // Convert kilometers to miles
      case 'feet':
        return value * 3280.84; // Convert kilometers to feet
      default:
        return value;
    }
  }

  ///Method to convert distance measure in feet to meters, miles or kilometers
  double _convertFeet(double value, String toUnit) {
    switch (toUnit) {
      case 'meters':
        return value * 0.3048; // Convert feet to meters
      case 'miles':
        return value * 0.000189394; // Convert feet to miles
      case 'kilometers':
        return value * 0.0003048; // Convert feet to kilometers
      default:
        return value;
    }
  }

  ///Method to convert distance measure in miles to meters, feet or kilometers
  double _convertMiles(double value, String toUnit) {
    switch (toUnit) {
      case 'meters':
        return value * 1609.34; // Convert miles to meters
      case 'kilometers':
        return value * 1.60934; // Convert miles to kilometers
      case 'feet':
        return value * 5280; // Convert miles to feet
      default:
        return value;
    }
  }
}
