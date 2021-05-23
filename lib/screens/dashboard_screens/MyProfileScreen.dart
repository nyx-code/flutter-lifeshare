import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifeshare/bloc/dashboard/dashboard_cubit.dart';
import 'package:lifeshare/constant.dart';
import 'package:lifeshare/injection.dart';
import 'package:lifeshare/model/dashboard_model/profile_model.dart';
import 'package:lifeshare/model/dashboard_model/upadte_donor_model.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/widgets/CustomButton.dart';
import 'package:lifeshare/widgets/CustomDropDown.dart';
import 'package:lifeshare/widgets/DatePickerField.dart';
import 'package:lifeshare/widgets/TextFields/DefaultTextField.dart';
import 'package:lifeshare/widgets/TextFields/PinCodeField.dart';
import 'package:lifeshare/utils/DateTime.dart';
import 'package:lifeshare/widgets/loading.dart';
import 'package:lifeshare/widgets/snackbar/success_snackbar.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  ProfileDataModel profileDataModel;

  TextEditingController _area, _city, _state, _pincode, _age, _weight;

  String _bloodType, _userType;
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  String _gender;
  String _child = "No";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final _data = getIt<UserDynamicData>().getLoginModel;
    _userType = _data.userType;
    if (_data.userType == "Donor") {
      BlocProvider.of<DashboardCubit>(context)
          .getProfileData(token: _data.accessToken);
    } else {
      BlocProvider.of<DashboardCubit>(context)
          .getReceiveProfile(token: _data.accessToken);
    }

    _area = TextEditingController();
    _city = TextEditingController();
    _state = TextEditingController();
    _pincode = TextEditingController();
    _age = TextEditingController();
    _weight = TextEditingController();
  }

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

  _onUpdateProfile() {
    final _data = getIt<UserDynamicData>().getLoginModel;

    if (_formKey.currentState.validate()) {
      if (_userType == "Donor")
        BlocProvider.of<DashboardCubit>(context).updateProfile(
          token: _data.accessToken,
          model: UpdateDateModel(
            age: int.parse(_age.text),
            weight: int.parse(_weight.text),
            reportsDates: ReportsDates(
                first: selectedDate1.toString(),
                second: selectedDate2.toString()),
            address: Address(
              area: _area.text,
              city: _city.text,
              state: _state.text,
              pincode: int.parse(_pincode.text),
            ),
          ),
        );
      else
        BlocProvider.of<DashboardCubit>(context).updateRecevierProfile(
          token: _data.accessToken,
          model: UpdateDateModel(
            address: Address(
              area: _area.text,
              city: _city.text,
              state: _state.text,
              pincode: int.parse(_pincode.text),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: nearlyWhite,
        body: BlocConsumer<DashboardCubit, DashboardState>(
            listener: (context, state) {
          if (state is GetProfileData) {
            profileDataModel = state.model;
            final _address = profileDataModel.address;
            _area.text = _address.area;
            _city.text = _address.city;
            _state.text = _address.state;
            _pincode.text = _address.pincode.toString();
            _age.text = profileDataModel.age.toString();
            _weight.text = profileDataModel.weight.toString();
            _gender = profileDataModel.gender;
            _bloodType = profileDataModel.bloodGroup;
            selectedDate1 = DateTime.parse(profileDataModel.reportsDates.first);
            selectedDate2 =
                DateTime.parse(profileDataModel.reportsDates.second);
          } else if (state is DashboardSuccess) {
            ScaffoldMessenger.of(context)
              ..showSnackBar(successSnackBar(title: 'Profile Updated'));
          } else if (state is GetRecevieProfileData) {
            profileDataModel = state.model;
            final _address = profileDataModel.address;
            _area.text = _address.area;
            _city.text = _address.city;
            _state.text = _address.state;
            _pincode.text = _address.pincode.toString();
            _age.text = profileDataModel.age.toString();
            _weight.text = profileDataModel.weight.toString();
            _gender = profileDataModel.gender;
            _bloodType = profileDataModel.patientBG;
          }
        }, builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
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
                              profileDataModel == null
                                  ? '----'
                                  : profileDataModel.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              profileDataModel == null
                                  ? '----'
                                  : "+91 ${profileDataModel.mobile.toString()}",
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
                                  if (_userType == "Donor")
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          selectedDate:
                                              selectedDate1.getDateFormat,
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
                                          selectedDate:
                                              selectedDate2.getDateFormat,
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
                    if (_userType == "Donor")
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
                                      labelTextStrr: "Weight",
                                    ),
                                    CustomDropDown(
                                      title: "Gender",
                                      data: ["Male", "Female"],
                                      selectedDropdownValue: _gender,
                                      onChanged: null,
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
                        onPressed: _onUpdateProfile,
                      ),
                    ),
                  ],
                ),
              ),
              if (state is DashboardLoading) Loading()
            ],
          );
        }));
  }
}
