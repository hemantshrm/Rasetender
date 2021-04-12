import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
              shrinkWrap: true,
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
                  hidetext: false,
                  suffixIcon: null,
                  onpress: () {},
                  ontextChange: (text) {
                    controller.setEmailString(text);
                  },
                  textEditingController: controller.email,
                ),
                SizedBox(
                  height: 40,
                ),
                Obx(
                  () => LoginButtons(
                    icon: Icon(Icons.lock_outline_rounded),
                    hintText: "Enter your Password",
                    heading: "Password",
                    suffixIcon: controller.obscureText.value
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                    hidetext: controller.obscureText.value,
                    onpress: () {
                      controller.toggle();
                    },
                    ontextChange: (text) {
                      controller.setPassString(text);
                    },
                    textEditingController: controller.password,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MainButton(
                  title: "Login",
                  onpress: () {
                    controller.validate();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SIGN_UP);
                      },
                      child: Text(
                        "SignUp",
                        style: textstyle.copyWith(
                            fontSize: 16, color: Color(0xff919294)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.FORGOT_PASS);
                      },
                      child: Text("Forgot Password?",
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

class MainButton extends StatelessWidget {
  MainButton({this.title, this.onpress});

  final String title;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: Get.width, height: Get.height / 13),
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: AppConstants.APP_THEME_COLOR,
        ),
        child: Center(
            child: Text(
          title,
          style: textstyle.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}

class LoginButtons extends StatelessWidget {
  Function(String) ontextChange;
  LoginButtons(
      {this.icon,
      this.hintText,
      this.heading,
      this.suffixIcon,
      this.hidetext,
      this.onpress,
      this.ontextChange,
      this.textEditingController});
  final Function onpress;
  final String hintText, heading;
  final Icon icon;
  final Icon suffixIcon;
  final bool hidetext;
  TextEditingController textEditingController;
  final LoginController controller =
      Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      height: Get.height / 8,
      width: Get.width,
      color: Colors.white,
      borderRadius: 20,
      depth: 20,
      spread: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: GoogleFonts.montserrat(
                  color: Color(0xffA1A1A1),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: ClayContainer(
                width: Get.width,
                color: Colors.white,
                spread: 2,
                depth: 20,
                borderRadius: 10,
                emboss: true,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    // override textfield's icon color when selected
                    primaryColor: AppConstants.APP_THEME_COLOR,
                  ),
                  child: TextFormField(
                      controller: textEditingController,
                      onChanged: (text) {
                        ontextChange(text);
                      },
                      obscureText: suffixIcon == null
                          ? false
                          : controller.obscureText.value,
                      autofocus: false,
                      style: textstyle,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: icon,
                          suffixIcon: suffixIcon == null
                              ? null
                              : IconButton(
                                  icon: suffixIcon, onPressed: onpress),
                          contentPadding: EdgeInsets.zero,
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          hintText: hintText,
                          hintStyle: textstyle)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle textstyle = TextStyle(
    color: Color(0xff6A6A6A), fontSize: 18, fontWeight: FontWeight.w500);
