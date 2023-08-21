import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../materials/materials.dart';
import 'forgetpass.dart';

class Showpass extends StatelessWidget {
  const Showpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
      
        bottomOpacity: 0,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Password is : $passwordx",
              style: GoogleFonts.aBeeZee(color: Colors.white70,fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
