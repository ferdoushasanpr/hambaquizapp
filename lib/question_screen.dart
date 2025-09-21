import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

import 'package:hambaquiz/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.changeScreen, {super.key});

  final void Function(List<Map<String, Object>>) changeScreen;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestion = 0;
  List<String> selectedAnswers = [];

  changeQuestion() {
    setState(() {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      } else {
        widget.changeScreen(getSummaryData());
        selectedAnswers = [];
        currentQuestion = 0;
      }
    });
  }

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              questions[currentQuestion].text,
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontSize: 22, color: Colors.white),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ...questions[currentQuestion].getShuffledAnswers().map((answer) {
            return ElevatedButton(
              onPressed: () {
                selectedAnswers.add(answer);
                changeQuestion();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 72, 49, 120),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                answer,
                style: GoogleFonts.lato(),
                textAlign: TextAlign.center,
              ),
            );
          }),
        ],
      ),
    );
  }
}
