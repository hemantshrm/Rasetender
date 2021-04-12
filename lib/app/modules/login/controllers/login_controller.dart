import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';
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
    } else if (!GetUtils.isEmail(email.text)) {
      errorSnackbar(msg: 'Invalid Email');
      print(email.value);
    } else if (password.text.isEmpty) {
      errorSnackbar(msg: 'Enter Password');
    } else if (password.text.length < 8) {
      errorSnackbar(msg: "Password must be 8 digit");
    } else {
      Get.toNamed(Routes.HOME);
    }
  }

  void errorSnackbar({@required String msg}) {
    return Get.rawSnackbar(
      message: '$msg',
      margin: EdgeInsets.symmetric(horizontal: 10),
      borderRadius: 8,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      icon: Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
      ),
      overlayBlur: 1,
      shouldIconPulse: true,
      mainButton: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Dismiss")),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppConstants.SNACK_BG_COLOR,
      // colorText: Colors.white
    );
  }
}
