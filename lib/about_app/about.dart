import 'package:app/materials/materials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: background,
        title: Text(
          "About app",
          style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 22),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left:20,right: 20,top:100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("This is a practice purpose app not include any voilence. thanks",  style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 22),),
          ],
        ),
      ),
    );
  }
}
