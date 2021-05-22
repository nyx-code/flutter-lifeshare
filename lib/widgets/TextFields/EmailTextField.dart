import 'package:flutter/material.dart';
import 'package:lifeshare/utils/validators.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool validate;
  const EmailTextField(
      {@required this.controller,
      this.labelText = "Email ID",
      this.validate = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: validate ? validateEmail : null,
        style: TextStyle(fontSize: 18),
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 16,
            )),
      ),
    );
  }
}
