import 'package:flutter/material.dart';
import 'package:aspire_arc/pages/resumes/templates/template1.dart';
import 'package:aspire_arc/pages/resumes/pdf_generator.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';
  String experience = '';
  String education = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) => phone = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Experience'),
                onSaved: (value) => experience = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Education'),
                onSaved: (value) => education = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  _formKey.currentState!.save();
                  await generatePdf(name, email, phone, experience, education);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResumeTemplateOne(
                        name: name,
                        email: email,
                        phone: phone,
                        experience: experience,
                        education: education,
                      ),
                    ),
                  );
                },
                child: Text('Generate Resume'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
