import 'package:cloud_firestore/cloud_firestore.dart';

class WeeklyScore {
  final double week;
  final double score;

  WeeklyScore({
    required this.week,
    required this.score,
  });

  factory WeeklyScore.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) {
      throw Exception('DocumentSnapshot is null!');
    }
    return WeeklyScore(
      week: data['week'],
      score: data['score'].toDouble(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'week': week,
      'score': score,
    };
  }
}
