class LoginDataModel {
  String accessToken;
  String userType;
  Address address;
  ReportsDates reportsDates;
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
  LoginDataModel(
      {this.accessToken,
      this.userType,
      this.address,
      this.reportsDates,
      this.sId,
      this.name,
      this.email,
      this.avatar,
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

class Address {
  String area;
  String city;
  String state;
  int pincode;

  Address({this.area, this.city, this.state, this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }
}

class ReportsDates {
  String first;
  String second;

  ReportsDates({this.first, this.second});

  ReportsDates.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['second'] = this.second;
    return data;
  }
}
