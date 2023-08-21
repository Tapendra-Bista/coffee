import 'package:app/materials/materials.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

bool value = false;

class Notificationturnon extends StatefulWidget {
  const Notificationturnon({super.key});

  @override
  State<Notificationturnon> createState() => _NotificationturnonState();
}

class _NotificationturnonState extends State<Notificationturnon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 18),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (value == false) {
                    value = true;
                  } else {
                    value = false;
                  }
                });
              },
              child: Text(
                value ? "Off" : "Reset",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  color: const Color(0xFF6753D7),
                ),
              ),
            ),
          )
        ],
        backgroundColor: background,
        bottomOpacity: 0,
        elevation: 0,
        title: Text(
          "Notification",
          style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 24),
        ),
      ),
      body: const SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 36,
          ),
          Notiitems(
            title: "Allow Notification",
          ),
          SizedBox(
            height: 5,
          ),
          Notiitems(
            title: "Discount Notifications",
          ),
          SizedBox(
            height: 5,
          ),
          Notiitems(
            title: "Stores Notifications",
          ),
          SizedBox(
            height: 5,
          ),
          Notiitems(
            title: "System Notifications",
          ),
          SizedBox(
            height: 5,
          ),
          Notiitems(
            title: "Location Notifications",
          ),
          SizedBox(
            height: 5,
          ),
          Notiitems(
            title: "Payment Notifications",
          ),
        ],
      )),
    );
  }
}

class Notiitems extends StatelessWidget {
  const Notiitems({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: background,
      shadowColor: Colors.white70,
      child: ListTile(
          title: Text(
            title,
            style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 22),
          ),
          trailing: SizedBox(
            height: 30,
            width: 80,
            child: FittedBox(
              fit: BoxFit.fill,
              child: LiteRollingSwitch(
                value: value,
                colorOn: const Color(0xFF6753D7),
                onTap: () {},
                iconOn: (Icons.notifications_rounded),
                iconOff: (Icons.notifications_off_rounded),
                colorOff: Colors.red,
                onDoubleTap: () {},
                onSwipe: () {},
                onChanged: (bool position) {},
              ),
            ),
          )),
    );
  }
}
