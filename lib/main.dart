import 'package:contact_application/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contact App",
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
