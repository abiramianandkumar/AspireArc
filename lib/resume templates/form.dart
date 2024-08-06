// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:aspire_arc/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormUI extends StatelessWidget {
  const FormUI({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF4ECF7),
        title: Text(
          'User Information',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'General Information',
                style: GoogleFonts.poppins(fontSize: 25),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                labelText: 'Name',
                controller: _name,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Email',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Title',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'LinkedIn',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Github',
                controller: _email,
              ),
              SizedBox(height: 50),
              Text(
                'Experience',
                style: GoogleFonts.poppins(fontSize: 25),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                labelText: 'Title',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Company',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Start Date',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'End Date',
                controller: _email,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Icon(Icons.add)),
              CustomTextField(
                labelText: 'Company',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Company',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Company',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Company',
                controller: _email,
              ),
              SizedBox(height: 20),
              CustomTextField(
                labelText: 'Company',
                controller: _email,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
