import 'package:app/favourite/fav.dart';

import 'package:flutter/material.dart';

Future<dynamic> favitem(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: const Color(0xFF222326),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40))),
    context: context,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.8,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            margin: const EdgeInsets.all(0),
            height: 1200,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                border:
                    Border(top: BorderSide(width: 0.1, color: Colors.white70))),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: fav,
              ),
            ),
          ),
        ),
      );
    },
  );
}
