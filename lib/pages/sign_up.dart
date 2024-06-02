import 'package:aspire_arc/components/bgimage.dart';
import 'package:aspire_arc/components/button.dart';
import 'package:aspire_arc/helper/helper_fn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aspire_arc/components/textfield.dart'; 

class SignUp extends StatefulWidget {
  final void Function()? onTap;

  const SignUp({super.key, required this.onTap});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   final TextEditingController usernameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPwController = TextEditingController();

   void signupuser() async{
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordController.text != confirmPwController.text) {
      //show loading circle
      Navigator.pop(context);

      //show error msg
      DisplayMessageToUser("password don't match",context);
    }

    //try creating the user
    try {
      //create the user
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);

      //pop loading circle
      Navigator.pop(context);
    }on FirebaseAuthException catch(e) {
      Navigator.pop(context);

      //disply error msg
      DisplayMessageToUser(e.code, context);
    }
   }

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
                    SizedBox(height: 150), 
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: usernameController,
                            labelText: 'Username',
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            controller: emailController,
                            labelText: 'Email',
                            suffixIcon: Icon(Icons.email, color: Color(0xffAD51D3)),
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            controller: passwordController,
                            labelText: 'Create password',
                            obscureText: true,
                            suffixIcon: Icon(Icons.check, color: Color(0xffAD51D3)),
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            controller: confirmPwController,
                            labelText: 'Confirm Password',
                            obscureText: true,
                            suffixIcon: Icon(Icons.check, color: Color(0xffAD51D3)),
                          ),
                          SizedBox(height: 20),
                          MyButton(
                            onTap: signupuser,
                            text: 'Sign Up',
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
