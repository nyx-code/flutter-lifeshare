import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/DatePickerField.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/TextFields/EmailTextField.dart';
import 'package:lifeshare/widgets/TextFields/MobileTextField.dart';
import 'package:lifeshare/widgets/TextFields/PinCodeField.dart';

import 'package:lifeshare/utils/DateTime.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String _bloodType = "A";
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  String _gender = "Male";
  String _child = "No";
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
    return Scaffold(
      backgroundColor: nearlyWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: spaceM,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingM),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingL,
                  vertical: paddingL,
                ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://www.hostpapa.hk/knowledgebase/wp-content/uploads/2018/04/1-13.png"),
                      ),
                    ),
                    SizedBox(
                      height: spaceS,
                    ),
                    Text(
                      "Shailesh Kadam",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "+91 8446842249",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: spaceM),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: spaceM,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingM),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingL,
                  vertical: paddingL,
                ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
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
                          SizedBox(
                            height: spaceS,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: spaceM,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingM),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingL,
                  vertical: paddingL,
                ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
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
                      // key: _formKey,
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
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: spaceM),
                              Text(
                                "Report 1 :",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: spaceS),
                              DatePickerField(
                                onTap: () => _selectDate1(context),
                                selectedDate: selectedDate1.getDateFormat,
                              ),
                              SizedBox(height: spaceS),
                              Text(
                                "Report 2 :",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: spaceS),
                              DatePickerField(
                                onTap: () => _selectDate2(context),
                                selectedDate: selectedDate2.getDateFormat,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: spaceS,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: spaceM,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingM),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingL,
                  vertical: paddingL,
                ),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
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
                      // key: _formKey,
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
                          SizedBox(
                            height: spaceS,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: spaceM,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingM),
              child: CustomButton(
                title: 'SAVE PROFILE',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
