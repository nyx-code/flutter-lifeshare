import 'package:flutter/material.dart';
import 'package:lifeshare/model/dashboard_model/profile_model.dart';

class UpdateDateModel {
  int age;
  int weight;
  ReportsDates reportsDates;
  Address address;

  UpdateDateModel(
      {this.age, this.weight, this.reportsDates, @required this.address});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['weight'] = this.weight;
    if (this.reportsDates != null) {
      data['reportsDates'] = this.reportsDates.toJson();
    }
    data['address'] = this.address;

    return data;
  }
}
