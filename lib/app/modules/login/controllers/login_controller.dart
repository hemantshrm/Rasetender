import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final obscureText = true.obs;
  final passwordText = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  setpassString(text) {
    passwordText.value = text;
  }

  toggle() {
    obscureText.value = !obscureText.value;
  }

  validate() {}
}
