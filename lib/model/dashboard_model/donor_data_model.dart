import 'address_model.dart';
import 'reports_date.dart';

class DonorDataListModel {
  List<DonorDataModel> data;

  DonorDataListModel({this.data});
  DonorDataListModel.fromJson(dynamic json) {
    data = <DonorDataModel>[];
    json.forEach((value) {
      data.add(DonorDataModel.fromJson(value));
    });
  }
}

class DonorDataModel {
  String sId;
  DonorId donorId;
  int iV;
  String storyData;

  DonorDataModel({this.sId, this.donorId, this.iV, this.storyData});

  DonorDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    donorId =
        json['donorId'] != null ? new DonorId.fromJson(json['donorId']) : null;
    iV = json['__v'];
    storyData = json['storyData'];
  }
}

class DonorId {
  Address address;
  ReportsDates reportsDates;
  String sId;
  String name;
  String email;
  String avatar;
  int mobile;
  String bloodGroup;

  DonorId(
      {this.address,
      this.reportsDates,
      this.sId,
      this.name,
      this.email,
      this.avatar,
      this.mobile,
      this.bloodGroup});

  DonorId.fromJson(Map<String, dynamic> json) {
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
    bloodGroup = json['bloodGroup'];
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
    data['bloodGroup'] = this.bloodGroup;
    return data;
  }
}
