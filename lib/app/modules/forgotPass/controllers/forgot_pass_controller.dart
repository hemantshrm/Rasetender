import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/Util/loader.dart';
import 'package:scrap_bid/app/data/ModelClasses/forgotpass_model.dart';
import 'package:scrap_bid/app/data/ModelClasses/forgotpass_response_model.dart';
import 'package:scrap_bid/app/data/constants.dart';

import 'package:scrap_bid/app/modules/forgotPass/providers/forgotpass_provider.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class ForgotPassController extends GetxController {
  TextEditingController forgotPassEmail = TextEditingController();
  ForgotPassProvider _forgotPassProvider = ForgotPassProvider();



  Future<void> submitEmail(BuildContext context) async {
    if (forgotPassEmail.text.isEmpty) {
      errorSnackbar(msg: 'Enter Email Address');
    } else if (!GetUtils.isEmail(forgotPassEmail.text)) {
      errorSnackbar(msg: 'Invalid Email');
    } else {
      onLoading(context);
      try {

        ForgotPassModel _model = ForgotPassModel(email: forgotPassEmail.text);

        ForgotPassResponseModel response = await _forgotPassProvider
            .postRegistrationModel(_model)
            .then((value) => handleApi(value));
        print(response.toString());
      } catch (e) {
        print(e);
      }
    }
  }

  handleApi(ForgotPassResponseModel response) {
    if (response.status == 1) {

      Get.defaultDialog(

        titleStyle: GoogleFonts.montserrat(color: Colors.green),
        content: Text(
          "${response.msg}",
          textAlign: TextAlign.center,
          textScaleFactor: 1.3,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Get.offAndToNamed(Routes.LOGIN);
            },
            child: Text("Okay"),
          ),
        ],
      );
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
      backgroundColor: AppConstants.SNACK_BG_COLOR_FAILURE,
    );
  }
}
