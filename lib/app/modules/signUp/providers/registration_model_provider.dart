import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/signUp/registration_response_model.dart';

import '../registration_model_model.dart';

class RegistrationModelProvider  {

  Future<RegistrationResponse> postRegistrationModel(RegistrationModel _model) async {

    var body = json.encode(_model.toJson());

    var response = await http.post(
        Uri.parse('${AppConstants.BASE_URL+AppConstants.REGISTRATION_URL}'),
        headers: {"Content-Type": "application/json"},
        body: body);
    RegistrationResponse _value = RegistrationResponse.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return _value;
  }
}
