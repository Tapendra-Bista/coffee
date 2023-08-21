import 'package:app/home/homepage.dart';
import 'package:app/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../favourite/favbotton.dart';
import '../materials/materials.dart';

class Screen extends StatefulWidget {
  const Screen({super.key, });

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Widget> screenitem = [
    const Homepage(),
    const Homepage(),
    const Profile(),
  ];
  int myindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222326),
      bottomNavigationBar: GNav(
          gap: 5,
          selectedIndex: myindex,
          onTabChange: (value) {
            setState(() {
              myindex = value;
            });
          },
          backgroundColor: const Color.fromARGB(255, 25, 27, 33),
          tabs: [
            GButton(
              icon: CupertinoIcons.home,
              iconSize: 30,
              iconColor: Colors.white70,
              iconActiveColor: navbottonclr,
              text: "Home",
              textStyle: GoogleFonts.aBeeZee(
                color: navbottonclr,
                fontSize: 20,
              ),
            ),
            GButton(
              onPressed: () {
                setState(() {
                  favitem(context);
                });
              },
              icon: Icons.favorite,
              iconSize: 35,
              text: "Favourite",
              iconColor: Colors.white70,
              iconActiveColor: Colors.red,
              textStyle: GoogleFonts.aBeeZee(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            GButton(
              icon: CupertinoIcons.profile_circled,
              iconSize: 35,
              iconColor: Colors.white70,
              text: "Profile",
              iconActiveColor: navbottonclr,
              textStyle: GoogleFonts.aBeeZee(
                color: navbottonclr,
                fontSize: 20,
              ),
            ),
          ]),
      body: screenitem[myindex],
    );
  }
}
