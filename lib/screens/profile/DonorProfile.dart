import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/DatePickerField.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/TextFields/PinCodeField.dart';
import 'package:lifeshare/utils/DateTime.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DonorProfile extends StatefulWidget {
  final DonorDataModel model;

  const DonorProfile({@required this.model});

  @override
  _DonorProfileState createState() => _DonorProfileState();
}

class _DonorProfileState extends State<DonorProfile> {
  TextEditingController _area, _city, _state, _pincode;

  String _bloodType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _area = TextEditingController(text: widget.model.donorId.address.area);
    _city = TextEditingController(text: widget.model.donorId.address.city);
    _state = TextEditingController(text: widget.model.donorId.address.state);
    _pincode = TextEditingController(
        text: widget.model.donorId.address.pincode.toString());
    _bloodType = widget.model.donorId.bloodGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Donor Profile",
      ),
      body: Container(
        color: nearlyWhite,
        child: SingleChildScrollView(
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
                    vertical: paddingM,
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
                          backgroundImage:
                              NetworkImage(widget.model.donorId.avatar),
                        ),
                      ),
                      SizedBox(
                        height: spaceS,
                      ),
                      Text(
                        widget.model.donorId.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "+91 ${widget.model.donorId.mobile}",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(height: spaceS),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingS),
                        child: CustomButton(
                          title: 'CALL NOW',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: spaceM,
              ),
              SizedBox(height: spaceM),
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
                              controller: _area,
                              enabled: false,
                              labelTextStrr: "Area / Local",
                            ),
                            DefaultTextField(
                              controller: _city,
                              enabled: false,
                              labelTextStrr: "City",
                            ),
                            DefaultTextField(
                              controller: _state,
                              enabled: false,
                              labelTextStrr: "State",
                            ),
                            PinCodeField(
                              controller: _pincode,
                              enabled: false,
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
                              onChanged: null,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: spaceM),
                                Text(
                                  "Report 1 :",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: spaceS),
                                DatePickerField(
                                  selectedDate: widget.model.donorId
                                      .reportsDates.first.getSuccessDateFormat,
                                ),
                                SizedBox(height: spaceS),
                                Text(
                                  "Report 2 :",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: spaceS),
                                DatePickerField(
                                  selectedDate: widget.model.donorId
                                      .reportsDates.second.getSuccessDateFormat,
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
            ],
          ),
        ),
      ),
    );
  }
}
