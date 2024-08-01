import 'package:flutter/material.dart';
import 'package:aspire_arc/pages/logical reasoning.dart';

class DescriptionPage extends StatelessWidget {
  final String testName;

  DescriptionPage({required this.testName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$testName Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to the $testName Test!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Description: Logical Reasoning assesses your ability to think clearly and solve problems using structured thinking. It includes tasks like number series, pattern recognition, and logical puzzles. This section tests your analytical skills and problem-solving abilities.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogicalReasoningPage(
                      onSubmit: (score, timeElapsed) {
                        // Handle the onSubmit callback if needed
                      },
                    ),
                  ),
                );
              },
              child: Text('Start Test'),
            ),
          ],
        ),
      ),
    );
  }
}
