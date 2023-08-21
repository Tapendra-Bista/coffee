
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/materials/materials.dart';
import 'package:google_fonts/google_fonts.dart';
TextEditingController passwordforlogin = TextEditingController();
TextEditingController emailforlogin = TextEditingController();
 bool wrongpassword = false;
 String wrongpasswordstring = "Wrong Password";
class Passwordforlogin extends StatefulWidget {
  const Passwordforlogin({super.key});

  @override
  State<Passwordforlogin> createState() => _PasswordforloginState();
}

class _PasswordforloginState extends State<Passwordforlogin> {
  bool passwordhidelogin = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: TextField(
        controller:passwordforlogin ,
     
       obscureText:passwordhidelogin?false:true,
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
        errorText:wrongpassword? wrongpasswordstring:null,
      
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
                      if (passwordhidelogin == false) {
                        passwordhidelogin = true;
                      } else {
                        passwordhidelogin = false;
                      }
                    });
                  },
                  child: Icon(
                    passwordhidelogin
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



class Emailforlogin extends StatefulWidget {
  const Emailforlogin({
    super.key,
  });

  @override
  State<Emailforlogin> createState() => _EmailforloginState();
}

class _EmailforloginState extends State<Emailforlogin> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: TextField(
            controller:emailforlogin ,
      
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
