import 'package:academic_portal/news_page.dart';
import 'package:academic_portal/result_page.dart';
import 'package:academic_portal/schedule_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: news_page());
  }
}
