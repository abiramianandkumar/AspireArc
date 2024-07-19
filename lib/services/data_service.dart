// services/data_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aspire_arc/models/test_history.dart';
import 'package:aspire_arc/models/weekly_score.dart';

class DataService {
  final CollectionReference testHistoryCollection =
      FirebaseFirestore.instance.collection('testHistory');

  Future<List<WeeklyScore>> fetchWeeklyScores() async {
    // Simulate fetching data from a real-time database
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      WeeklyScore(week: 1.0, score: 75),
      WeeklyScore(week: 2.0, score: 80),
      WeeklyScore(week: 3.0, score: 60),
      WeeklyScore(week: 4.0, score: 70),
    ];
  }

  Future<List<TestHistory>> fetchTestHistory() async {
    // Fetch test history from Firestore
    final querySnapshot = await testHistoryCollection.get();
    return querySnapshot.docs.map((doc) => TestHistory.fromFirestore(doc)).toList();
  }

  Future<void> addTestHistory(TestHistory history) async {
    // Add test history to Firestore
    await testHistoryCollection.add(history.toFirestore());
  }
}
