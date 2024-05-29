// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aspire_arc/components/bgimage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatefulWidget {
   GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Column(
                children: [
                  Text('ASPIRE ARC',style: GoogleFonts.poppins(fontWeight:FontWeight.bold,fontSize:30,color:Color(0xffEBDEF0)),)
                ],
              
              ),
            ),
          ),
        ),
       ],
    );
  }
}
