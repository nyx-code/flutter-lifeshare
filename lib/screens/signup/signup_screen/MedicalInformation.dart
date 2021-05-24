import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/model/dashboard_model/create_donor.dart';
import 'package:lifeshare/model/dashboard_model/reports_date.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/screens/main_screen/main_screen.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/DatePickerField.dart';
import 'package:lifeshare/utils/DateTime.dart';
import 'package:lifeshare/widgets/loading.dart';

import '../../../injection.dart';

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

  _onCreate() {
    getIt<UserDynamicData>().addMedicalInformation(
      model: MedicalInformationModel(
          bloodType: _bloodType,
          secondDate: selectedDate1.toString(),
          firstDate: selectedDate1.toString()),
    );
    final generalInformationModel =
        getIt<UserDynamicData>().getGeneralInformation;
    final otherInformationModel = getIt<UserDynamicData>().getOtherInformation;
    final medicalInformationModel =
        getIt<UserDynamicData>().getMedicalInformation;
    final address = getIt<UserDynamicData>().getAddress;

    final _data = CreateDonorModel(
      name: generalInformationModel.name,
      email: generalInformationModel.email,
      password: generalInformationModel.password,
      mobile: generalInformationModel.mobileNumber,
      age: otherInformationModel.age,
      weight: otherInformationModel.weight,
      area: address.area,
      city: address.city,
      state: address.state,
      pincode: address.pincode,
      gender: otherInformationModel.gender,
      haveChild: otherInformationModel.haveChild,
      bloodGroup: medicalInformationModel.bloodType,
      reportsDates: ReportsDates(
          first: medicalInformationModel.firstDate,
          second: medicalInformationModel.secondDate),
    );
    BlocProvider.of<DashboardCubit>(context).createDonor(model: _data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Medical Information',
        ),
        body: BlocConsumer<DashboardCubit, DashboardState>(
            listener: (context, state) {
          if (state is DashboardSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MainScreen()),
                (Route<dynamic> route) => false);
          }
        }, builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingL,
                    vertical: paddingL,
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: paddingM, vertical: paddingL),
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
                                  onTap: () => _selectDate1(context),
                                  selectedDate: selectedDate1.getDateFormat,
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
                                  onTap: () => _selectDate2(context),
                                  selectedDate: selectedDate2.getDateFormat,
                                ),
                              ],
                            ),
                            CustomButton(
                              title: 'CREATE ACCOUNT',
                              onPressed: _onCreate,
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
              if (state is DashboardLoading) Loading()
            ],
          );
        }));
  }
}
