import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/screens/DashboardScreens.dart';
import 'package:lifeshare/screens/InitialScreen.dart';
import 'package:lifeshare/screens/LoginScreen.dart';
import 'package:lifeshare/screens/SignupScreen.dart';
import 'package:lifeshare/style/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFCBC04, getSwatch(kPrimaryColor)),
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        fontFamily: "Poppins",
      ),
      home: DashboardScreen(),
    );
  }
}
