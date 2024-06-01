// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aspire_arc/components/bgimage.dart';
import 'package:aspire_arc/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _loginpageState();
}

class _loginpageState extends State<LoginPage> {
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
                      'SIGN IN',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color: Colors.deepPurple,
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
                                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.check, color: Colors.blue),
                              label: Text(
                                'Password',
                                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
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
