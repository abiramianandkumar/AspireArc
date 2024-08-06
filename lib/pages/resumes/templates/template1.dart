import 'package:flutter/material.dart';

class ResumeTemplateOne extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String experience;
  final String education;

  ResumeTemplateOne({
    required this.name,
    required this.email,
    required this.phone,
    required this.experience,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Template 1'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Email: $email', style: TextStyle(fontSize: 16)),
            Text('Phone: $phone', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Experience:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(experience, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Education:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(education, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
