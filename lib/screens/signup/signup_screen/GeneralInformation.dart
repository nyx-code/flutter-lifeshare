import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/injection.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/screens/signup/signup_screen/OtherInformation.dart';
import 'package:lifeshare/screens/signup/signup_screen/RecieverMedicalInformation.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();

  _onNext() {
    if (_formKey.currentState.validate()) {
      getIt<UserDynamicData>().addGeneralInformation(
        model: GeneralInformationModel(
          name: _name.text,
          email: _emailId.text,
          password: _password.text,
          mobileNumber: int.parse(_mobileNumber.text),
        ),
      );
      final _type = getIt<UserDynamicData>().getAccountType;
      if (_type == "Donor") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OtherInformation()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => getIt<DashboardCubit>(),
            child: RecieverMedicalInformation(),
          );
        }));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'General Information',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: paddingL,
              vertical: paddingL,
            ),
            // height: 576,
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
                        controller: _name,
                        labelTextStrr: "Name",
                      ),
                      EmailTextField(
                        controller: _emailId,
                        validate: true,
                      ),
                      PasswordTextField(_password),
                      // CustomSwitch(
                      //   value: _enable,
                      //   onChanged: (bool val) {
                      //     setState(() {
                      //       _enable = val;
                      //     });
                      //   },
                      // ),
                      MobileTextField(_mobileNumber),
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
