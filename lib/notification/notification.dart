import 'package:app/materials/materials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notificationapp extends StatefulWidget {
  const Notificationapp({super.key});

  @override
  State<Notificationapp> createState() => _NotificationappState();
}

class _NotificationappState extends State<Notificationapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        bottomOpacity: 0,
        elevation: 0,
        title: Text(
          "Notification",
          style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 24),
        ),
      ),
    );
  }
}