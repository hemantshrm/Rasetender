import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scrap_bid/app/data/ModelClasses/login_model.dart';
import 'package:scrap_bid/app/data/ModelClasses/login_response_model.dart';
import 'package:scrap_bid/app/data/constants.dart';

import 'package:scrap_bid/app/modules/login/providers/login_model_provider.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final obscureText = true.obs;
  final passwordText = ''.obs;
  final emailText = ''.obs;

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final box = GetStorage();
  LoginModelProvider _loginModelProvider = LoginModelProvider();
  SharedPreferences pref;
  var token;

  void clear() {
    email.clear();
    password.clear();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {}
    });
    token = await FirebaseMessaging.instance.getToken();

    print(token);

    _getId();
    pref = await SharedPreferences.getInstance();
    FirebaseMessaging.onMessage.listen((var message) {
      String decription = message.data['title'];
      String title = message.data['message'];

      if (message != null) {
        flutterLocalNotificationsPlugin.show(
            message.hashCode,
            title,
            decription,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: 'launch_background',
              ),
            ));
      }
    });
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

  // String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
  //     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
      var deviceInfo = await _getId();

      box.write("deviceId", deviceInfo.androidId);
      var andId = box.read("deviceId");
      // print(andId);

      try {
        LoginModel _model = LoginModel(
            username: email.text,
            password: password.text,
            deviceId:
                Platform.isAndroid ? andId : deviceInfo.identifierForVendor,
            deviceToken: token,
            deviceType: Platform.isAndroid ? "Android" : "IOS");

        LoginResponse response = await _loginModelProvider
            .postRegistrationModel(_model)
            .then((value) => handleApi(value));
        print(response.toString());
      } catch (e) {
        print(e);
      }
    }
  }

  handleApi(LoginResponse response) {
    if (response.status == 1) {
      String user = jsonEncode(UserData.fromJson(response.data.toJson()));
      pref.setString('userData', user);
      clear();
      Get.toNamed(Routes.HOME);
    } else {
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
      backgroundColor: AppConstants.SNACK_BG_COLOR_SUCCESS,
    );
  }
}
