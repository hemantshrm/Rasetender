import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/login/login_model.dart';
import 'package:scrap_bid/app/modules/login/login_response_model.dart';

class LoginModelProvider extends GetConnect {
  var isLoading = true.obs;
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
    isLoading(false);
    return _value;
  }
}
