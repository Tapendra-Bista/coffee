import 'package:app/materials/materials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: background,
        title: Text(
          "Policy and Privacy",
          style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 22),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left:20,right: 20,top:100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("A privacy policy is a statement or legal document (in privacy law) that discloses some or all of the ways a party gathers, uses, discloses, and manages a customer or client's data. Personal information can be anything that can be used to identify an individual, not limited to the person's name, address, date of birth, marital status, contact information, ID issue, and expiry date, financial records, credit information, medical history, where one travels, and intentions to acquire goods and services",  style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 22),),
          ],
        ),
      ),
    );
  }
}
