import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/CustomSwitch.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/TextFields/EmailTextField.dart';
import 'package:lifeshare/widgets/TextFields/PasswordTextField.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _enable = false;
  String _userType = "Donor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Login Screen"),
      body: Container(
        color: nearlyWhite,
        child: Column(
          children: [
            SizedBox(height: spaceM * 3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingM),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingM,
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: spaceM + spaceS,
                      ),
                      EmailTextField(
                        controller: TextEditingController(),
                        validate: true,
                      ),
                      PasswordTextField(TextEditingController()),
                      CustomDropDown(
                        title: "Account Type",
                        data: ["Donor", "Reciever"],
                        selectedDropdownValue: _userType,
                        onChanged: (value) {
                          setState(() {
                            _userType = value;
                          });
                        },
                      ),
                      CustomButton(
                        title: 'LOGIN',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: spaceM + spaceS,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
