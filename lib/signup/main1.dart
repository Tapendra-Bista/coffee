import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../materials/materials.dart';
String emailstring = "Email doesn't include space or special characters";
String comparetoconfirm = "";
TextEditingController usernamecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController confirmpwrdcontroller = TextEditingController();
  bool confirmbool = false;
    bool emailerror = false;
      bool errorshowforuser = false;
class Confirm extends StatefulWidget {
  const Confirm({super.key});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  bool passwordhide2 = false;
  String conformtext = "Password didn't matched";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: TextField(
        controller: confirmpwrdcontroller,
        onChanged: (valueconform) {
          setState(() {
            if (valueconform.isNotEmpty) {
              confirmbool = true;
              if (valueconform.compareTo(comparetoconfirm) == 0) {
                confirmbool = false;
              }
            } else {
              confirmbool = false;
            }
          });
        },
        obscureText: passwordhide2 ? false : true,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            fillColor: signinfillclr,
            filled: true,
            errorText: confirmbool ? conformtext : null,
            errorStyle: GoogleFonts.aBeeZee(),
            border: InputBorder.none,
            hintText: "Confirm Password",
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 25, right: 10),
              child: Icon(
                CupertinoIcons.lock,
                color: Colors.black,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 22),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (passwordhide2 == false) {
                        passwordhide2 = true;
                      } else {
                        passwordhide2 = false;
                      }
                    });
                  },
                  child: Icon(
                    passwordhide2
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: Colors.black87,
                  )),
            ),
            hintStyle: GoogleFonts.aBeeZee(color: Colors.black87)),
      ),
    );
  }
}

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool passwordhide1 = false;
  bool passerrortext = false;
  String passwordstring = "At least one number,letter and special character";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: TextField(
        onChanged: (valuepassword) {
          setState(() {
            if (valuepassword.isNotEmpty) {
              passerrortext = true;
              comparetoconfirm = valuepassword;

              if ((valuepassword.contains("*") ||
                      valuepassword.contains("@") ||
                      valuepassword.contains("\$") ||
                      valuepassword.contains("%") ||
                      valuepassword.contains("&") ||
                      valuepassword.contains("^") ||
                      valuepassword.contains("?") ||
                      valuepassword.contains("#") ||
                      valuepassword.contains("-") ||
                      valuepassword.contains("+")) &&
                  (valuepassword.contains("1") ||
                      valuepassword.contains("2") ||
                      valuepassword.contains("3") ||
                      valuepassword.contains("4") ||
                      valuepassword.contains("5") ||
                      valuepassword.contains("6") ||
                      valuepassword.contains("7") ||
                      valuepassword.contains("8") ||
                      valuepassword.contains("9"))) {
                passerrortext = false;
              }
            } else {
              passerrortext = false;
            }
          });
        },
        obscureText: passwordhide1 ? false : true,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            fillColor: signinfillclr,
            filled: true,
            errorText: passerrortext ? passwordstring : null,
            errorStyle: GoogleFonts.aBeeZee(),
            border: InputBorder.none,
            hintText: "Enter Password",
            prefixIcon: const Padding(
              padding: EdgeInsets.only(right: 10, left: 25),
              child: Icon(
                CupertinoIcons.lock,
                color: Colors.black,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 22),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (passwordhide1 == false) {
                        passwordhide1 = true;
                      } else {
                        passwordhide1 = false;
                      }
                    });
                  },
                  child: Icon(
                    passwordhide1
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: Colors.black87,
                  )),
            ),
            hintStyle: GoogleFonts.aBeeZee(color: Colors.black87)),
      ),
    );
  }
}

class Email extends StatefulWidget {
  const Email({
    super.key,
  });

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {

  String emailstring = "Email doesn't include space or special characters";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: TextField(
          controller:  emailcontroller,
        onChanged: (value) {
        
        
          setState(() {
            if (value.isNotEmpty) {
              if (value.contains("*") ||
                  value.contains("\$") ||
                  value.contains("%") ||
                  value.contains("&") ||
                  value.contains("^") ||
                  value.contains("?") ||
                  value.contains("#") ||
                  value.contains("-") ||
                  value.contains("+") ||
                  value.contains(" ")) {
                emailerror = true;
              } else {
                emailerror = false;
              }
            }
          });
        },
        decoration: InputDecoration(
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            fillColor: signinfillclr,
            filled: true,
            errorStyle: GoogleFonts.aBeeZee(),
            errorText: emailerror ? emailstring : null,
            border: InputBorder.none,
            hintText: "Enter Email",
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 25, right: 10),
              child: Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
            ),
            hintStyle: GoogleFonts.aBeeZee(color: Colors.black87)),
      ),
    );
  }
}

class Username extends StatefulWidget {
  const Username({
    super.key,
  });

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  String stringusername = "Username doesn't include special characters";


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 3),
      child: TextField(
          controller:usernamecontroller,
        onChanged: (value) {
          setState(() {
            if (value.isNotEmpty) {
              if (value.contains("*") ||
                  value.contains("\$") ||
                  value.contains("%") ||
                  value.contains("&") ||
                  value.contains("^") ||
                  value.contains("?") ||
                  value.contains("#") ||
                  value.contains("-") ||
                  value.contains("+")) {
                errorshowforuser = true;
              } else {
                errorshowforuser = false;
              }
            }
          });
        },
        decoration: InputDecoration(
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            errorText: errorshowforuser ? stringusername : null,
            border: InputBorder.none,
            hintText: "Enter Username",
            errorStyle: GoogleFonts.aBeeZee(),
            fillColor: signinfillclr,
            filled: true,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 25, right: 10),
              child: Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
            ),
            hintStyle: GoogleFonts.aBeeZee(color: Colors.black87)),
      ),
    );
  }
}
