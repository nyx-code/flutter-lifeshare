import 'address_model.dart';

class RequestDataListModel {
  List<RequestDataModel> data;

  RequestDataListModel({this.data});
  RequestDataListModel.fromJson(dynamic json) {
    data = <RequestDataModel>[];
    json.forEach((value) {
      data.add(RequestDataModel.fromJson(value));
    });
  }
}

class RequestDataModel {
  String sId;
  ReceiverId receiverId;
  int iV;

  RequestDataModel({this.sId, this.receiverId, this.iV});

  RequestDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    receiverId = json['receiverId'] != null
        ? new ReceiverId.fromJson(json['receiverId'])
        : null;
    iV = json['__v'];
  }
}

class ReceiverId {
  Address address;
  String sId;
  String name;
  String email;
  String avatar;
  int mobile;
  String bloodGroup;

  ReceiverId(
      {this.address,
      this.sId,
      this.name,
      this.email,
      this.avatar,
      this.mobile,
      this.bloodGroup});

  ReceiverId.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    mobile = json['mobile'];
    bloodGroup = json['patientBG'];
  }
}
