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
        BackgroundImage(), // Ensure this component is not null
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView( // Added SingleChildScrollView to prevent overflow
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 150), // Adjusted top padding
                    Text(
                      'SIGN UP',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color: Color(0xffAD51D3),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              label: Text(
                                'Username',
                                style: TextStyle(fontSize: 20, color: Color(0xffF4ECF7)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email, color: Color(0xffAD51D3)),
                              label: Text(
                                'Email',
                                style: TextStyle(fontSize: 20, color: Color(0xffF4ECF7)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check, color: Color(0xffAD51D3)),
                              label: Text(
                                'Create password',
                                style: TextStyle(fontSize: 20, color: Color(0xffF4ECF7)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check, color: Color(0xffAD51D3)),
                              label: Text(
                                'Confirm password',
                                style: TextStyle(fontSize: 20, color: Color(0xffF4ECF7)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          MyButton(
                            onTap: () {
                              // Add your sign-up logic here
                            },
                            text: 'Sign Up',
                          ),
                          SizedBox(height: 20), // Adjusted spacing after the button
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
