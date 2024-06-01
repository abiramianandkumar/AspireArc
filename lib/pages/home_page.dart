// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8F9F9),
        title: Text(
          'Home',
          style: GoogleFonts.poppins(letterSpacing: 0.3),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffF8F9F9),
      body: Padding(
        
        padding: const EdgeInsets.all(30.0),
        child: Column(
          
          children: [
            
            
            Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Resume',
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 10, shadowColor: Colors.black,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                ),)),
                ),
                SizedBox(width: 50,),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Resume',
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 10, shadowColor: Colors.black,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                ),)),
                ),
              ],
            ),
            SizedBox(height: 50,),
             Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Resume',
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 10, shadowColor: Colors.black,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                ),)),
                ),
                SizedBox(width: 50,),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Resume',
                        style: GoogleFonts.poppins(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 10, shadowColor: Colors.black,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                ),)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
