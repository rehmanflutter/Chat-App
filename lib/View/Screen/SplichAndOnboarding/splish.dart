import 'dart:async';
import 'package:chat/Controller/splichOnboardingcontroler.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplishScreens extends StatefulWidget {
  @override
  State<SplishScreens> createState() => _SplishScreenssState();
}

class _SplishScreenssState extends State<SplishScreens> {
  OnboardingSplich controler = OnboardingSplich();
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        controler.movetoscreens();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Textcustam(
            text: 'Chat App',
            size: 32,
            weight: FontWeight.w700,
            col: colorsss,
          ),
          Container(
            height: 290,
            width: 290,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/iconImages/chatgr.png'),
                    fit: BoxFit.cover)),
          ),
          SpinKitCircle(
            color: colorsss,
            size: 70.0,
          )
        ],
      ),
    );
  }
}
