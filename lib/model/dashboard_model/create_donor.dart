import 'package:flutter/material.dart';

import 'reports_date.dart';

class CreateDonorModel {
  String name;
  String email;
  String password;
  int mobile;
  int age;
  int weight;
  String bloodGroup;
  String patientBG;
  String area;
  String city;
  String state;
  int pincode;
  String gender;
  String haveChild;
  ReportsDates reportsDates;

  CreateDonorModel(
      {@required this.name,
      @required this.email,
      @required this.password,
      @required this.mobile,
      @required this.age,
      @required this.weight,
      @required this.area,
      @required this.city,
      this.bloodGroup,
      this.patientBG,
      @required this.state,
      @required this.pincode,
      @required this.gender,
      @required this.haveChild,
      @required this.reportsDates});

  CreateDonorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    age = json['age'];
    weight = json['weight'];
    bloodGroup = json['bloodGroup'];
    patientBG = json['patientBG'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    gender = json['gender'];
    haveChild = json['haveChild'];
    reportsDates = json['reportsDates'] != null
        ? new ReportsDates.fromJson(json['reportsDates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['bloodGroup'] = this.bloodGroup;
    data['area'] = this.area;
    data['patientBG'] = this.patientBG;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['gender'] = this.gender;
    data['haveChild'] = this.haveChild;
    if (this.reportsDates != null) {
      data['reportsDates'] = this.reportsDates.toJson();
    }
    return data;
  }
}
