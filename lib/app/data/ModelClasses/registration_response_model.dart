class RegistrationResponse {
  int status;
  Data data;
  String msg;

  RegistrationResponse({this.status, this.data, this.msg});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  String fullname;
  String email;
  String phone;
  String password;
  String address;
  String companyName;
  String panNo;
  String gstNo;

  Data(
      {this.fullname,
      this.email,
      this.phone,
      this.password,
      this.address,
      this.companyName,
      this.panNo,
      this.gstNo});

  Data.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
    companyName = json['company_name'];
    panNo = json['pan_no'];
    gstNo = json['gst_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['address'] = this.address;
    data['company_name'] = this.companyName;
    data['pan_no'] = this.panNo;
    data['gst_no'] = this.gstNo;
    return data;
  }
}
