import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/data/ModelClasses/registration_model_model.dart';
import 'package:scrap_bid/app/data/ModelClasses/registration_response_model.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/signUp/providers/registration_model_provider.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController gstNum = TextEditingController();
  TextEditingController panNum = TextEditingController();
  TextEditingController companyName = TextEditingController();

  RegistrationModelProvider _modelProvider = RegistrationModelProvider();

  void clearText() {
    email.clear();
    username.clear();
    phoneNo.clear();
    password.clear();
    confirmPassword.clear();
    address.clear();
  }

  Future<void> validate() async {
    if (username.text.isEmpty) {
      errorSnackbar(msg: 'Enter Your Name');
    } else if (panNum.text.length != 10) {
      errorSnackbar(msg: 'Invalid PAN Number.');
    } else if (phoneNo.text.isEmpty) {
      errorSnackbar(msg: "Enter your phone Number.");
    } else if (!GetUtils.isPhoneNumber(phoneNo.text)) {
      errorSnackbar(msg: "Invalid Phone Number.");
    } else if (email.text.isEmpty) {
      errorSnackbar(msg: 'Enter Email Address');
    } else if (companyName.text.isEmpty) {
      errorSnackbar(msg: 'Enter your Company Name');
    } else if (gstNum.text.isEmpty) {
      errorSnackbar(msg: 'Enter GST Number.');
    } else if (gstNum.text.length != 15) {
      errorSnackbar(msg: 'Invalid GST Number.');
    } else if (!GetUtils.isEmail(email.text)) {
      errorSnackbar(msg: 'Invalid Email');
    } else if (password.text.isEmpty) {
      errorSnackbar(msg: 'Enter Password');
    } else if (password.text != confirmPassword.text) {
      errorSnackbar(msg: 'Password Don\'t Match');
    } else if (password.text.length < 8) {
      errorSnackbar(msg: "Password must be 8 digit");
    } else if (address.text == null && address.text.isEmpty) {
      errorSnackbar(msg: 'Enter valid address');
    } else {
      RegistrationModel _model = RegistrationModel(
          fullname: username.text,
          email: email.text,
          phone: phoneNo.text,
          password: password.text,
          cpassword: confirmPassword.text,
          address: address.text,
          pan: panNum.text,
          gst: gstNum.text,
          companyname: companyName.text);

      RegistrationResponse response = await _modelProvider
          .postRegistrationModel(_model)
          .then((value) => handleApi(value));
      print(response.toString());
    }
  }

  handleApi(RegistrationResponse response) {
    if (response.status == 1) {
      Get.snackbar("Success", "",
          icon: Icon(Icons.person),
          colorText: Colors.green,
          duration: Duration(seconds: 2),
          overlayBlur: 3,
          messageText: Text(response.msg),
          mainButton: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Login",
                style: TextStyle(color: AppConstants.APP_THEME_COLOR),
              )),
          progressIndicatorBackgroundColor: Colors.green,
          showProgressIndicator: true);
      Future.delayed(const Duration(seconds: 2), () {
        Get.toNamed(Routes.LOGIN);
        clearText();
      });
    } else {
      Get.snackbar("Failed", "",
          icon: Icon(Icons.person),
          colorText: Colors.red,
          duration: Duration(seconds: 2),
          overlayBlur: 3,
          messageText: Text(response.msg),
          mainButton: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Retry",
                style: TextStyle(color: AppConstants.APP_THEME_COLOR),
              )),
          progressIndicatorBackgroundColor: Colors.red,
          showProgressIndicator: true);
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
          child: Text(
            "Dismiss",
            style: TextStyle(color: AppConstants.APP_THEME_COLOR),
          )),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppConstants.SNACK_BG_COLOR_SUCCESS,
      // colorText: Colors.white
    );
  }
}
