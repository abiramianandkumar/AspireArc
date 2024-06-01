// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aspire_arc/components/bgimage.dart';
import 'package:aspire_arc/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                    SizedBox(height: 50), // Adjusted top padding
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
                            obscureText: true,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.lock, color: Colors.blue),
                              label: Text(
                                'Password',
                                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              // Add your forgot password logic here
                            },
                          
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                              ),
                            ),
                          ),
                          
                          MyButton(
                            onTap: () {
                              // Add your sign-in logic here
                            },
                            text: 'Sign In',
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              // Navigate to Sign Up page
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Don't have an account? Sign Up",
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
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
        ),
      ],
    );
  }
}
