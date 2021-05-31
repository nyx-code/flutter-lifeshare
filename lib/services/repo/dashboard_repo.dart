import 'package:flutter/material.dart';
import 'package:lifeshare/model/dashboard_model/create_donor.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/model/dashboard_model/profile_model.dart';
import 'package:lifeshare/model/dashboard_model/request_data.model.dart';
import 'package:lifeshare/model/dashboard_model/upadte_donor_model.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/model/login_model.dart';
import 'package:lifeshare/model/dashboard_model/address_model.dart';

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
  Future<LoginDataModel> crateDonorAccount({@required CreateDonorModel model});
  Future<LoginDataModel> crateReceiverAccount(
      {@required CreateDonorModel model});
  Future<void> removeDonor({@required token});
  Future<void> removeReceiver({@required token});
  Future<void> addDonor({@required token});
  Future<void> addReceiver({@required token});
  Future<void> addStory({@required token, @required String data});
  Future<DonorDataListModel> searchDonor({@required String data});
}
