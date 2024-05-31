import 'package:aspire_arc/pages/get_started.dart';
import 'package:aspire_arc/pages/login_page.dart';
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
<<<<<<< HEAD
  home: loginpage(),
=======
  home: GetStarted(),
  routes: {
    '/getstarted': (context) => GetStarted(),
    '/login':(context)=>loginpage(),
  },
>>>>>>> fca9083351e9fa8f4ecdf113f4b8267a7b255fdc
    );
  }
}