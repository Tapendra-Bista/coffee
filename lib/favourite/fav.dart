import 'package:app/coffe_details/coffe_details3.dart';
import 'package:app/coffe_details/coffe_details4.dart';
import 'package:app/materials/materials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../coffe_details/coffe_details1.dart';
import '../coffe_details/coffe_details2.dart';

List<Widget> fav = [];
var image1 = Mycard(
  tapfun: (context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Coffed()));
  },
  price: "\$11",
  namec: name1,
  strimg:imgname1,
);

var image2 = Mycard(
  tapfun: (context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Coffed2()));
  },
  price: "\$33",
  namec: name2,
  strimg: imgname2,
);
var image3 = Mycard(
  tapfun: (context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Coffed3()));
  },
  price: "\$44",
  namec:name3,
  strimg: imgname4,
);

var image4 = Mycard(
  tapfun: (context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Coffed4()));
  },
  price: "\$77",
  namec: name4,
  strimg: imgname4,
);

class Mycard extends StatefulWidget {
  const Mycard({
    super.key,
    required this.price,
    required this.namec,
    required this.strimg,
    required this.tapfun,
  });
  final String price;
  final String namec;
  final String strimg;
  final Function tapfun;
  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: InkWell(
        onTap: () {
          widget.tapfun(context);
        },
        child: Card(
          child: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF222326).withOpacity(1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(widget.strimg),
                    Text(
                      widget.namec,
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white70, fontSize: 25),
                    ),
                    Text(
                      widget.price,
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white70, fontSize: 25),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
