import 'package:aspire_arc/components/bgimage.dart';
import 'package:aspire_arc/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aspire_arc/components/textfield.dart'; 

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
        BackgroundImage(), 
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView( 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'SIGN IN',
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
                          CustomTextField(
                            labelText: 'Username',
                            suffixIcon: Icon(Icons.person, color: Color(0xffAD51D3)),
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            labelText: 'Password',
                            obscureText: true,
                            suffixIcon: Icon(Icons.lock, color: Color(0xffAD51D3)),
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
                              Navigator.pushNamed(context, '/homepage');
                            },
                            text: 'Sign In',
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/homepage');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Don't have an account? Sign Up",
                                style: TextStyle(fontSize: 16, color: Color(0xffF4ECF7)),
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
