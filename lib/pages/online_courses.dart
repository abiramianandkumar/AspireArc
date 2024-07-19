// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:aspire_arc/components/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OnlineCourses extends StatelessWidget {
  const OnlineCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF4ECF7),
        title: Text(
          'Online Courses',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      backgroundColor: Color(0xffF8F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/programming');
                        },
                        child: Column(
                          children: [
                            Image.asset('lib/assets/prog.png'),
                            Text(
                              'Programming',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset('lib/assets/android.png'),
                            Text(
                              'Mobile',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                            Text(
                              'Development',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(color: Color(0xffF4ECF7)),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('lib/assets/bussiness.png'),
                            Text(
                              'Bussiness ',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                            Text(
                              'Analytics ',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset('lib/assets/web.png'),
                            Text(
                              'Web',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                            Text(
                              'Development',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
