// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:aspire_arc/components/drawer.dart';
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
          style: GoogleFonts.poppins(letterSpacing: 0.3,fontWeight:FontWeight.w800),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
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
                      onPressed: () {
                      
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        //  Icon(Icons.home_outlined),
                          Text(
                            'Resume',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          ),
                        ],
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
                      onPressed: () {
                          Navigator.pushNamed(context, '/job');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.wallet_travel_rounded),
                          SizedBox(height: 10,),
                          Text(
                            'Career',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          ),
                          Text(
                            'Suggestion',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          ),
                        ],
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
                      onPressed: () {
                          Navigator.pushNamed(context, '/prevhome');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.assignment_rounded),
                          SizedBox(height: 10,),
                          Text(
                            'Aptitude',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          ),
                          Text(
                            'Test',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          ),
                        ],
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
                      onPressed: () {
                          Navigator.pushNamed(context, '/onlinecourses');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.card_membership_rounded),
                          SizedBox(height: 10,),
                          Text(
                            'Online',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          ),
                           Text(
                            'Courses',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 10, shadowColor: Colors.black,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                ),)),
                ),
              ],
            ),
            SizedBox(width: 50,),
            SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                          Navigator.pushNamed(context, '/atspage');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code_2_rounded),
                          SizedBox(height: 10,),
                          Text(
                            'ATS',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          ),
                           Text(
                            'Scanner',
                            style: GoogleFonts.poppins(color: Colors.black,fontWeight:FontWeight.w600),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 10, shadowColor: Colors.black,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                ),)),
                ),
          ],
        ),
      ),
    );
  }
}
