class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    List<String> shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle(); //shuffle is a void type function.
    return shuffledAnswer;
  }
}
