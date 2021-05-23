import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:lifeshare/model/login_model.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class UserDynamicData {
  BehaviorSubject<LoginDataModel> _loginSubject = BehaviorSubject();

  Stream get loginModelStream => _loginSubject.stream;

  LoginDataModel get getLoginModel => _loginSubject.value;

  addLoginModel({@required LoginDataModel model}) {
    _loginSubject.add(model);
  }
}
