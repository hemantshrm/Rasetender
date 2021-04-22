class LoginModel {
  String username;
  String password;
  String deviceToken;
  String deviceId;
  String deviceType;

  LoginModel(
      {this.username,
      this.password,
      this.deviceToken,
      this.deviceId,
      this.deviceType});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    deviceToken = json['device_token'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['device_token'] = this.deviceToken;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    return data;
  }
}
