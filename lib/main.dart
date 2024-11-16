import 'package:flight_booking/ui/flight_search.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFC4E59E),
          ),
          scaffoldBackgroundColor: const Color(0xFFF8F8F8)),
      home: const Home(),
    );
  }
}
