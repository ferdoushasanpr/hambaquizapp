import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hambaquiz/data/questions.dart";

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.summary, this.changeScreen, {super.key});

  final List<Map<String, Object>> summary;
  final void Function() changeScreen;

  int get numberOfQuestions => questions.length;

  int get numberOfCorrectAnswers => summary.where((data) {
    return data["user_answer"] == data["correct_answer"];
  }).length;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "You have made $numberOfCorrectAnswers out of $numberOfQuestions!",
            style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...summary.map((data) {
                    int questionIndex = (data['question_index'] as int) + 1;
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color:
                                  data["user_answer"] == data["correct_answer"]
                                  ? const Color.fromARGB(255, 141, 243, 145)
                                  : const Color.fromARGB(255, 250, 115, 105),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              questionIndex.toString(),
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['question'].toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                  softWrap: true,
                                ),
                                Text(
                                  data['user_answer'].toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color:
                                        data["user_answer"] ==
                                            data["correct_answer"]
                                        ? const Color.fromARGB(
                                            255,
                                            141,
                                            243,
                                            145,
                                          )
                                        : const Color.fromARGB(
                                            255,
                                            250,
                                            115,
                                            105,
                                          ),
                                  ),
                                ),
                                Text(
                                  data['correct_answer'].toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                      255,
                                      141,
                                      243,
                                      145,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          TextButton.icon(
            onPressed: changeScreen,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text(
              "Reset Quiz",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
