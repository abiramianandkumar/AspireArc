import 'package:flutter/material.dart';
import 'package:aspire_arc/models/test_history.dart'; // Import your test history model

class TestHistoryPage extends StatelessWidget {
  final List<TestHistory> testHistory;

  const TestHistoryPage({Key? key, required this.testHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test History'),
      ),
      body: ListView.builder(
        itemCount: testHistory.length,
        itemBuilder: (context, index) {
          // Format completion time
          String formattedTime = '${testHistory[index].completionTime.hour}:${testHistory[index].completionTime.minute.toString().padLeft(2, '0')}';

          return ListTile(
            title: Text(testHistory[index].testName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Score: ${testHistory[index].score.toStringAsFixed(2)}'),
                Text('Completed: $formattedTime'), // Display formatted completion time
              ],
            ),
          );
        },
      ),
    );
  }
}
