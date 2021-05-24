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
