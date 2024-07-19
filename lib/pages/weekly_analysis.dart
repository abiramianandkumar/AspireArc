import 'package:flutter/material.dart';
import 'package:aspire_arc/models/weekly_score.dart';
import 'package:aspire_arc/models/test_history.dart';
import 'package:aspire_arc/services/firebase_service.dart';

class WeeklyAnalysisPage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Analysis'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StreamBuilder<List<WeeklyScore>>(
              stream: _firestoreService.getWeeklyScores(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<WeeklyScore> scores = snapshot.data!;
                  return ListView.builder(
                    itemCount: scores.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return ListTile(
                          title: Text('Week ${scores[index].week}'),
                          subtitle: Text('Score: ${scores[index].score.toStringAsFixed(2)}'),
                        );
                      } else {
                        double improvement = ((scores[index].score - scores[index - 1].score) / scores[index - 1].score) * 100;
                        return ListTile(
                          title: Text('Week ${scores[index].week}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Score: ${scores[index].score.toStringAsFixed(2)}'),
                              Text('Improvement: ${improvement.toStringAsFixed(2)}%'),
                            ],
                          ),
                        );
                      }
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<List<TestHistory>>(
              stream: _firestoreService.getTestHistory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<TestHistory> testHistory = snapshot.data!;
                  return ListView.builder(
                    itemCount: testHistory.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Test Name: ${testHistory[index].testName}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Score: ${testHistory[index].score.toStringAsFixed(2)}'),
                            Text('Completion Time: ${testHistory[index].completionTime}'),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
