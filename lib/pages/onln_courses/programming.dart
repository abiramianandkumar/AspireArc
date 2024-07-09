// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Programming extends StatelessWidget {
  const Programming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF4ECF7 ),
        title: Text(
          'Programming Courses',
          
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Container(height: 100,decoration: BoxDecoration(color: Colors.cyan),child: Column(children: [
                  

              ],),)
            ],)
          ],
        ),
      ),
    );
  }
}
