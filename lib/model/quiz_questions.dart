class QuizQuestions {
  QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledList() {
    final suffledList = List.of(answers);
    suffledList.shuffle();
    return suffledList;
  }
}
