import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:lifeshare/model/dashboard_model/create_donor.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/model/dashboard_model/profile_model.dart';
import 'package:lifeshare/model/dashboard_model/request_data.model.dart';
import 'package:lifeshare/model/dashboard_model/upadte_donor_model.dart';
import 'package:lifeshare/model/login_model.dart';
import 'package:lifeshare/services/repo/dashboard_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: DashboardRepo)
class DashboardApi extends DashboardRepo {
  final SharedPreferences preferences;
  final Dio dio;
  DashboardApi({this.dio, @required this.preferences});

  @overrided
  Future<LoginDataModel> getUserDetails() async {
    SharedPreferences prefs = preferences;
    await prefs.reload();
    final data = prefs.getString('userdetails');
    final password = prefs.getString('password');
    return LoginDataModel.fromJson(
      json.decode(data),
    );
  }

  @override
  Future<ProfileDataModel> getProfileDetails({@required token}) async {
    try {
      Response response;

      final _url = "/donor/myaccount";

      response = await dio.get(_url,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ));
      return ProfileDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<ProfileDataModel> getReceiveProfile({token}) async {
    try {
      Response response;

      final _url = "/receiver/myaccount";

      response = await dio.get(_url,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ));
      return ProfileDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<ProfileDataModel> updateProfile(
      {UpdateDateModel updateDateModel, @required String token}) async {
    try {
      Response response;

      final _url = "/donor/updatedonor";

      response = await dio.put(_url,
          data: updateDateModel.toJson(),
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ));
      return ProfileDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<DonorDataListModel> getDonors() async {
    try {
      Response response;

      final _url = "/post";

      response = await dio.get(
        _url,
      );
      return DonorDataListModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<DonorDataListModel> getStory() async {
    try {
      Response response;

      final _url = "/story";

      response = await dio.get(
        _url,
      );
      return DonorDataListModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<RequestDataListModel> getRequest() async {
    try {
      Response response;

      final _url = "/request";

      response = await dio.get(
        _url,
      );
      return RequestDataListModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<ProfileDataModel> updateReceiverProfile(
      {UpdateDateModel updateDateModel, String token}) async {
    try {
      Response response;

      final _url = "/receiver/updatereceiver";

      response = await dio.put(_url,
          data: updateDateModel.toJson(),
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ));
      return ProfileDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<LoginDataModel> crateDonorAccount(
      {@required CreateDonorModel model}) async {
    try {
      Response response;

      final _url = "/donor/createdonor";

      response = await dio.post(
        _url,
        data: model.toJson(),
      );
      return LoginDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<LoginDataModel> crateReceiverAccount(
      {@required CreateDonorModel model}) async {
    try {
      Response response;

      final _url = "/receiver/createreceiver";

      response = await dio.post(
        _url,
        data: model.toJson(),
      );
      return LoginDataModel.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> removeDonor({token}) async {
    try {
      Response response;

      final _url = "/post/deletepost";

      response = await dio.delete(_url,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> removeReceiver({token}) async {
    try {
      Response response;

      final _url = "/request/deleterequest";

      response = await dio.delete(_url,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> addDonor({token}) async {
    try {
      Response response;

      final _url = "/post/createpost";

      response = await dio.post(_url,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> addReceiver({token}) async {
    try {
      Response response;

      final _url = "/receiver/createreceiver";

      response = await dio.post(_url,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ));
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> addStory({token, String data}) async {
    try {
      Response response;

      final _url = "/story/createstory";

      response = await dio.post(_url,
          options: Options(
            headers: {
              'Accept': 'application/json',
              'x-access-token': token,
            },
          ),
          data: {"storyData": data});
    } catch (e) {
      throw Exception();
    }
  }
}
