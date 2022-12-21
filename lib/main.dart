import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(backgroundColor: Colors.blue, body: MyImages()),
  ));
}

class MyImages extends StatefulWidget {
  @override
  State<MyImages> createState() => _MyImagesState();
}

class _MyImagesState extends State<MyImages> {
  int lefImagesNumber = 1;
  int rightImagesNumber = 5;
  String res = "إضغط على احدى الصورتين";
  int point = 0;

  void changeImages() {
    lefImagesNumber = Random().nextInt(9) + 1;
    rightImagesNumber = Random().nextInt(9) + 1;
    res = "حاول مرة اخرى";
    if (lefImagesNumber == rightImagesNumber) {
      res = "مبرووووك لقد ربحت";
      point++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "$point",
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "almarai"),
        ),
        Text(
          "$res",
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "almarai"),
        ),
        Row(
          children: [
            Expanded(
                child: TextButton(
              child: Image.asset("images/image-$lefImagesNumber.png"),
              onPressed: () {
                setState(() {
                  changeImages();
                });
              },
            )),
            Expanded(
                child: TextButton(
              child: Image.asset("images/image-$rightImagesNumber.png"),
              onPressed: () {
                setState(() {
                  changeImages();
                });
              },
            )),
          ],
        )
      ],
    ));
  }
}
