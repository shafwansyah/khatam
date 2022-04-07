import 'package:flutter/material.dart';
import 'package:khatam/pages/dashboard.dart';
import 'package:khatam/pages/detail.dart';
import 'package:khatam/pages/reading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khatam Ramadhan',
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
