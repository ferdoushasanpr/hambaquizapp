import 'package:flutter/material.dart';

import 'package:hambaquiz/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamba Quiz',
      home: Scaffold(body: Quiz()),
    );
  }
}
