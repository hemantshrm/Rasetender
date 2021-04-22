import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:scrap_bid/app/data/ModelClasses/login_response_model.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'file:///C:/Users/vndsh/scrap_bid/lib/app/data/ModelClasses/login_model.dart';

class LoginModelProvider extends GetConnect {
  Future<LoginResponse> postRegistrationModel(LoginModel _model) async {
    var body = json.encode(_model.toJson());

    var response = await http.post(
        Uri.parse('${AppConstants.BASE_URL + AppConstants.LOGIN_URL}'),
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    LoginResponse _value = LoginResponse.fromJson(
      jsonDecode(response.body),
    );
    print("${response.statusCode}");
    print("${response.body}");

    return _value;
  }
}
