import 'package:aspire_arc/components/bgimage.dart';
import 'package:aspire_arc/components/button.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              padding: const EdgeInsets.only(top:150.0),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start ,
                children: [
                  Text(
                    'SIGN UP',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                      color: Colors.deepPurple,
                    ),
                    ),
                    Container(
                      padding: EdgeInsets.all(230),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration:BoxDecoration( 
                       color: Colors.white,
                      borderRadius:BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                              )
                            ),
                            
                          ),
                          TextField(),
                        ],
                      ),
                      
                    )
                                    ],
                
                ),
                
            ),
          ),
        )
      ],
    );
  }
}