import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/injection.dart';
import 'package:lifeshare/model/dashboard_model/create_donor.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/screens/main_screen/main_screen.dart';
import 'package:lifeshare/widgets/CustomAppBar.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/loading.dart';

class RecieverMedicalInformation extends StatefulWidget {
  @override
  _RecieverMedicalInformationState createState() =>
      _RecieverMedicalInformationState();
}

class _RecieverMedicalInformationState
    extends State<RecieverMedicalInformation> {
  final _formKey = GlobalKey<FormState>();
  String _bloodType = "A";

  _onNext() {
    getIt<UserDynamicData>().addMedicalInformation(
      model: MedicalInformationModel(
          bloodType: _bloodType, secondDate: null, firstDate: null),
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
        patientBG: medicalInformationModel.bloodType,
        reportsDates: null);
    BlocProvider.of<DashboardCubit>(context).createReceiver(model: _data);
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
        },
        builder: (context, state) {
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
              ),
              if (state is DashboardLoading) Loading()
            ],
          );
        },
      ),
    );
  }
}
