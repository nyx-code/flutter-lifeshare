import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/screens/signup/signup_screen/AccountType.dart';
import 'package:lifeshare/screens/signup/signup_screen/GeneralInformation.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Signup Screen"),
      body: Container(
        color: nearlyWhite,
        child: Column(
          children: [
            SizedBox(height: spaceM * 3),
            Expanded(child: AccountType())
          ],
        ),
      ),
    );
  }
}
