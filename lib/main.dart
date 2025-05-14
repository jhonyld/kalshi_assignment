import 'package:flutter/material.dart';
import 'views/form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Wellness',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const FormPage(),
    );
  }
}
