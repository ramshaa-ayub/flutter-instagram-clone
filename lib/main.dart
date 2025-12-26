import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_insta_clone/Screens/Home/homescreen.dart';
import 'package:flutter_insta_clone/Screens/Login/loginscreen.dart';
// import 'package:flutter_insta_clone/Screens/SignUp/signUpscreen.dart';
// import 'package:flutter_insta_clone/Screens/Splash/splashscreen.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.dark(),
      // darkTheme: ThemeData.dark(),
      // home: SplashScreen(),
      home: LoginScreen(),
      // home:SignUpScreen()
      // home: HomeScreen(),
    );
  }
}
