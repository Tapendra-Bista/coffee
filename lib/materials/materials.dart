import 'package:flutter/material.dart';

String imgname1 = "image/Black Coffee.png";
String imgname2 = "image/Cold Coffee.png";
String imgname3 = "image/Espresso.png";
String imgname4 = "image/Latte.png";
String name1 = "Black Coffee";
String name2 = "Cold Coffee";
String name3 = "Espresso Coffe";
String name4 = "Latte Coffe";
num rate1 = 1.1;
num rate2 = 2.2;
num rate3 = 3.3;
num rate4 = 4.4;
Color signinfillclr = const Color.fromARGB(255, 216, 194, 154);
Color navbottonclr = const Color(0xFFE7AE74);
TextEditingController ratingcontrol1 = TextEditingController();
TextEditingController ratingcontrol2 = TextEditingController();
TextEditingController ratingcontrol3 = TextEditingController();
TextEditingController ratingcontrol4 = TextEditingController();
Color background = const Color(0xFF212325);
Color textfieldclr = const Color.fromARGB(255, 50, 54, 56);
Color buttonclr = const Color.fromARGB(255, 25, 27, 33);

// details
List<String> black = [
  "Black coffee is simply coffee that is normally brewed without the addition of additives such as sugar, milk, cream, or added flavors.",
  "\n\nBlack coffee contains:\nFat – 0%\nCholesterol – 0%\nSodium – 0%\nCarbohydrates – 0%\nSugar – 0%\nPotassium – 4%"
];

List<String> cold = [
  "cold coffee is simply the best beverage to enjoy on a hot summer day. Even though I tend to be more of a tea drinker, I do love a good cup of coffee occasionally – and this cafe-style blended coffee drink is my favorite!",
  "\n\nCold coffee contains:\nFat – 0%\nCholesterol – 0%\nSodium – 0%\nCarbohydrates – 0%\nSugar – 1%\nPotassium – 4%"
];

List<String> esso = [
  "espresso coffee is Indian style one and very popular in Punjab. Made with instant coffee powder, sugar and milk this espresso coffee is so rich, creamy and frothy just like the cafe ones.",
  "\n\nEspresso coffee contains:\nFat – 0%\nCholesterol – 3%\nSodium – 0%\nCarbohydrates – 0%\nSugar – 1%\nPotassium – 4%"
];

List<String> latte = [
  "latte is a milk coffee that boasts a silky layer of foam as a real highlight to the drink. A true latte will be made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
  "\n\nLatte coffee contains:\nFat – 1%\nCholesterol – 3%\nSodium – 0%\nCarbohydrates – 0%\nSugar – 1%\nPotassium – 4%"
];
