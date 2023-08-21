import 'package:app/materials/materials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool sizem = true;
bool sizel = false;
bool sizexl = false;
num pricesize = 1;

class Buycoffe extends StatefulWidget {
  const Buycoffe({
    super.key,
    required this.coffeename,
    required this.imagelink,
    required this.coffeeprice,
  });
  final String imagelink;
  final num coffeeprice;
  final String coffeename;
  @override
  State<Buycoffe> createState() => _BuycoffeState();
}

class _BuycoffeState extends State<Buycoffe> {
  List<String> payitem = [
    "e-Sewa",
    "M-Banking",
  ];
  String choose = "e-Sewa";
  bool payfrom = true;
  num number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: Text(widget.coffeename),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: background,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Image(image: AssetImage(widget.imagelink)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              height: 60,
              width: 360,
              decoration: BoxDecoration(
                  color: navbottonclr, borderRadius: BorderRadius.circular(9)),
              child: Padding(
                padding: const EdgeInsets.only(top: 18, left: 30),
                child: RichText(
                    text: TextSpan(
                  text: "Num_Of_Coffee : $number",
                  style:
                      GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 18),
                  children: [
                    TextSpan(
                      text:
                          "\t\t\t\t\t\t\tPrice : \$${number * widget.coffeeprice *pricesize}",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white70, fontSize: 18),
                    )
                  ],
                )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: sizem ? navbottonclr : null,
                onPressed: () {
                  setState(() {
                    if (sizem == false) {
                      pricesize = 1;
                      sizem = true;
                      sizel = false;
                      sizexl = false;
                    } else {
                      sizem = false;
                    }
                  });
                },
                child: Text(
                  "M",
                  style:
                      GoogleFonts.aBeeZee(fontSize: 45, color: Colors.white70),
                ),
              ),
              MaterialButton(
                color: sizel ? navbottonclr : null,
                onPressed: () {
                  setState(() {
                    if (sizel == false) {
                         pricesize = 2;
                      sizel = true;
                      sizem = false;
                      sizexl = false;
                    } else {
                      sizel = false;
                    }
                  });
                },
                child: Text(
                  "L",
                  style:
                      GoogleFonts.aBeeZee(fontSize: 45, color: Colors.white70),
                ),
              ),
              MaterialButton(
                color: sizexl ? navbottonclr : null,
                onPressed: () {
                  setState(() {
                    if (sizexl == false) {
                         pricesize = 3;
                      sizexl = true;
                      sizel = false;
                      sizem = false;
                    } else {
                      sizexl = false;
                    }
                  });
                },
                child: Text(
                  "XL",
                  style:
                      GoogleFonts.aBeeZee(fontSize: 45, color: Colors.white70),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 15, top: 25),
            child: Column(
              children: [
                Text(
                  "We accept eSewa and mobile banking as a payment methods",
                  style:
                      GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white70),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RawMaterialButton(
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(
                      width: 65,
                      height: 65,
                    ),
                    fillColor: navbottonclr,
                    onPressed: () {
                      setState(() {
                        number--;
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.minus,
                      size: 28,
                      color: Colors.white70,
                    )),
                RawMaterialButton(
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(
                      width: 65,
                      height: 65,
                    ),
                    fillColor: navbottonclr,
                    onPressed: () {
                      setState(() {
                        number++;
                      });
                    },
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.white70,
                      size: 28,
                    )),
                Container(
                  height: 60,
                  width: 205,
                  decoration: BoxDecoration(
                      color: navbottonclr,
                      borderRadius: BorderRadius.circular(9)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Pay With:",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.white70, fontSize: 18),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 118,
                        decoration: BoxDecoration(
                            color: buttonclr,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(9),
                              bottomRight: Radius.circular(9),
                            )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: background,
                            value: choose,
                            items: payitem
                                .map<DropdownMenuItem<String>>(
                                    (String myvalue) =>
                                        DropdownMenuItem<String>(
                                          value: myvalue,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              myvalue,
                                              style: GoogleFonts.aBeeZee(
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ),
                                        ))
                                .toList(),
                            onChanged: (mydropstring) {
                              setState(() {
                                choose = mydropstring ?? "";
                                if (choose.compareTo("e-Sewa") == 0) {
                                  payfrom = true;
                                } else if (choose.compareTo("M-Banking") == 0) {
                                  payfrom = false;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.orange, borderRadius: BorderRadius.circular(9)),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        context: context,
                        builder: (context) => Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF212325),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: payfrom
                                ? const Bottonsheetcontainer(
                                    walletname: "e-Sewa Wallet",
                                    walletinfo:
                                        "\nName:Tapendra Bista\nPhone:9804633911",
                                  )
                                : const Bottonsheetcontainer(
                                    walletname: "Mobile Banking",
                                    walletinfo:
                                        "Acc:54695392539539\nName:Tapendra Bista\nPhone:9804633911",
                                  )));
                  });
                },
                child: Center(
                    child: Text(
                  "Pay Now",
                  style:
                      GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 18),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Bottonsheetcontainer extends StatelessWidget {
  const Bottonsheetcontainer({
    super.key,
    required this.walletname,
    required this.walletinfo,
  });
  final String walletname;
  final String walletinfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            walletname,
            style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: 350,
            width: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: background,
            ),
            child: Paynow(
              mydetails: walletinfo,
            ),
          ),
        )
      ],
    );
  }
}

class Paynow extends StatelessWidget {
  const Paynow({
    super.key,
    required this.mydetails,
  });
  final String mydetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 17),
            child: Container(
              height: 255,
              width: 255,
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  image: DecorationImage(
                    image: AssetImage("image/qrk.png"),
                    fit: BoxFit.contain,
                  )),
            )),
        Text(
          mydetails,
          style: GoogleFonts.aBeeZee(color: Colors.white70, fontSize: 20),
        )
      ],
    );
  }
}
