import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';

class PinCodeField extends StatelessWidget {
  final TextEditingController controller;
  final String labelStr;
  const PinCodeField({
    @required this.controller,
    this.labelStr = "Postcode/Zip",
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      controller: controller,
      labelTextStrr: labelStr,
      isValidate: false,
      inputFormatters: [
        LengthLimitingTextInputFormatter(6),
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
