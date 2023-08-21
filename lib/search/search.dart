import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../favourite/fav.dart';

bool noresultcase = true;
var image5 = Padding(
  padding: const EdgeInsets.only(top: 35),
  child: Text(
    "O No Result Not Found !",
    style: GoogleFonts.aBeeZee(fontSize: 28, color: Colors.white70),
  ),
);
List<Widget> result = [];
List<Widget> noresult = [image5];
void display(String? user) {
  if (user?.compareTo("black") == 0) {
    result.add(image1);
    noresultcase = false;
  } else if (user?.compareTo("cold") == 0) {
    result.add(image2);
    noresultcase = false;
  } else if (user?.compareTo("espresso") == 0) {
    result.add(image3);
    noresultcase = false;
  } else if (user?.compareTo("latte") == 0) {
    result.add(image4);
    noresultcase = false;
  } else {
    result.clear();
 noresultcase = true;
  }
}
