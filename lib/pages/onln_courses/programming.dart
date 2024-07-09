// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Programming extends StatelessWidget {
  const Programming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF4ECF7),
        title: Text(
          'Programming Courses',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
           width: double.infinity,
            decoration: BoxDecoration(color: Colors.cyan),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('hjgj'),
                Text('hjvhv'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('hjgj',style:TextStyle(fontSize: 40),),
            ],
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
