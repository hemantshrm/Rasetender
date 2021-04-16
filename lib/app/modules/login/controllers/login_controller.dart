import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/login/login_model.dart';
import 'package:scrap_bid/app/modules/login/login_response_model.dart';
import 'package:scrap_bid/app/modules/login/providers/login_model_provider.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final obscureText = true.obs;
  final passwordText = ''.obs;
  final emailText = ''.obs;
  var isLoading = false.obs;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  LoginModelProvider _loginModelProvider = LoginModelProvider();

  @override
  void onInit() {
    super.onInit();
    _getId();
  }

  Future _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo;
    }
  }

  toggle() {
    obscureText.value = !obscureText.value;
  }

  setPassString(text) {
    passwordText.value = text;
  }

  setEmailString(text) {
    emailText.value = text;
  }

  Future<void> validate() async {
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
      var deviceId = await _getId();
      isLoading(true);
      try {
        LoginModel _model = LoginModel(
            username: email.text,
            password: password.text,
            deviceId: Platform.isAndroid
                ? deviceId.androidId
                : deviceId.identifierForVendor,
            deviceToken: AppConstants.DEVICE_TOKEN,
            deviceType: Platform.isAndroid ? "Android" : "IOS");

        LoginResponse response = await _loginModelProvider
            .postRegistrationModel(_model)
            .then((value) => handleApi(value));
        print(response.toString());
      } catch (e) {
        print(e);
      } finally {
        isLoading(false);
      }
    }
  }

  handleApi(LoginResponse response) {
    if (response.status == 1) {
      Get.snackbar('${response.msg}', "",
          icon: Icon(Icons.person),
          // backgroundColor: Colors.green,
          colorText: Colors.green,
          duration: Duration(seconds: 2),
          overlayBlur: 3,
          messageText: Text(response.msg),
          progressIndicatorBackgroundColor: Colors.green,
          showProgressIndicator: true);
      Future.delayed(const Duration(seconds: 3), () {
        isLoading(false);
        Get.toNamed(Routes.HOME);
      });
    } else {
      isLoading(false);
      errorSnackbar(msg: response.msg);
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
            style: TextStyle(color: Colors.black),
          )),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppConstants.SNACK_BG_COLOR,
    );
  }
}
