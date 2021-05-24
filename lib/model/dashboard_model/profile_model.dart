import 'address_model.dart';
import 'reports_date.dart';

class ProfileDataModel {
  Address address;
  ReportsDates reportsDates;
  bool isDonor;
  bool isRecevier;
  String sId;
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

  ProfileDataModel(
      {this.address,
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

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    reportsDates = json['reportsDates'] != null
        ? new ReportsDates.fromJson(json['reportsDates'])
        : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    mobile = json['mobile'];
    isDonor = json['isDonor'];
    isRecevier = json['isReceiver'];
    age = json['age'];
    weight = json['weight'];
    bloodGroup = json['bloodGroup'];
    gender = json['gender'];
    haveChild = json['haveChild'];
    iV = json['__v'];
    patientBG = json['patientBG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.reportsDates != null) {
      data['reportsDates'] = this.reportsDates.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['mobile'] = this.mobile;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['bloodGroup'] = this.bloodGroup;
    data['gender'] = this.gender;
    data['haveChild'] = this.haveChild;
    data['__v'] = this.iV;
    return data;
  }
}
