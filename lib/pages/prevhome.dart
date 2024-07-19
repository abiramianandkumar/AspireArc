import 'package:flutter/material.dart';
import 'package:aspire_arc/pages/description_page.dart';
import 'package:aspire_arc/pages/logical reasoning.dart';
import 'package:aspire_arc/pages/verbal reasoning.dart';
import 'package:aspire_arc/pages/weekly_analysis.dart';
import 'package:aspire_arc/models/test_history.dart';
import 'package:aspire_arc/services/firebase_service.dart';
import 'package:google_fonts/google_fonts.dart';

class Prevhome extends StatefulWidget {
  const Prevhome({Key? key}) : super(key: key);

  @override
  _PrevhomeState createState() => _PrevhomeState();
}

class _PrevhomeState extends State<Prevhome> {
  final FirestoreService _firestoreService = FirestoreService();
  late Stream<List<TestHistory>> _testHistoryStream;

  @override
  void initState() {
    super.initState();
    _testHistoryStream = _firestoreService.getTestHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF4ECF7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'APTITUDE TEST',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF8F9F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTestButton(context, 'ARITHMETIC APTITUDE', () {
              _navigateToDescriptionPage('Arithmetic Aptitude');
            }),
            SizedBox(height: 10),
            _buildTestButton(context, 'VERBAL REASONING', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerbalReasoningPage(
                    onSubmit: (score, timeElapsed) =>
                        _addTestHistory('Verbal Reasoning', score, timeElapsed),
                  ),
                ),
              );
            }),
            SizedBox(height: 70),
            _buildTestButton(context, 'LOGICAL REASONING', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogicalReasoningPage(
                    onSubmit: (score, timeElapsed) =>
                        _addTestHistory('Logical Reasoning', score, timeElapsed),
                  ),
                ),
              );
            }),
            SizedBox(height: 10),
            _buildTestButton(context, 'WEEKLY ANALYSIS', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeeklyAnalysisPage(),
                ),
              );
            }),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<TestHistory>>(
                stream: _testHistoryStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error loading test history'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No test history available'));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final testHistory = snapshot.data![index];
                      return ListTile(
                        title: Text(testHistory.testName),
                        subtitle: Text('Score: ${testHistory.score}\nTime Elapsed: ${testHistory.timeElapsed}s\nCompleted on: ${testHistory.completionTime}'),
                        isThreeLine: true,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDescriptionPage(String testName) {
    // Navigate to description page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DescriptionPage(testName: testName),
      ),
    );
  }

  Widget _buildTestButton(BuildContext context, String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Color(0xffF4ECF7), // Set text color
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffAD51D3), // Use the buttonColor variable here
        minimumSize: Size(double.infinity, 100),
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Future<void> _addTestHistory(String testName, double score, int timeElapsed) async {
  try {
    await _firestoreService.addTestHistory(TestHistory(
      testName: testName,
      score: score,
      completionTime: DateTime.now(),
      timeElapsed: timeElapsed.toDouble(), // Convert int to double here
    ));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Test score added successfully'),
      duration: Duration(seconds: 2),
    ));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Failed to add test score'),
      duration: Duration(seconds: 2),
    ));
  }
}

}
