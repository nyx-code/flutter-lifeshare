import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/DatePickerField.dart';
import 'package:lifeshare/utils/DateTime.dart';

class MedicalInformation extends StatefulWidget {
  @override
  _MedicalInformationState createState() => _MedicalInformationState();
}

class _MedicalInformationState extends State<MedicalInformation> {
  final _formKey = GlobalKey<FormState>();
  String _bloodType = "A";
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  _selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: spaceM,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Negative test Report Dates",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: spaceM),
                  Text(
                    "Report 1 :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: spaceS),
                  DatePickerField(
                    onTap: () => _selectDate1(context),
                    selectedDate: selectedDate1.getDateFormat,
                  ),
                  SizedBox(height: spaceS),
                  Text(
                    "Report 2 :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: spaceS),
                  DatePickerField(
                    onTap: () => _selectDate2(context),
                    selectedDate: selectedDate2.getDateFormat,
                  ),
                ],
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
