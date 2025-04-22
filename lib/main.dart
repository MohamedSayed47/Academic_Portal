import 'package:flutter/material.dart';
import 'login_page.dart'; // 👈 import your login page
import 'Home/home_page.dart';
void main() {
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomePage(), // 👈 this is where LoginPage is launched
    );
  }
}
