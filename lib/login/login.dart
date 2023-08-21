import 'dart:convert';
import 'package:app/home_screen/screen.dart';
import 'package:app/login/controller.dart';
import 'package:app/login/main2.dart';
import 'package:app/materials/materials.dart';
import 'package:app/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? items;
  TextEditingController emailforforget = TextEditingController();
  Future forget() async {
    if (emailforforget.text.isNotEmpty) {
      var emailbody = {"email": emailforforget.text};

      try {
        var getdata = await http.post(
          Uri.parse(forgeturl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(emailbody),
        );

        var responsefromjs = jsonEncode(getdata.body);
        items = responsefromjs;
      } catch (error) {
        // ignore: avoid_print
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: background,
        bottomOpacity: 0,
        elevation: 0,
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
            const Emailforlogin(),
            const Passwordforlogin(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 55,
                  ),
                  child: InkWell(
                    onTap: () {
                  
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                topLeft: Radius.circular(50),
                              ),
                            ),
                            backgroundColor: background,
                            context: context,
                            builder: (context) => FractionallySizedBox(
                                  heightFactor: 0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 50, horizontal: 50),
                                        child: TextField(
                                          controller: emailforforget,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.email_outlined,
                                              color: Colors.black87,
                                            ),
                                            hintText: "Enter Email",
                                            hintStyle: GoogleFonts.aBeeZee(
                                                color: Colors.black87,
                                                fontSize: 18),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                            fillColor: signinfillclr,
                                            filled: true,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: Text("Cancel",
                                                  style: GoogleFonts.aBeeZee(
                                                      fontSize: 22))),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  forget();
                                                });
                                              },
                                              child: Text(
                                                "Submit",
                                                style: GoogleFonts.aBeeZee(
                                                    fontSize: 22),
                                              )),
                                        ],
                                      ),
                                      Text(
                                        items ?? "",
                                        style: GoogleFonts.aBeeZee(
                                            color: Colors.white70,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ));
                   
                    },
                    child: Text("Forget Password",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.blue,
                            fontSize: 16,
                            decoration: TextDecoration.underline)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            const Signinbotton(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not Registered?",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white70, fontSize: 18),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          passwordforlogin.clear();
                          emailforlogin.clear();
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      },
                      child: Text("Sign Up",
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

class Signinbotton extends StatefulWidget {
  const Signinbotton({
    super.key,
  });

  @override
  State<Signinbotton> createState() => _SigninbottonState();
}

class _SigninbottonState extends State<Signinbotton> {
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    initSharedpref();
  }

  void initSharedpref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future logindata(context) async {
    if (passwordforlogin.text.isNotEmpty && emailforlogin.text.isNotEmpty) {
      var logindatabody = {
        "email": emailforlogin.text,
        "password": passwordforlogin.text,
      };

      try {
        var response = await http.post(
          Uri.parse(loginuri),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(logindatabody),
        );
        var jsresponse = jsonDecode(response.body);
        if (response.statusCode ==200) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Screen()));
          passwordforlogin.clear();
          emailforlogin.clear();
          var mytoken = jsresponse['token'];
          
          prefs.setString('token', mytoken);
        }
        if (response.statusCode == 406) {
          return wrongpassword = true;
        } else {
          return wrongpassword = false;
        }
      } catch (errr) {
        //
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
            logindata(context);
          });
        },
        child: Center(
          child: Text(
            "Sign In",
            style: GoogleFonts.aBeeZee(color: Colors.black87, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
