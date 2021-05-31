import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/login/controllers/login_controller.dart';
import 'package:scrap_bid/app/modules/login/views/login_view.dart';
import 'package:scrap_bid/app/modules/signUp/controllers/sign_up_controller.dart';

class SignUpView extends StatelessWidget {
  final LoginController _logController =
      Get.put<LoginController>(LoginController());
  final SignUpController _signUpController =
      Get.put<SignUpController>(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up", style: GoogleFonts.montserrat(fontSize: 20)),
        backgroundColor: AppConstants.APP_THEME_COLOR,
      ),
      backgroundColor: AppConstants.BACKGROUND_COLOR_BOTTOM,
      body: Obx(
        () => Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: AppConstants.BACKGROUND_COLOR_BOTTOM,
              width: Get.width,
              height: Get.height,
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(height: 20),
                  LoginFields(
                    icon: Icon(Icons.person),
                    heading: "Name",
                    hidetext: false,
                    suffixIcon: null,
                    onpress: () {},
                    textEditingController: _signUpController.username,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginFields(
                    icon: Icon(Icons.domain),
                    heading: "Company Name",
                    hidetext: false,
                    suffixIcon: null,
                    onpress: () {},
                    textEditingController: _signUpController.companyName,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginFields(
                    icon: Icon(Icons.text_snippet_outlined),
                    heading: "Pan No.",
                    hidetext: false,
                    suffixIcon: null,
                    onpress: () {},
                    textEditingController: _signUpController.panNum,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginFields(
                    icon: Icon(Icons.text_snippet_outlined),
                    heading: "GST No.",
                    hidetext: false,
                    suffixIcon: null,
                    onpress: () {},
                    textEditingController: _signUpController.gstNum,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginFields(
                    icon: Icon(Icons.phone),
                    heading: "Phone Number",
                    hidetext: false,
                    suffixIcon: null,
                    onpress: () {},
                    textEditingController: _signUpController.phoneNo,
                    keyboard: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginFields(
                    icon: Icon(Icons.email_outlined),
                    heading: "Email",
                    hidetext: false,
                    suffixIcon: null,
                    onpress: () {},
                    textEditingController: _signUpController.email,
                    keyboard: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginFields(
                    icon: Icon(Icons.location_city_rounded),
                    heading: "Address",
                    hidetext: false,
                    suffixIcon: null,
                    textEditingController: _signUpController.address,
                    keyboard: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => LoginFields(
                      icon: Icon(Icons.lock_outline_rounded),
                      heading: "Password",
                      suffixIcon: null,
                      hidetext: _logController.obscureText.value,
                      textEditingController: _signUpController.password,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => LoginFields(
                      icon: Icon(Icons.lock_outline_rounded),
                      heading: "Confirm Password",
                      suffixIcon: _logController.obscureText.value
                          ? Icon(Icons.visibility_outlined)
                          : Icon(Icons.visibility_off_outlined),
                      hidetext: _logController.obscureText.value,
                      onpress: () {
                        _logController.obscureText.toggle();
                      },
                      ontextChange: (text) {},
                      textEditingController: _signUpController.confirmPassword,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MainButton(
                    title: "Submit",
                    onPress: () {
                      _signUpController.validate(context);
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            _signUpController.isloading.value
                ? Container(
                    height: Get.height,
                    width: Get.width,
                    color: Colors.black12,
                    child: Center(
                        child: new CircularProgressIndicator(
                      color: Colors.blue,
                    )))
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
