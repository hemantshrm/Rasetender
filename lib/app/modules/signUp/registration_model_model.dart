class RegistrationModel {
  String fullname;
  String email;
  String phone;
  String password;
  String cpassword;
  String address;

  RegistrationModel({this.fullname, this.email, this.phone, this.password, this.cpassword, this.address});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    cpassword = json['cpassword'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['cpassword'] = cpassword;
    data['address'] = address;
    return data;
  }
}
