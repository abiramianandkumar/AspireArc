// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:aspire_arc/pages/jobs.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aspire_arc/firebase_options.dart';
import 'package:aspire_arc/pages/forgot_password.dart';
import 'package:aspire_arc/pages/get_started.dart';
import 'package:aspire_arc/pages/home_page.dart';
import 'package:aspire_arc/pages/login_page.dart';
import 'package:aspire_arc/pages/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: '/getstarted', 
      routes: {
        '/getstarted': (context) => const GetStarted(),  
        '/login': (context) => const LoginPage(),
        '/homepage': (context) => const HomePage(),
        '/signup': (context) => const SignUp(),
        '/forgotpassword': (context) => const ForgotPassword(),
      },
      home: Job(),
    );
  }
}
