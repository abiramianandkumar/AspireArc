import 'package:aspire_arc/components/bgimage.dart';
import 'package:aspire_arc/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aspire_arc/components/textfield.dart';

class SignUp extends StatefulWidget {
  final void Function()? onTap;

  const SignUp({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void signupuser() {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordController.text != confirmPwController.text) {
      Navigator.pop(context); // Close the loading dialog

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('The passwords you entered do not match. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close the error dialog
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      Navigator.pop(context); 
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Sign up successful!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
                Navigator.pushNamed(context, '/homepage'); 
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Already have an account? Sign In",
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
