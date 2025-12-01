// splash screen is a logo screen which is display 2 or 3 seconds before appearing
//the sign-in-login page ok

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/Login/loginscreen.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

void initState(){
  super.initState();
  Timer(Duration(seconds : 4),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgurl: "instagram.png"),
            SizedBox(height: 10),
            Uihelper.CustomImage(imgurl: "logo.png"),
          ],
        ),
      ),
    );
  }
}
