import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/screens/signup/signup_screen/MedicalInformation.dart';
import 'package:lifeshare/screens/signup/signup_screen/RecieverMedicalInformation.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/snackbar/error_snakbar.dart';

import '../../../injection.dart';

class OtherInformation extends StatefulWidget {
  @override
  _OtherInformationState createState() => _OtherInformationState();
}

class _OtherInformationState extends State<OtherInformation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  String _gender = "Male";
  String _child = "No";

  _onNext() {
    if (_formKey.currentState.validate()) {
      if (_child == "Yes") {
        ScaffoldMessenger.of(context)
          ..showSnackBar(errorSnackBar(title: 'You should not have child'));
      } else {
        getIt<UserDynamicData>().addOtherInformation(
          model: OtherInformationModel(
              age: int.parse(_age.text),
              weight: int.parse(_weight.text),
              gender: _gender,
              haveChild: _child),
        );

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlocProvider(
              create: (context) => getIt<DashboardCubit>(),
              child: MedicalInformation());
        }));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Other Information',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: paddingL,
              vertical: paddingL,
            ),
            // height: 520,
            margin:
                EdgeInsets.symmetric(horizontal: paddingM, vertical: paddingL),
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
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'Please enter valid Age';
                          } else if (int.parse(v) < 18) {
                            return 'Age is should not be less than 18';
                          } else if (int.parse(v) > 60) {
                            return 'Age is should not be greater than 60';
                          }
                        },
                        controller: _age,
                        labelTextStrr: "Age",
                      ),
                      DefaultTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        type: TextInputType.phone,
                        controller: _weight,
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'Please enter valid Weight';
                          } else if (int.parse(v) < 50) {
                            return 'Weight is should not be less than 50';
                          }
                        },
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
                        onPressed: _onNext,
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
        ));
  }
}
