import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/login/controllers/login_controller.dart';
import 'package:scrap_bid/app/modules/login/views/login_view.dart';
import 'package:scrap_bid/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class SignUpView extends StatelessWidget {
  final LoginController _logController =
      Get.put<LoginController>(LoginController());
  final SignUpController _signUpController =
      Get.put<SignUpController>(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.BACKGROUND_COLOR_BOTTOM,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            color: AppConstants.BACKGROUND_COLOR_BOTTOM,
            width: Get.width,
            height: Get.height,
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                // SizedBox(
                //   height: Get.height / 10,
                // ),
                // CircleAvatar(
                //   backgroundColor: AppConstants.APP_THEME_COLOR,
                //   radius: 60,
                //   child: Image.asset('assets/images/icon.png'),
                // ),
                // Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Align(
                //       alignment: Alignment.center,
                //       child: Text("Metal Scrapper",
                //           style: GoogleFonts.montserrat(
                //               color: Colors.black, fontSize: 20)),
                //     )),
                // SizedBox(
                //   height: Get.height / 14,
                // ),
                LoginButtons(
                  icon: Icon(Icons.person),
                  hintText: "Enter your Name",
                  heading: "Name",
                  hidetext: false,
                  suffixIcon: null,
                  onpress: () {},
                  textEditingController: _signUpController.username,
                ),
                SizedBox(
                  height: 30,
                ),
                LoginButtons(
                  icon: Icon(Icons.phone),
                  hintText: "Enter your Phone Number",
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
                LoginButtons(
                  icon: Icon(Icons.email_outlined),
                  hintText: "Enter your Email",
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
                Obx(
                  () => LoginButtons(
                    icon: Icon(Icons.lock_outline_rounded),
                    hintText: "Enter Password",
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
                  () => LoginButtons(
                    icon: Icon(Icons.lock_outline_rounded),
                    hintText: "Confirm Password",
                    heading: "Confirm Password",
                    suffixIcon: _logController.obscureText.value
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                    hidetext: _logController.obscureText.value,
                    onpress: () {
                      _logController.toggle();
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
                  onpress: () {
                    _signUpController.validate();
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: GestureDetector(
                //     onTap: () {
                //       Get.toNamed(Routes.LOGIN);
                //     },
                //     child: Text("Back to Login",
                //         style: textstyle.copyWith(
                //             fontSize: 16, color: Color(0xff919294))),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
