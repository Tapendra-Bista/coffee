import 'dart:convert';

import 'package:app/forgetpass/show.dart';
import 'package:app/login/controller.dart';

import 'package:app/materials/materials.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

String passwordx = "";

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController emailforforget = TextEditingController();
  Future forget(context) async {
    if (emailforforget.text.isNotEmpty) {
      var emailbody = {"email": emailforforget.text};

      try {
        var getdata = await http.post(
          Uri.parse(forgeturl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(emailbody),
        );

        if (getdata.statusCode == 200) {
          var responsejs = jsonDecode(getdata.body.toString());

          passwordx = responsejs['password'];
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Showpass()));
          emailforforget.clear();
        }
      } catch (error) {
        // eror display here
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          bottomOpacity: 0,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: TextField(
                controller: emailforforget,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black87,
                  ),
                  hintText: "Enter Email",
                  hintStyle:
                      GoogleFonts.aBeeZee(color: Colors.black87, fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: signinfillclr,
                  filled: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text("Cancel",
                        style: GoogleFonts.aBeeZee(fontSize: 22))),
                TextButton(
                    onPressed: () {
                      setState(() {
                        forget(context);
                      });
                    },
                    child: Text(
                      "Submit",
                      style: GoogleFonts.aBeeZee(fontSize: 22),
                    )),
              ],
            ),
          ],
        ));
  }
}
