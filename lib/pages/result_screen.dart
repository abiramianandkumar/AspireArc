import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double score;
  final double timeElapsed; // Changed to double

  ResultScreen({required this.score, required this.timeElapsed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Result'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Time Elapsed: ${timeElapsed ~/ 60}:${(timeElapsed % 60).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 18.0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
