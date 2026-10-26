import 'package:flutter/material.dart';

void main() async {
  print("Initializing sensor handshake...");

  String metadata = await fetchSensorMetadata();
  print(metadata);

  print("Sensor initialization complete.");


  await for (double temperature in temperatureStream()) {
    if (temperature > 35.0) {
      double Fahrenheit = (temperature * 1.8) + 32;
      print("Current Temperature: ${Fahrenheit.toStringAsFixed(2)} °F");
    }
    else{
      print("Current Temperature: ${temperature.toStringAsFixed(2)} °C");
    }

  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}


Future<String> fetchSensorMetadata() async {
 await Future.delayed(const Duration(seconds: 5));
 return "Sensor ID: 402 | Location: Warehouse-A";
}


Stream<double> temperatureStream() async* {
  List<double> simulatedTemps = [22.5, 31.0, 36.8, 40.2, 28.4];
  
  for (double temp in simulatedTemps) {
    await Future.delayed(const Duration(seconds: 5));
    yield temp;
  }
}