import 'dart:convert';
import 'dart:io';
import 'package:app/login/controller.dart';
import 'package:app/materials/materials.dart';
import 'package:app/profile/modellink.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../signup/urltoconnect.dart';
import 'model.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  File? pickedImage;
  List<Server> server = [];
  Future<List<Server>> getlink() async {
    var response = await http.get(
      Uri.parse(linkurl),
      headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        server.add(Server.fromJson(index));
      }
      return server;
    } else {
      return server;
    }
  }

  List<Model> model = [];

  Future<List<Model>> functiontoget() async {
    var response = await http.get(
      Uri.parse(profile),
      headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        model.add(Model.fromJson(index));
      }
      return model;
    } else {
      return model;
    }
  }



  TextEditingController namecontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController phonecontrol = TextEditingController();
  TextEditingController agecontrol = TextEditingController();
  TextEditingController controlllink2 = TextEditingController();
  TextEditingController controlllink3 = TextEditingController();
  TextEditingController controlllink4 = TextEditingController();
  Future patchlink(var body) async {
    if (controlllink2.text.isNotEmpty ||
        controlllink3.text.isNotEmpty ||
        controlllink4.text.isNotEmpty) {
      await http.patch(
        Uri.parse(linkurl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
    }
  }

  Future putdata() async {
    if (namecontrol.text.isNotEmpty &&
        emailcontrol.text.isNotEmpty &&
        phonecontrol.text.isNotEmpty &&
        agecontrol.text.isNotEmpty) {
      var body = {
        "name": namecontrol.text,
        "email": emailcontrol.text,
        "phone": phonecontrol.text,
        "age": agecontrol.text,
      };
      await http.put(
        Uri.parse(profile),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: functiontoget(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                backgroundColor: background,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniEndTop,
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(top: 88, right: 40),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor: background,
                                  title: Text(
                                    "Your Details",
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 20,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  titlePadding: const EdgeInsets.only(left: 95),
                                  actions: [
                                    TextField(
                                      controller: namecontrol,
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        filled: true,
                                        fillColor: textfieldclr,
                                        prefixIcon: const Icon(
                                          CupertinoIcons.person_circle,
                                          color: Colors.white70,
                                        ),
                                        hintText: "Name",
                                        hintStyle: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: emailcontrol,
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        filled: true,
                                        fillColor: textfieldclr,
                                        prefixIcon: const Icon(
                                          Icons.email_outlined,
                                          color: Colors.white70,
                                        ),
                                        hintText: "Email",
                                        hintStyle: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: phonecontrol,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        filled: true,
                                        fillColor: textfieldclr,
                                        prefixIcon: const Icon(
                                          Icons.phone,
                                          color: Colors.white70,
                                        ),
                                        hintText: "Phone",
                                        hintStyle: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      controller: agecontrol,
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        filled: true,
                                        fillColor: textfieldclr,
                                        prefixIcon: const Icon(
                                          Icons.calculate_outlined,
                                          color: Colors.white70,
                                        ),
                                        hintText: "Age",
                                        hintStyle: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                putdata();
                                                namecontrol.clear();
                                                emailcontrol.clear();
                                                phonecontrol.clear();
                                                agecontrol.clear();
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text(
                                              "Submit",
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: 20,
                                                color: Colors.white70,
                                              ),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                namecontrol.clear();
                                                emailcontrol.clear();
                                                phonecontrol.clear();
                                                agecontrol.clear();
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text("Exit",
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: 20,
                                                  color: Colors.white70,
                                                )))
                                      ],
                                    )
                                  ],
                                ));
                      });
                    },
                    backgroundColor: background,
                    child: const Icon(Icons.edit),
                  ),
                ),
                body: SingleChildScrollView(
                  child: SafeArea(
                      child: Column(children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 70, left: 0, right: 255),
                        child: CircleAvatar(
                          backgroundImage: pickedImage != null
                              ? FileImage(pickedImage!) as ImageProvider
                              : const AssetImage("image/my.jpg"),
                          radius: 51,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 66, left: 68),
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50),
                                        topLeft: Radius.circular(50),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) => Container(
                                          height: 200,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(50),
                                              topLeft: Radius.circular(50),
                                            ),
                                            color: Color(0xFF222326),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 55),
                                            child: Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            pickImage(
                                                                ImageSource
                                                                    .camera);
                                                           
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          CupertinoIcons.camera,
                                                          color: Colors.white70,
                                                          size: 40,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                         
                                                         setState(() {
                                                           pickImage(ImageSource
                                                              .gallery);
                                                           
                                                         });
                                                        },
                                                        icon: const Icon(
                                                          CupertinoIcons
                                                              .photo_fill_on_rectangle_fill,
                                                          color: Colors.white70,
                                                          size: 40,
                                                        ),
                                                      ),
                                                    ]),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "Camera",
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .white70),
                                                    ),
                                                    Text(
                                                      "Gallery",
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .white70),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              icon: const Icon(CupertinoIcons.camera),
                            ),
                          ),
                        )),
                    Card(
                      borderOnForeground: true,
                      shadowColor: Colors.white70,
                      color: background,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 2, left: 10, right: 30),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) => RichText(
                                  text: TextSpan(
                                      text: "Name: ${model[index].name}",
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.white70, fontSize: 20),
                                      children: [
                                    TextSpan(
                                        text: "\nEmail: ${model[index].email}"),
                                    TextSpan(
                                        text: "\nPhone: ${model[index].phone}"),
                                    TextSpan(text: "\nAge: ${model[index].age}")
                                  ])),
                            ),
                          ),
                          const Card(
                            borderOnForeground: true,
                            shadowColor: Colors.white70,
                            color: Color(0xFF222326),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: getlink(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Card(
                                          borderOnForeground: true,
                                          shadowColor: Colors.white70,
                                          color: background,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.facebook_rounded,
                                              color: Colors.white70,
                                              size: 30,
                                            ),
                                            title: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  launchUrlString(
                                                      server[index].link2);
                                                });
                                              },
                                              onLongPress: () {
                                                setState(() {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                backgroundColor:
                                                                    background,
                                                                actions: [
                                                                  TextField(
                                                                      controller:
                                                                          controlllink2,
                                                                      onSubmitted:
                                                                          (value) {
                                                                        //https://telegram.org/
                                                                        setState(
                                                                            () {
                                                                          patchlink({
                                                                            "link2":
                                                                                controlllink2.text,
                                                                          });
                                                                        });
                                                                      },
                                                                      decoration:
                                                                          const InputDecoration(
                                                                        focusedBorder:
                                                                            InputBorder.none,
                                                                        filled:
                                                                            true,
                                                                        fillColor: Color.fromARGB(
                                                                            255,
                                                                            50,
                                                                            54,
                                                                            56),
                                                                        disabledBorder:
                                                                            InputBorder.none,
                                                                      )),
                                                                ],
                                                              ));
                                                });
                                              },
                                              child: Text(
                                                server[index].link2,
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          borderOnForeground: true,
                                          shadowColor: Colors.white70,
                                          color: background,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.snapchat_sharp,
                                              color: Colors.white70,
                                              size: 30,
                                            ),
                                            title: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  launchUrlString(
                                                      server[index].link3);
                                                });
                                              },
                                              onLongPress: () {
                                                setState(() {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                backgroundColor:
                                                                    background,
                                                                actions: [
                                                                  TextField(
                                                                      controller:
                                                                          controlllink3,
                                                                      onSubmitted:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          patchlink({
                                                                            "link3":
                                                                                controlllink3.text,
                                                                          });
                                                                        });
                                                                      },
                                                                      decoration:
                                                                          const InputDecoration(
                                                                        focusedBorder:
                                                                            InputBorder.none,
                                                                        filled:
                                                                            true,
                                                                        fillColor: Color.fromARGB(
                                                                            255,
                                                                            50,
                                                                            54,
                                                                            56),
                                                                        disabledBorder:
                                                                            InputBorder.none,
                                                                      )),
                                                                ],
                                                              ));
                                                });
                                              },
                                              child: Text(
                                                server[index].link3,
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          borderOnForeground: true,
                                          shadowColor: Colors.white70,
                                          color: background,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.telegram_rounded,
                                              color: Colors.white70,
                                              size: 30,
                                            ),
                                            title: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  launchUrlString(
                                                      server[index].link4);
                                                });
                                              },
                                              onLongPress: () {
                                                setState(() {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                backgroundColor:
                                                                    background,
                                                                actions: [
                                                                  TextField(
                                                                      controller:
                                                                          controlllink4,
                                                                      onSubmitted:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          patchlink({
                                                                            "link4":
                                                                                controlllink4.text,
                                                                          });
                                                                        });
                                                                      },
                                                                      decoration:
                                                                          const InputDecoration(
                                                                        focusedBorder:
                                                                            InputBorder.none,
                                                                        filled:
                                                                            true,
                                                                        fillColor: Color.fromARGB(
                                                                            255,
                                                                            50,
                                                                            54,
                                                                            56),
                                                                        disabledBorder:
                                                                            InputBorder.none,
                                                                      )),
                                                                ],
                                                              ));
                                                });
                                              },
                                              child: Text(
                                                server[index].link4,
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        )
                      ],
                    ),
                    Card(
                      borderOnForeground: true,
                      shadowColor: Colors.white70,
                      color: background,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 12),
                            child: RichText(
                              text: TextSpan(
                                text:
                                    "\nFlutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.Flutter code compiles to ARM or Intel machine code as well as JavaScript, for fast performance on any device.\n",
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white70, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ])),
                ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
