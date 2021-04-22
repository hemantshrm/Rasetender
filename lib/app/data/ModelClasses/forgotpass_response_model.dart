class ForgotPassResponseModel {
  String msg;
  String newpassword;
  int status;

  ForgotPassResponseModel({this.msg, this.newpassword, this.status});

  ForgotPassResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    newpassword = json['newpassword'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['newpassword'] = this.newpassword;
    data['status'] = this.status;
    return data;
  }
}
