// ignore_for_file: prefer_const_constructors

import 'package:aspire_arc/components/bgimage.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
   GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
        BackgroundImage(),
       ],
    );
  }
}
