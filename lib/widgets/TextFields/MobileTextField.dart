import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeshare/utils/validators.dart';

class MobileTextField extends StatelessWidget {
  final TextEditingController _controller;
  final isEditable;
  final String labelTextStrr;
  const MobileTextField(this._controller,
      {this.labelTextStrr = 'Mobile Number', this.isEditable = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.phone,
        controller: _controller,
        enabled: isEditable,
        validator: validateMobileNumber,
        style: TextStyle(fontSize: 18, letterSpacing: .10),
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.digitsOnly
        ],
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixText: '+91 ',
          prefixStyle: TextStyle(
            fontSize: 18,
          ),
          labelStyle: TextStyle(
            fontSize: 16,
          ),
          labelText: labelTextStrr,
        ),
      ),
    );
  }
}
