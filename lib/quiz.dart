import "package:flutter/material.dart";

import 'package:hambaquiz/question_screen.dart';
import 'package:hambaquiz/start_screen.dart';
import "package:hambaquiz/result_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  late Widget activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(onPressed);
    super.initState();
  }

  void onPressed() {
    setState(() {
      activeScreen = QuestionScreen(changeScreenToResult);
    });
  }

  void changeScreenToResult(List<Map<String, Object>> summaryData) {
    setState(() {
      activeScreen = ResultScreen(summaryData, changeScreenToStart);
    });
  }

  void changeScreenToStart() {
    setState(() {
      activeScreen = StartScreen(onPressed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 91, 50, 160),
            const Color.fromARGB(255, 118, 93, 163),
          ],
        ),
      ),
      child: activeScreen,
    );
  }
}
