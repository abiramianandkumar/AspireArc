import 'package:aspire_arc/pages/home_page.dart';
import 'package:aspire_arc/pages/jobs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffF4ECF7),
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
                  child: Text(
            'AspireArc',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 3.0),
          ))),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xffAD51D3),
            ),
            title: Text(
              'Home',
              style: GoogleFonts.poppins(letterSpacing: 1.5),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xffAD51D3),
            ),
            title: Text(
              'Job Recommendation',
              style: GoogleFonts.poppins(letterSpacing: 1.5),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Job()));
            },
          ),
        ],
      ),
    );
  }
}
