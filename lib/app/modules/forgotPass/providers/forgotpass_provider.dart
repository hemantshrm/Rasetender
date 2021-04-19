import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/forgotPass/forgotpass_response_model.dart';
import '../forgotpass_model.dart';

class ForgotPassProvider extends GetConnect {
  Future<ForgotPassResponseModel> postRegistrationModel(
      ForgotPassModel _model) async {
    var body = json.encode(_model.toJson());

    var response = await http.post(
        Uri.parse('${AppConstants.BASE_URL + AppConstants.FORGOT_PASS_URL}'),
        headers: {"Content-Type": "application/json"},
        body: body);
    ForgotPassResponseModel _value = ForgotPassResponseModel.fromJson(
      jsonDecode(response.body),
    );
    print("${response.statusCode}");
    print("${response.body}");

    return _value;
  }
}
