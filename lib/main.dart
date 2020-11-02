import 'package:bmi_calculator/bmi_first_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0D22),
          scaffoldBackgroundColor: Color(0xFF0A0D22),
          textTheme: TextTheme(headline4: TextStyle(color: Colors.blueAccent))),
      home: BMIFirstPage(),
    );
  }
}
