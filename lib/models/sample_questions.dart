class Question {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({required this.question, required this.answers, required this.correctAnswerIndex});
}

List<Question> sampleQuestions = [
  Question(
    question: 'What is 2 + 2?',
    answers: ['3', '4', '5', '6'],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'What is 3 + 5?',
    answers: ['7', '8', '9', '10'],
    correctAnswerIndex: 1,
  ),
  // Add more questions as needed
];
