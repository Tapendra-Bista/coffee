import 'dart:convert';
import 'package:app/login/login.dart';
import 'package:app/materials/materials.dart';
import 'package:app/signup/urltoconnect.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../policy/policy.dart';
import 'main1.dart';
import 'package:http/http.dart' as http;

bool checkbox = false;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        bottomOpacity: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("image/bean.png"),
                    height: 59,
                    width: 59,
                  ),
                  Image(
                    image: AssetImage("image/tb.png"),
                    height: 250,
                    width: 250,
                  ),
                  Image(
                    image: AssetImage("image/bean.png"),
                    height: 59,
                    width: 59,
                  ),
                ],
              ),
            ),
            const Username(),
            const Email(),
            const Password(),
            const Confirm(),
            const Checkbox(),
            const Signupbotton(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Registered?",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white70, fontSize: 18),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          emailcontroller.clear();
                          usernamecontroller.clear();
                             confirmpwrdcontroller.clear();
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Loginpage()));
                      },
                      child: Text("Sign In",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.blue,
                              fontSize: 18,
                              decoration: TextDecoration.underline)))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class Signupbotton extends StatefulWidget {
  const Signupbotton({
    super.key,
  });

  @override
  State<Signupbotton> createState() => _SignupbottonState();
}

class _SignupbottonState extends State<Signupbotton> {
  Future getdata(context) async {
    if (usernamecontroller.text.isNotEmpty &&
        emailcontroller.text.isNotEmpty &&
        confirmpwrdcontroller.text.isNotEmpty) {
      var regbody = {
        "username": usernamecontroller.text,
        "email": emailcontroller.text,
        "password": confirmpwrdcontroller.text,
      };

      try {
        var response = await http.post(
          Uri.parse(finaluri),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regbody),
        );

        if (response.statusCode == 201) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Loginpage()));
          usernamecontroller.clear();
          emailcontroller.clear();
          confirmpwrdcontroller.clear();
        }
      } catch (error) {
        //no catch
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orange,
      ),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            if (checkbox == true &&
                confirmbool == false &&
                emailerror == false &&
                errorshowforuser == false) {
              getdata(context);
            }
          });
        },
        child: Center(
          child: Text(
            "Sign Up",
            style: GoogleFonts.aBeeZee(color: Colors.black87, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class Checkbox extends StatefulWidget {
  const Checkbox({super.key});

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (checkbox == false) {
                checkbox = true;
              } else {
                checkbox = false;
              }
            });
          },
          child: Icon(
            checkbox
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_outlined,
            color: Colors.white70,
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Policy()));
        },
        child: RichText(
            text: TextSpan(
                text: "I have read and agree to the ",
                style:
                    GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 9.2),
                children: [
              TextSpan(
                  text: "Terms and Conditions and Cookie Policy",
                  style: GoogleFonts.aBeeZee(
                      color: Colors.blue,
                      fontSize: 9.2,
                      decoration: TextDecoration.underline))
            ])),
      ),
    );
  }
}
