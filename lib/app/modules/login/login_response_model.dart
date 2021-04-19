class LoginResponse {
  String msg;
  int status;
  Data data;

  LoginResponse({this.msg, this.status, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String id;
  String fullname;
  String email;
  String phone;
  String address;
  String status;
  String approvalDate;
  String approvedBy;
  String lastLogin;
  Null deviceId;
  String createdOn;
  String token;

  Data(
      {this.id,
      this.fullname,
      this.email,
      this.phone,
      this.address,
      this.status,
      this.approvalDate,
      this.approvedBy,
      this.lastLogin,
      this.deviceId,
      this.createdOn,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    status = json['status'];
    approvalDate = json['approval_date'];
    approvedBy = json['approved_by'];
    lastLogin = json['last_login'];
    deviceId = json['device_id'];
    createdOn = json['created_on'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['status'] = this.status;
    data['approval_date'] = this.approvalDate;
    data['approved_by'] = this.approvedBy;
    data['last_login'] = this.lastLogin;
    data['device_id'] = this.deviceId;
    data['created_on'] = this.createdOn;
    data['token'] = this.token;
    return data;
  }
}
