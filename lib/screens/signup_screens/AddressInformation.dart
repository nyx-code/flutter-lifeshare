import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/TextFields/PinCodeField.dart';

class AddressInformation extends StatefulWidget {
  @override
  _AddressInformationState createState() => _AddressInformationState();
}

class _AddressInformationState extends State<AddressInformation> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Address Information",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: spaceM),
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: spaceS,
              ),
              DefaultTextField(
                controller: TextEditingController(),
                labelTextStrr: "Area / Local",
              ),
              DefaultTextField(
                controller: TextEditingController(),
                labelTextStrr: "City",
              ),
              DefaultTextField(
                controller: TextEditingController(),
                labelTextStrr: "State",
              ),
              PinCodeField(
                controller: TextEditingController(),
                labelStr: "Pincode",
              ),
              CustomButton(
                title: 'NEXT',
                onPressed: () {},
              ),
              SizedBox(
                height: spaceS,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
