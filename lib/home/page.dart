import 'package:app/buy/buy_coffee.dart';
import 'package:app/coffe_details/coffe_details2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../coffe_details/coffe_details1.dart';
import '../coffe_details/coffe_details3.dart';
import '../coffe_details/coffe_details4.dart';
import '../detailsmaterial/details.dart';
import '../favourite/fav.dart';
import '../materials/materials.dart';

class Mypage extends StatefulWidget {
  const Mypage({
    super.key,
  });
  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  bool firstfav = false;
  bool secondfav = false;
  bool thirdfav = false;
  bool fourthfav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            Con(
              linkfun: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Coffed()));
              },
              mywidget: Column(
                children: [
                  Price(
                    price: "\$11",
                    myicon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (firstfav == false) {
                              firstfav = true;
                            } else if (firstfav == true) {
                              firstfav = false;
                            }
                          });
                          firstfav ? fav.add(image1) : fav.remove(image1);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: firstfav ? Colors.red : Colors.white70,
                          size: 35,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 41.5, right: 41.5, bottom: 0),
                    child: Image.asset(imgname1),
                  ),
                  Nameofcoffe(
                    name: "Black Coffee",
                    buylink: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buycoffe(
                                imagelink: imgname1,
                                coffeename: "Black Coffee",
                           coffeeprice:11,
                              )));
                    },
                  ),
                ],
              ),
            ),
            Con(
              linkfun: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Coffed2()));
              },
              mywidget: Column(
                children: [
                  Price(
                    price: "\$33",
                    myicon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (secondfav == false) {
                              secondfav = true;
                            } else {
                              secondfav = false;
                            }
                          });
                          secondfav ? fav.add(image2) : fav.remove(image2);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: secondfav ? Colors.red : Colors.white70,
                          size: 35,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35.5, right: 35.5, bottom: 0),
                    child: Image.asset(imgname2),
                  ),
                  Nameofcoffe(
                    name: "Cold Coffee",
                    buylink: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buycoffe(
                                imagelink: imgname2,
                                coffeename: "Cold Coffee",
                                coffeeprice: 33,
                              )));
                    },
                  ),
                ],
              ),
            ),
            Con(
              linkfun: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Coffed3()));
              },
              mywidget: Column(
                children: [
                  Price(
                    price: "\$44",
                    myicon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (thirdfav == false) {
                              thirdfav = true;
                            } else {
                              thirdfav = false;
                            }
                          });
                          thirdfav ? fav.add(image3) : fav.remove(image3);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: thirdfav ? Colors.red : Colors.white70,
                          size: 35,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 40.4, right: 40.4, bottom: 0),
                      child: Image.asset(imgname3)),
                  Nameofcoffe(
                    name: "Espresso Coffee",
                    buylink: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buycoffe(
                                imagelink: imgname3,
                                coffeename: "Espresso Coffee",
                                coffeeprice: 44,
                              )));
                    },
                  ),
                ],
              ),
            ),
            Con(
              linkfun: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Coffed4()),
                );
              },
              mywidget: Column(
                children: [
                  Price(
                    price: "\$77",
                    myicon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (fourthfav == false) {
                              fourthfav = true;
                            } else {
                              fourthfav = false;
                            }
                          });
                          fourthfav ? fav.add(image4) : fav.remove(image4);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: fourthfav ? Colors.red : Colors.white70,
                          size: 35,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 29, right: 29, bottom: 0),
                    child: Image.asset(imgname4),
                  ),
                  Nameofcoffe(
                    name: "Latte Coffee",
                    buylink: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buycoffe(
                                imagelink: imgname4,
                                coffeename: "Latte Coffee",
                                coffeeprice: 77,
                              )));
                    },
                  ),
                ],
              ),
            ),
            Con(
              linkfun: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Coffed()));
              },
              mywidget: Column(
                children: [
                  Price(
                    price: "\$11",
                    myicon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (firstfav == false) {
                              firstfav = true;
                            } else if (firstfav == true) {
                              firstfav = false;
                            }
                          });
                          firstfav ? fav.add(image1) : fav.remove(image1);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: firstfav ? Colors.red : Colors.white70,
                          size: 35,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 41.5, right: 41.5, bottom: 0),
                    child: Image.asset(imgname1),
                  ),
                  Nameofcoffe(
                    name: "Black Coffee",
                    buylink: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buycoffe(
                                imagelink: imgname1,
                                coffeename: "Black Coffee",
                                coffeeprice: 11,
                              )));
                    },
                  ),
                ],
              ),
            ),
            Con(
              linkfun: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Coffed2()));
              },
              mywidget: Column(
                children: [
                  Price(
                    price: "\$33",
                    myicon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (secondfav == false) {
                              secondfav = true;
                            } else {
                              secondfav = false;
                            }
                          });
                          secondfav ? fav.add(image2) : fav.remove(image2);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: secondfav ? Colors.red : Colors.white70,
                          size: 35,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35.5, right: 35.5, bottom: 0),
                    child: Image.asset(imgname2),
                  ),
                  Nameofcoffe(
                    name: "Cold Coffee",
                    buylink: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buycoffe(
                                imagelink: imgname2,
                                coffeename: "Cold Coffee",
                                coffeeprice: 33,
                              )));
                    },
                  ),
                ],
              ),
            ),
            Con(
              linkfun: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Coffed3()));
              },
              mywidget: Column(
                children: [
                  Price(
                    price: "\$44",
                    myicon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (thirdfav == false) {
                              thirdfav = true;
                            } else {
                              thirdfav = false;
                            }
                          });
                          thirdfav ? fav.add(image3) : fav.remove(image3);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: thirdfav ? Colors.red : Colors.white70,
                          size: 35,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 40.4, right: 40.4, bottom: 0),
                      child: Image.asset(imgname3)),
                  Nameofcoffe(
                    name: "Espresso Coffee",
                    buylink: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buycoffe(
                                imagelink: imgname3,
                                coffeename: "Espresso Coffee",
                                coffeeprice: 44,
                              )));
                    },
                  ),
                ],
              ),
            ),
            Con(
              linkfun: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Coffed4()));
              },
              mywidget: Column(
                children: [
                  Price(
                    price: "\$77",
                    myicon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (fourthfav == false) {
                              fourthfav = true;
                            } else {
                              fourthfav = false;
                            }
                          });
                          fourthfav ? fav.add(image4) : fav.remove(image4);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: fourthfav ? Colors.red : Colors.white70,
                          size: 35,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 29, right: 29, bottom: 0),
                    child: Image.asset(imgname4),
                  ),
                  Nameofcoffe(
                    name: "Latte Coffee",
                    buylink: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buycoffe(
                                imagelink: imgname4,
                                coffeename: "Latte Coffee",
                                coffeeprice: 77,
                              )));
                    },
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}

class Nameofcoffe extends StatelessWidget {
  const Nameofcoffe({
    super.key,
    required this.name,
    required this.buylink,
  });

  final String name;
  final Function buylink;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
          Container(
              height: 40,
              width: 65,
              decoration: const BoxDecoration(
                  color: Color(0xFFE7AE74),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                  )),
              child: TextButton(
                  onPressed: () {
                    buylink();
                  },
                  child: Center(
                      child: Text("Buy",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 18, color: Colors.black))))),
        ],
      ),
    );
  }
}
