import 'package:app/materials/materials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: background,
        title: Text(
          "Our Services",
          style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 22),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left:20,right: 20,top:100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Coffee service refers to the many and various styles in which coffee is made available to people, such as in restaurants and hotels. In particular, it sometimes refers to the set of dishes and vessels utilized to serve and consume coffee, akin to the notion of a tea service.Coffee service is also a catch-all term for services related to the delivery of coffee to employees of a business at low or no cost to them. Providing coffee to employees is popular among employers since employees will likely not leave the workplace to purchase coffee, subsequently reducing lost work time. Employers also see coffee service as a perk with a low cost",  style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 22),),
          ],
        ),
      ),
    );
  }
}
