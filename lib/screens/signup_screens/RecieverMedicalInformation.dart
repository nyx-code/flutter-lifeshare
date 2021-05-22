import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';

class RecieverMedicalInformation extends StatefulWidget {
  @override
  _RecieverMedicalInformationState createState() =>
      _RecieverMedicalInformationState();
}

class _RecieverMedicalInformationState
    extends State<RecieverMedicalInformation> {
  final _formKey = GlobalKey<FormState>();
  String _bloodType = "A";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Medical Information",
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
              CustomDropDown(
                title: "Blood Type",
                data: ["A", "B", "AB", "O"],
                selectedDropdownValue: _bloodType,
                onChanged: (value) {
                  setState(() {
                    _bloodType = value;
                  });
                },
              ),
              CustomButton(
                title: 'CREATE ACCOUNT',
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
