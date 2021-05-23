import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/screens/signup/signup_screen/GeneralInformation.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Signup Screen"),
      body: Container(
        color: nearlyWhite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: spaceM * 3),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingM),
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingL,
                      vertical: paddingL,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: GeneralInformation()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
