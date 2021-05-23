import 'package:flutter/material.dart';
import 'package:lifeshare/model/login_model.dart';

abstract class LoginRepo {
  Future<LoginDataModel> login(
      {@required String email, @required String password});

  Future<LoginDataModel> recieverLogin(
      {@required String email, @required String password});
}
