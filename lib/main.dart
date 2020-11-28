import 'package:flutter/material.dart';
import 'package:bmi_app_own_challenge/screens/bmi_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: BmiPage(),
    );
  }
}
