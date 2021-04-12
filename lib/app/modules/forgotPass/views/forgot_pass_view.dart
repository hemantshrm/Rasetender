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
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            color: AppConstants.BACKGROUND_COLOR_BOTTOM,
            width: Get.width,
            height: Get.height,
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height / 10,
                ),
                CircleAvatar(
                  backgroundColor: AppConstants.APP_THEME_COLOR,
                  radius: 60,
                  child: Image.asset('assets/images/icon.png'),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Metal Scrapper",
                          style: GoogleFonts.montserrat(
                              color: Colors.black, fontSize: 20)),
                    )),
                SizedBox(
                  height: Get.height / 14,
                ),
                LoginButtons(
                    icon: Icon(Icons.email_outlined),
                    hintText: "Enter your email Id",
                    heading: "Email Address",
                    hidetext: false),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 40,
                ),
                MainButton(
                  title: "Submit",
                  onpress: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SignUp",
                      style: textstyle.copyWith(
                          fontSize: 16, color: Color(0xff919294)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Text("Back to Login",
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
