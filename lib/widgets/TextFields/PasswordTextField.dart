import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifeshare/utils/validators.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController _controller;
  final String labelText;
  const PasswordTextField(this._controller, {this.labelText = "Password"});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordhide = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: _isPasswordhide,
        style: const TextStyle(
          fontSize: 18,
        ),
        controller: widget._controller,
        validator: validatePassword,
        textInputAction: TextInputAction.done,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(),
          labelStyle: const TextStyle(
            fontSize: 16,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isPasswordhide = !_isPasswordhide;
              });
            },
            icon: FaIcon(
              _isPasswordhide
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
