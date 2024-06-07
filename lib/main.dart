import 'package:aspire_arc/auth/auth.dart';  
import 'package:aspire_arc/firebase_options.dart';
import 'package:aspire_arc/pages/forgot_password.dart';
import 'package:aspire_arc/pages/get_started.dart';
import 'package:aspire_arc/pages/home_page.dart';
import 'package:aspire_arc/pages/login_page.dart';
import 'package:aspire_arc/pages/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GetStarted(), 
      routes: {
        '/getstarted': (context) => const GetStarted(),  
        '/login': (context) => const LoginPage(),
        '/homepage': (context) => const HomePage(),
        '/signup': (context) => SignUp(onTap: () {
          Navigator.pushNamed(context, '/login');
        }),
        '/forgotpassword': (context) => const ForgotPassword(),
      },
    );
  }
}
