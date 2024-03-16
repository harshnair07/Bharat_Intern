class Quizquestion {
  const Quizquestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getshuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
