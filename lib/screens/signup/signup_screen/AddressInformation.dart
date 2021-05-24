import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/model/dashboard_model/address_model.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/model/login_model.dart';
import 'package:lifeshare/screens/signup/signup_screen/GeneralInformation.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/TextFields/PinCodeField.dart';

import '../../../injection.dart';

class AddressInformation extends StatefulWidget {
  @override
  _AddressInformationState createState() => _AddressInformationState();
}

class _AddressInformationState extends State<AddressInformation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _city = TextEditingController();

  final TextEditingController _state = TextEditingController();
  final TextEditingController _pincode = TextEditingController();

  _onNext() {
    if (_formKey.currentState.validate()) {
      getIt<UserDynamicData>().addAddress(
        model: Address(
          area: _area.text,
          city: _city.text,
          state: _state.text,
          pincode: int.parse(_pincode.text),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GeneralInformation(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(getIt<UserDynamicData>().getAccountType);
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Address Information',
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: paddingL,
              vertical: paddingL,
            ),
            // height: 720,
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
                        controller: _area,
                        labelTextStrr: "Area / Local",
                      ),
                      DefaultTextField(
                        controller: _city,
                        labelTextStrr: "City",
                      ),
                      DefaultTextField(
                        controller: _state,
                        labelTextStrr: "State",
                      ),
                      PinCodeField(
                        controller: _pincode,
                        labelStr: "Pincode",
                      ),
                      CustomButton(title: 'NEXT', onPressed: _onNext),
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
