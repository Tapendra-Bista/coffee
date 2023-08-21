import 'dart:convert';

import 'package:app/about_app/about.dart';
import 'package:app/home/page.dart';
import 'package:app/login/controller.dart';
import 'package:app/login/login.dart';
import 'package:app/materials/materials.dart';
import 'package:app/notification/notification.dart';
import 'package:app/policy/policy.dart';

import 'package:app/services/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../search/search.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController emailtodelete = TextEditingController();
  Future deletaccount(context) async {
    if (emailtodelete.text.isNotEmpty) {
      var useremail = {
        "email": emailtodelete.text,
      };

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };

      var response = await http.delete(Uri.parse(deleteurl),
          body: jsonEncode(useremail), headers: headers);
      if (response.statusCode == 200) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Loginpage()));
        Navigator.pop(context);
      }
    }
  }

  bool containersize = false;
  List<Widget> tab = [
    const Textmy(
      string: "Hot",
    ),
    const Textmy(
      string: "Cold",
    ),
    const Textmy(
      string: "Milk",
    ),
    const Textmy(string: "Black"),
    const Textmy(string: "Cute"),
  ];

  @override
  Widget build(BuildContext context) {
    var textField = Padding(
      padding: const EdgeInsets.only(top: 6),
      child: TextField(
        onChanged: (value) {
          setState(() {
            if (value.isNotEmpty) {
              display(value);
              containersize = true;
            } else {
              containersize = false;
              result.clear();
              noresultcase = true;
            }
          });
        },
        decoration: InputDecoration(
            hintText: "Find your coffee",
            hintStyle: GoogleFonts.aBeeZee(fontSize: 21),
            border: containersize ? null : InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              size: 33,
              color: Colors.white60,
            )),
      ),
    );
    return DefaultTabController(
      length: tab.length,
      child: Scaffold(
        appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          backgroundColor: background,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notificationapp()));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.sort_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 108,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()));

                
                },
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white70,
                ),
                title: Text(
                  'Sign Out',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.white70,
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: background,
                              title: const Center(child: Text("Are You Sure")),
                              titleTextStyle: GoogleFonts.aBeeZee(
                                  color: Colors.white70, fontSize: 20),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            emailtodelete.clear();
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Text(
                                          "NO",
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.blue, fontSize: 20),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            deletaccount(context);
                                          });
                                        },
                                        child: Text(
                                          "YES",
                                          style: GoogleFonts.aBeeZee(
                                              color: Colors.blue, fontSize: 20),
                                        )),
                                  ],
                                ),
                              ],
                              content: TextFormField(
                                  controller: emailtodelete,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.black87,
                                    ),
                                    hintText: "Enter Email",
                                    hintStyle: GoogleFonts.aBeeZee(
                                        color: Colors.black87, fontSize: 18),
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
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: signinfillclr,
                                  )),
                            ));
                  });
                },
                leading: const Icon(
                  CupertinoIcons.delete,
                  color: Colors.white70,
                ),
                title: Text(
                  'Delete Account',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.white70,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Services()));
                },
                leading: const Icon(
                  Icons.home_repair_service_sharp,
                  color: Colors.white70,
                ),
                title: Text(
                  'Our Services',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.white70,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Policy()));
                },
                leading: const Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.white70,
                ),
                title: Text(
                  'Policy And Privacy',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.white70,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const About()));
                },
                leading: const Icon(
                  CupertinoIcons.news,
                  color: Colors.white70,
                ),
                title: Text(
                  'About App',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Text(
              "It's a Great Day for Coffee",
              style: GoogleFonts.aBeeZee(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: containersize ? 200 : 60,
                width: 360,
                decoration: BoxDecoration(
                    color: textfieldclr,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    containersize ? textField : textField,
                    containersize
                        ? Column(
                            children: noresultcase ? noresult : result,
                          )
                        : const Row(),
                  ],
                )),
            const SizedBox(
              height: 45,
            ),
            TabBar(tabs: tab),
            const SizedBox(
              height: 26,
            ),
            const Expanded(
                child: TabBarView(
              children: [
                Mypage(),
                Mypage(),
                Mypage(),
                Mypage(),
                Mypage(),
              ],
            )),
            const SizedBox(
              height: 31,
            )
          ],
        )),
      ),
    );
  }
}

class Textmy extends StatelessWidget {
  const Textmy({super.key, required this.string});
  final String string;
  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: GoogleFonts.aBeeZee(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
