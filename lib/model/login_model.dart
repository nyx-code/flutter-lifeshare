import 'dashboard_model/address_model.dart';
import 'dashboard_model/reports_date.dart';

class LoginDataModel {
  String accessToken;
  String userType;
  Address address;
  ReportsDates reportsDates;
  String sId;
  bool isDonor;
  bool isRecevier;
  String name;
  String email;
  String avatar;
  int mobile;
  int age;
  int weight;
  String bloodGroup;
  String gender;
  String haveChild;
  int iV;
  String patientBG;
  LoginDataModel(
      {this.accessToken,
      this.userType,
      this.address,
      this.reportsDates,
      this.sId,
      this.name,
      this.email,
      this.avatar,
      this.isDonor,
      this.isRecevier,
      this.mobile,
      this.age,
      this.weight,
      this.bloodGroup,
      this.gender,
      this.haveChild,
      this.iV,
      this.patientBG});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    userType = json['userType'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    reportsDates = json['reportsDates'] != null
        ? new ReportsDates.fromJson(json['reportsDates'])
        : null;
    isDonor = json['isDonor'];
    isRecevier = json['isReceiver'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    mobile = json['mobile'];
    age = json['age'];
    weight = json['weight'];
    bloodGroup = json['bloodGroup'];
    gender = json['gender'];
    haveChild = json['haveChild'];
    iV = json['__v'];
    patientBG = json['patientBG'];
  }
}
