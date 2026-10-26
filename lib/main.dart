import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}


void main() async {
  print("Initializing sensor handshake...");

  String metadata = await fetchSensorMetadata();
  print(metadata);

  print("Sensor initialization complete.");
}

Future<String> fetchSensorMetadata() async {
 await Future.delayed(const Duration(seconds: 2));
 return "Sensor ID: 402 | Location: Warehouse-A";
}
