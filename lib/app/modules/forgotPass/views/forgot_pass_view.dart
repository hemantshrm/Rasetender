import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/login/views/login_view.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

import '../controllers/forgot_pass_controller.dart';

class ForgotPassView extends GetView<ForgotPassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password",
            style: GoogleFonts.montserrat(fontSize: 20)),
        backgroundColor: AppConstants.APP_THEME_COLOR,
        centerTitle: true,
      ),
      backgroundColor: AppConstants.BACKGROUND_COLOR_BOTTOM,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: AppConstants.BACKGROUND_COLOR_BOTTOM,
            width: Get.width,
            height: Get.height,
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height / 10,
                ),
                SizedBox(
                  height: Get.height / 14,
                ),
                LoginFields(
                  hintText: "Your email Id",
                  heading: "Email",
                  hidetext: false,
                  keyboard: TextInputType.emailAddress,
                  icon: Icon(Icons.email_outlined),
                  textEditingController: controller.forgotPassEmail,
                ),
                SizedBox(
                  height: 40,
                ),
                MainButton(
                  title: "Submit",
                  onPress: () {
                    controller.submitEmail();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Text("Back to login",
                          style: textstyle.copyWith(
                              fontSize: 16, color: Color(0xff919294))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
