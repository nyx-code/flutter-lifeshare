import 'package:flutter/material.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/model/dashboard_model/profile_model.dart';
import 'package:lifeshare/model/dashboard_model/request_data.model.dart';
import 'package:lifeshare/model/dashboard_model/upadte_donor_model.dart';
import 'package:lifeshare/model/login_model.dart';

abstract class DashboardRepo {
  Future<LoginDataModel> getUserDetails();
  Future<ProfileDataModel> getProfileDetails({@required token});
  Future<ProfileDataModel> getReceiveProfile({@required token});
  Future<ProfileDataModel> updateProfile(
      {@required UpdateDateModel updateDateModel, @required String token});
  Future<ProfileDataModel> updateReceiverProfile(
      {@required UpdateDateModel updateDateModel, @required String token});
  Future<DonorDataListModel> getDonors();
  Future<DonorDataListModel> getStory();
  Future<RequestDataListModel> getRequest();
}
