import 'package:app/materials/materials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Coffed2 extends StatefulWidget {
  const Coffed2({
    super.key,

  });



  @override
  State<Coffed2> createState() => _Coffed2State();
}

class _Coffed2State extends State<Coffed2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100, right: 40),
        child: FloatingActionButton(
          backgroundColor: background,
          onPressed: () {
            setState(() {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: background,
                        title: Center(
                          child: Text(
                            "Give Rate",
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white70, fontSize: 20),
                          ),
                        ),
                        actions: [
                          TextField(
                            controller: ratingcontrol2,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: textfieldclr,
                              border: InputBorder.none,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      rate2 = double.parse(ratingcontrol2.text);
                                        Navigator.pop(context);
                                      ratingcontrol2.clear();
                                    });
                                  },
                                  child: Text(
                                    "Submit",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white70, fontSize: 20),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                      ratingcontrol2.clear();
                                    });
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white70, fontSize: 20),
                                  )),
                            ],
                          ),
                        ],
                      ));
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                const Icon(Icons.star),
                Text(
                  rate2.toStringAsFixed(1),
                  style:
                      GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF212325),
      appBar: AppBar(
        backgroundColor: const Color(0xFF212325),
        bottomOpacity: 0,
        elevation: 0,
        title: Text(
         name2,
          style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Image(image: AssetImage(imgname2)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 10),
              child: RichText(
                  text: TextSpan(
                      text:cold[0],
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white70, fontSize: 21),
                      children: [TextSpan(text: cold[1])])),
            )
          ],
        ),
      ),
    );
  }
}

