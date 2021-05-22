import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/DonorReceiverButton.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/TextFields/EmailTextField.dart';
import 'package:lifeshare/widgets/TextFields/MobileTextField.dart';
import 'package:lifeshare/widgets/TextFields/PasswordTextField.dart';

class GeneralInformation extends StatefulWidget {
  @override
  _GeneralInformationState createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "General Information",
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
                labelTextStrr: "Name",
              ),
              EmailTextField(
                controller: TextEditingController(),
                validate: true,
              ),
              PasswordTextField(TextEditingController()),
              // CustomSwitch(
              //   value: _enable,
              //   onChanged: (bool val) {
              //     setState(() {
              //       _enable = val;
              //     });
              //   },
              // ),
              MobileTextField(TextEditingController()),
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
