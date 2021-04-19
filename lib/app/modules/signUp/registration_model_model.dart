class RegistrationModel {
  String fullname;
  String companyname;
  String email;
  String phone;
  String gst;
  String pan;
  String address;
  String password;
  String cpassword;

  RegistrationModel(
      {this.fullname,
      this.companyname,
      this.email,
      this.phone,
      this.gst,
      this.pan,
      this.address,
      this.password,
      this.cpassword});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    companyname = json['companyname'];
    email = json['email'];
    phone = json['phone'];
    gst = json['gst'];
    pan = json['pan'];
    address = json['address'];
    password = json['password'];
    cpassword = json['cpassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['companyname'] = this.companyname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gst'] = this.gst;
    data['pan'] = this.pan;
    data['address'] = this.address;
    data['password'] = this.password;
    data['cpassword'] = this.cpassword;
    return data;
  }
}
