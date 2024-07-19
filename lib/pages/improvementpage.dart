import 'package:flutter/material.dart';
import 'package:aspire_arc/data structure/score.dart';

class ImprovementDetailsPage extends StatelessWidget {
  final List<WeeklyScore> scores;

  ImprovementDetailsPage({Key? key, required this.scores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> improvements = calculateImprovementsPercentage(scores);

    return Scaffold(
      appBar: AppBar(
        title: Text('Improvement Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 1; i < scores.length; i++)
              ListTile(
                title: Text('Week ${scores[i].week}'),
                subtitle: Text('Score: ${scores[i].score.toStringAsFixed(2)}'),
                trailing: Text('Improvement: ${improvements[i - 1].toStringAsFixed(2)}%'),
              ),
          ],
        ),
      ),
    );
  }
}
