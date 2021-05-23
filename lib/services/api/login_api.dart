import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:lifeshare/model/login_model.dart';
import 'package:lifeshare/services/repo/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: LoginRepo)
class LoginApi extends LoginRepo {
  final Dio dio;
  final SharedPreferences preferences;
  LoginApi({this.preferences, @required this.dio});
  @override
  Future<LoginDataModel> login({String email, String password}) async {
    try {
      Response response;

      final _url = "/auth/donorlogin";

      response =
          await dio.post(_url, data: {"email": email, "password": password});
      storeUserData(response.data);
      return LoginDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  void storeUserData(
    Map json,
  ) async {
    SharedPreferences prefs = preferences;
    prefs.reload();
    prefs.setString('userdetails', jsonEncode(json));
  }

  @override
  Future<LoginDataModel> recieverLogin({String email, String password}) async {
    try {
      Response response;

      final _url = "/auth/receiverlogin";

      response =
          await dio.post(_url, data: {"email": email, "password": password});
      storeUserData(response.data);
      return LoginDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }
}
