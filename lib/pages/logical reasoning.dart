import 'dart:async';
import 'package:flutter/material.dart';
import 'package:aspire_arc/models/sample_questions.dart'; // Import your question data
import 'result_screen.dart'; // Import your result screen

typedef void OnSubmit(double score, int timeElapsed); // Adjusted to include timeElapsed

class LogicalReasoningPage extends StatefulWidget {
  final OnSubmit onSubmit;

  LogicalReasoningPage({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _LogicalReasoningPageState createState() => _LogicalReasoningPageState();
}

class _LogicalReasoningPageState extends State<LogicalReasoningPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<int?> _selectedAnswers = []; // List to hold selected answer indices
  bool isSubmitted = false;
  double score = 0;
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;
  int timeElapsedInSeconds = 0;
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        timeElapsedInSeconds = stopwatch.elapsed.inSeconds;
      });
    });
    stopwatch.start();
  }

  void stopTimer() {
    stopwatch.stop();
    timer.cancel();
  }

  @override
  void dispose() {
    stopwatch.stop();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logical Reasoning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question: ${sampleQuestions[currentQuestionIndex].question}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sampleQuestions[currentQuestionIndex].answers.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int?>(
                    title: Text(sampleQuestions[currentQuestionIndex].answers[index]),
                    value: index,
                    groupValue: _selectedAnswers[currentQuestionIndex],
                    onChanged: (value) {
                      setState(() {
                        _selectedAnswers[currentQuestionIndex] = value;
                      });
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calculateScore();
                  }
                },
                child: Text('Next Question'),
              ),
              SizedBox(height: 20),
              isSubmitted
                  ? Text(
                      'Score: $score',
                      style: TextStyle(fontSize: 18),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateScore() {
    int? userAnswerIndex = _selectedAnswers[currentQuestionIndex];
    int correctAnswerIndex = sampleQuestions[currentQuestionIndex].correctAnswerIndex;
    setState(() {
      score += (userAnswerIndex == correctAnswerIndex) ? 10.0 : 0.0;
      currentQuestionIndex++;
      isSubmitted = true;
      if (currentQuestionIndex >= sampleQuestions.length) {
        stopTimer();
        widget.onSubmit(score, timeElapsedInSeconds);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score: score, timeElapsed: timeElapsedInSeconds.toDouble()),
          ),
        );
      }
    });
  }
}
