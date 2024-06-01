// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aspire_arc/components/bgimage.dart';
import 'package:aspire_arc/components/button.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'SIGN UP',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    margin: EdgeInsets.symmetric(horizontal: 50),
                   
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            label: Text(
                              'Username',
                              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email, color: Colors.blue),
                            label: Text(
                              'Email',
                              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check, color: Colors.blue),
                            label: Text(
                              'Create password',
                              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check, color: Colors.blue),
                            label: Text(
                              'Confirm password',
                              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MyButton(
                          onTap: () {
                          
                          },
                          text: 'Sign Up',
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                           
                          },
                          
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
