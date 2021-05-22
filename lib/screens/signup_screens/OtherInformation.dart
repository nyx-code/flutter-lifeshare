import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/TextFields/PinCodeField.dart';

class OtherInformation extends StatefulWidget {
  @override
  _OtherInformationState createState() => _OtherInformationState();
}

class _OtherInformationState extends State<OtherInformation> {
  final _formKey = GlobalKey<FormState>();
  String _gender = "Male";
  String _child = "No";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Other Information",
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
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                type: TextInputType.phone,
                controller: TextEditingController(),
                labelTextStrr: "Age",
              ),
              DefaultTextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                type: TextInputType.phone,
                controller: TextEditingController(),
                labelTextStrr: "Weight",
              ),
              CustomDropDown(
                title: "Gender",
                data: ["Male", "Female"],
                selectedDropdownValue: _gender,
                onChanged: (value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              _gender == "Female"
                  ? CustomDropDown(
                      title: "Have/Has biological child?",
                      data: ["Yes", "No"],
                      selectedDropdownValue: _child,
                      onChanged: (value) {
                        setState(() {
                          _child = value;
                        });
                      },
                    )
                  : Container(),
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
