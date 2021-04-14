import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/signUp/providers/registration_model_provider.dart';
import 'package:scrap_bid/app/modules/signUp/registration_model_model.dart';
import 'package:scrap_bid/app/modules/signUp/registration_response_model.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();

  RegistrationModelProvider _modelProvider= RegistrationModelProvider();

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
    } else if (phoneNo.text.isEmpty) {
      errorSnackbar(msg: "Enter your phone Number.");
    } else if (!GetUtils.isPhoneNumber(phoneNo.text)) {
      errorSnackbar(msg: "Invalid Phone Number.");
    } else if (email.text.isEmpty) {
      errorSnackbar(msg: 'Enter Email Address');
    } else if (!GetUtils.isEmail(email.text)) {
      errorSnackbar(msg: 'Invalid Email');
    } else if (password.text.isEmpty) {
      errorSnackbar(msg: 'Enter Password');
    } else if (password.text != confirmPassword.text) {
      errorSnackbar(msg: 'Password Don\'t Match');
    } else if (password.text.length < 8) {
      errorSnackbar(msg: "Password must be 8 digit");
    }
    else if(address.text==null&&address.text.isEmpty){
      errorSnackbar(msg: 'Enter valid address');
    }
    else {
      RegistrationModel _model= RegistrationModel(fullname: username.text,email: email.text,phone: phoneNo.text,password: password.text,cpassword: confirmPassword.text,address: address.text);

      RegistrationResponse response= await _modelProvider.postRegistrationModel(_model).then((value) => handleApi(value));
      print(response.toString());




    }
  }
  handleApi(RegistrationResponse response){
    if(response.status==1){
      Get.snackbar("Success", "",
          icon: Icon(Icons.person),
          // backgroundColor: Colors.green,
          colorText: Colors.green,
          duration: Duration(seconds: 2),
          overlayBlur: 3,
          messageText: Text(response.msg),
          mainButton: TextButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Text(
                "Login",
                style: TextStyle(color: AppConstants.APP_THEME_COLOR),
              )),
          progressIndicatorBackgroundColor: Colors.green,
          showProgressIndicator: true);
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(Routes.LOGIN);
        clearText();
      });
    }else{
      Get.snackbar("Failed", "",
          icon: Icon(Icons.person),
          // backgroundColor: Colors.green,
          colorText: Colors.red,
          duration: Duration(seconds: 2),
          overlayBlur: 3,
          messageText: Text(response.msg),
          mainButton: TextButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
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
    return Get.snackbar("Error ", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[300],
        colorText: Colors.white);
  }
}
// Get.defaultDialog(
//     title: "Profile Created",
//     radius: 10,
//     barrierDismissible: true,
//     titleStyle: TextStyle(color: Colors.green),
//     confirmTextColor: Colors.white,
//     buttonColor: AppConstants.APP_THEME_COLOR,
//     textConfirm: "Login",
//     content: Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Row(
//         children: [
//           Icon(Icons.login),
//           SizedBox(
//             width: 30,
//           ),
//           Text("Go to Login Page")
//         ],
//       ),
//     ),
//     onConfirm: () {
//       Get.toNamed(Routes.LOGIN);
//     });
