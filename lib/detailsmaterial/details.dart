
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Price extends StatefulWidget {
  const Price({
    super.key,
    required this.price,
    required this.myicon,
  });
  final String price;

  final Widget myicon;
  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 35,
          width: 65,
          decoration: const BoxDecoration(
              color: Color(0xFFE7AE74),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              )),
          child: Center(
              child: Text(widget.price,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 19, fontWeight: FontWeight.bold))),
        ),
        widget.myicon,
      ],
    );
  }
}

class Con extends StatefulWidget {
  const Con({
    super.key,
    required this.mywidget,
    required this.linkfun
  });
  final Widget mywidget;
  final Function linkfun;

  @override
  State<Con> createState() => _ConState();
}

class _ConState extends State<Con> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       widget.linkfun();
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 25, 27, 33),
          ),
          child: widget.mywidget,
        ),
      ),
    );
  }
}
