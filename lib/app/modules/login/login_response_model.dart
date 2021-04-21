class LoginResponse {
  String msg;
  int status;
  UserData data;

  LoginResponse({this.msg, this.status, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
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

class UserData {
  String id;
  String fullname;
  String companyName;
  String email;
  String phone;
  String password;
  String address;
  String panNo;
  String gstNo;
  Null profilePic;
  Null loginDevice;
  String lastLogin;
  String accessToken;
  Null deviceId;
  Null deviceType;
  String status;
  String approvalDate;
  String approvedBy;
  Null otp;
  Null otpDatetime;
  String otpVerified;
  Null otpVerificationDate;
  String createdOn;
  Null updatedAt;
  String token;

  UserData(
      {this.id,
      this.fullname,
      this.companyName,
      this.email,
      this.phone,
      this.password,
      this.address,
      this.panNo,
      this.gstNo,
      this.profilePic,
      this.loginDevice,
      this.lastLogin,
      this.accessToken,
      this.deviceId,
      this.deviceType,
      this.status,
      this.approvalDate,
      this.approvedBy,
      this.otp,
      this.otpDatetime,
      this.otpVerified,
      this.otpVerificationDate,
      this.createdOn,
      this.updatedAt,
      this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    companyName = json['company_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
    panNo = json['pan_no'];
    gstNo = json['gst_no'];
    profilePic = json['profile_pic'];
    loginDevice = json['login_device'];
    lastLogin = json['last_login'];
    accessToken = json['access_token'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    status = json['status'];
    approvalDate = json['approval_date'];
    approvedBy = json['approved_by'];
    otp = json['otp'];
    otpDatetime = json['otp_datetime'];
    otpVerified = json['otp_verified'];
    otpVerificationDate = json['otp_verification_date'];
    createdOn = json['created_on'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['company_name'] = this.companyName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['address'] = this.address;
    data['pan_no'] = this.panNo;
    data['gst_no'] = this.gstNo;
    data['profile_pic'] = this.profilePic;
    data['login_device'] = this.loginDevice;
    data['last_login'] = this.lastLogin;
    data['access_token'] = this.accessToken;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['status'] = this.status;
    data['approval_date'] = this.approvalDate;
    data['approved_by'] = this.approvedBy;
    data['otp'] = this.otp;
    data['otp_datetime'] = this.otpDatetime;
    data['otp_verified'] = this.otpVerified;
    data['otp_verification_date'] = this.otpVerificationDate;
    data['created_on'] = this.createdOn;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
