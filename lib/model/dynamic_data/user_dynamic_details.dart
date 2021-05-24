import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:lifeshare/model/dashboard_model/address_model.dart';
import 'package:lifeshare/model/login_model.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class UserDynamicData {
  BehaviorSubject<LoginDataModel> _loginSubject = BehaviorSubject();

  LoginDataModel get getLoginModel => _loginSubject.value;

  addLoginModel({@required LoginDataModel model}) {
    _loginSubject.add(model);
  }

  BehaviorSubject<String> _accountTypeSubject = BehaviorSubject();

  String get getAccountType => _accountTypeSubject.value;

  addAccountType({@required String type}) {
    _accountTypeSubject.add(type);
  }

  BehaviorSubject<Address> _addreeSubject = BehaviorSubject();

  Address get getAddress => _addreeSubject.value;

  addAddress({@required Address model}) {
    _addreeSubject.add(model);
  }

  BehaviorSubject<GeneralInformationModel> _generalInformation =
      BehaviorSubject();

  GeneralInformationModel get getGeneralInformation =>
      _generalInformation.value;

  addGeneralInformation({@required GeneralInformationModel model}) {
    _generalInformation.add(model);
  }

  BehaviorSubject<OtherInformationModel> _otherInformation = BehaviorSubject();

  OtherInformationModel get getOtherInformation => _otherInformation.value;

  addOtherInformation({@required OtherInformationModel model}) {
    _otherInformation.add(model);
  }

  BehaviorSubject<MedicalInformationModel> _medicalInformation =
      BehaviorSubject();

  MedicalInformationModel get getMedicalInformation =>
      _medicalInformation.value;

  addMedicalInformation({@required MedicalInformationModel model}) {
    _medicalInformation.add(model);
  }
}

class GeneralInformationModel {
  final String name;
  final String email;
  final String password;
  final int mobileNumber;

  GeneralInformationModel(
      {@required this.name,
      @required this.email,
      @required this.password,
      @required this.mobileNumber});
}

class OtherInformationModel {
  final int age;
  final int weight;
  final String gender;
  final String haveChild;

  OtherInformationModel(
      {@required this.age,
      @required this.weight,
      @required this.gender,
      @required this.haveChild});
}

class MedicalInformationModel {
  final String bloodType;
  final String firstDate;
  final String secondDate;

  MedicalInformationModel(
      {@required this.bloodType,
      @required this.firstDate,
      @required this.secondDate});
}
