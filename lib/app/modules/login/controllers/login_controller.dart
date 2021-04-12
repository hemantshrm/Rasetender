import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final obscureText = true.obs;
  final passwordText = ''.obs;
  final emailText = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  setPassString(text) {
    passwordText.value = text;
  }

  setEmailString(text) {
    emailText.value = text;
  }

  toggle() {
    obscureText.value = !obscureText.value;
  }

  void validate() {
    if (email.text.isEmpty) {
      errorSnackbar(msg: 'Enter Email Address');
    } else if (password.text.isEmpty) {
      errorSnackbar(msg: 'Enter Password');
    } else if (password.text.length < 6) {
      errorSnackbar(msg: "Password must be 6 digit");
    } else {
      Get.toNamed(Routes.HOME);
    }
  }

  void errorSnackbar({@required String msg}) {
    return Get.snackbar('$msg', "Error !",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[300],
        colorText: Colors.white);
  }
}
