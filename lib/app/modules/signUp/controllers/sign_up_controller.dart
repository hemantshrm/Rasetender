import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
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
  void validate() {
    if (email.text.isEmpty) {
      errorSnackbar(msg: 'Enter Email Address');
    } else if (!GetUtils.isEmail(email.text)) {
      errorSnackbar(msg: 'Invalid Email');
    } else if (username.text.isEmpty) {
      errorSnackbar(msg: 'Enter Your Name');
    } else if (password.text.isEmpty) {
      errorSnackbar(msg: 'Enter Password');
    } else if (password.text.length < 8) {
      errorSnackbar(msg: "Password must be 8 digit");
    } else {
      Get.dialog(Container());
      Get.toNamed(Routes.LOGIN);
    }
  }

  void errorSnackbar({@required String msg}) {
    return Get.snackbar("Error ", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[300],
        colorText: Colors.white);
  }
}
