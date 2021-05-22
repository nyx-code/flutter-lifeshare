import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelTextStrr;
  final String hintText;
  final int maxLine;
  final Function validator;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType type;
  final bool isValidate;
  final bool enabled;
  final String helperText;
  const DefaultTextField(
      {@required this.controller,
      this.labelTextStrr,
      this.hintText,
      this.maxLine = 1,
      this.type = TextInputType.text,
      this.enabled = true,
      this.validator,
      this.inputFormatters,
      this.helperText,
      this.isValidate = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: type,
        controller: controller,
        enabled: enabled,
        maxLines: maxLine,
        textInputAction: TextInputAction.newline,
        validator: isValidate
            ? validator != null
                ? validator
                : (text) {
                    if (text.isEmpty) {
                      return "Please enter a valid ${labelTextStrr ?? hintText}";
                    }
                    return null;
                  }
            : null,
        inputFormatters: inputFormatters,
        style: TextStyle(
          fontSize: 18,
        ),
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              fontSize: 16,
            ),
            labelText: labelTextStrr,
            hintStyle: TextStyle(fontSize: 16),
            helperStyle: TextStyle(fontSize: 14, color: Colors.black),
            helperText: helperText,
            hintText: hintText),
      ),
    );
  }
}
