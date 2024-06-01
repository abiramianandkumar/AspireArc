import 'package:aspire_arc/pages/forgot_password.dart';
import 'package:aspire_arc/pages/get_started.dart';
import 'package:aspire_arc/pages/home_page.dart';
import 'package:aspire_arc/pages/login_page.dart';
import 'package:aspire_arc/pages/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 // home: HomePage(),
  home: loginPage(),
  routes: {
    '/getstarted': (context) => GetStarted(),
    '/login':(context) => loginPage(),
  },
    );
  }
}