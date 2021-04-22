import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: AppConstants.BACKGROUND_COLOR_BOTTOM,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
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
                    child: Image.asset(
                      'assets/images/icon.png',
                      fit: BoxFit.contain,
                    ),
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
                  LoginFields(
                    icon: Icon(Icons.email_outlined),
                    hintText: "Your email id",
                    heading: "Email",
                    hidetext: false,
                    suffixIcon: null,
                    onpress: () {},
                    ontextChange: (text) {
                      controller.setEmailString(text);
                    },
                    textEditingController: controller.email,
                    keyboard: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => LoginFields(
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
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.FORGOT_PASS);
                      },
                      child: Text("Forgot Password?",
                          style: textstyle.copyWith(
                              fontSize: 16, color: Color(0xff919294))),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MainButton(
                    title: "Login",
                    onPress: () {
                      controller.validate();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ? ',
                        style: textstyle.copyWith(
                          fontSize: 16,
                          color: Color(0xff919294),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGN_UP);
                        },
                        child: Text(
                          "Sign Up",
                          style: textstyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppConstants.TEXT_FIELD_HEADER),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  MainButton({this.title, this.onPress});

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: Get.width, height: Get.height / 13),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: AppConstants.APP_THEME_COLOR,
        ),
        child: Center(
            child: Text(
          title,
          style: textstyle.copyWith(color: Colors.white, fontSize: 23),
        )),
      ),
    );
  }
}

class LoginFields extends StatelessWidget {
  Function(String) ontextChange;

  LoginFields(
      {this.icon,
      this.hintText,
      this.heading,
      this.suffixIcon,
      this.hidetext,
      this.onpress,
      this.ontextChange,
      this.textEditingController,
      this.keyboard});

  final Function onpress;
  final String hintText, heading;
  final Icon icon;
  final Icon suffixIcon;
  final bool hidetext;
  final TextInputType keyboard;
  TextEditingController textEditingController;
  final LoginController controller =
      Get.put<LoginController>(LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            primaryColor: AppConstants.APP_THEME_COLOR,
          ),
          child: TextFormField(
              keyboardType: keyboard,
              cursorColor: AppConstants.APP_THEME_COLOR,
              textInputAction: TextInputAction.unspecified,
              maxLines: 1,
              controller: textEditingController,
              onChanged: (text) {
                ontextChange(text);
              },
              obscureText:
                  suffixIcon == null ? false : controller.obscureText.value,
              autofocus: false,
              style: textstyle,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  labelText: heading,
                  labelStyle: GoogleFonts.ubuntu(
                    color: AppConstants.TEXT_FIELD_HEADER,
                    fontSize: 20,
                  ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    borderSide: BorderSide(color: AppConstants.APP_THEME_COLOR),
                  ),
                  prefixIcon: icon,
                  suffixIcon: suffixIcon == null
                      ? null
                      : IconButton(icon: suffixIcon, onPressed: onpress),
                  // hintText: hintText,
                  contentPadding: EdgeInsets.only(left: 2, bottom: 4),
                  focusedBorder: UnderlineInputBorder(),
                  hintStyle: textstyle)),
        ),
      ],
    );
  }
}

TextStyle textstyle = GoogleFonts.ubuntu(
    color: Color(0xff6A6A6A), fontSize: 20, fontWeight: FontWeight.w500);
