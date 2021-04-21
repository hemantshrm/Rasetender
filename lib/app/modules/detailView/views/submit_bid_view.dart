import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/detailView/controllers/detail_view_controller.dart';
import 'package:scrap_bid/app/modules/login/views/login_view.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class SubmitBidScreen extends GetView<DetailViewController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Future.value(false);
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/images/done.png"),
                ),
              ),
              SizedBox(
                height: Get.height / 10,
              ),
              Text(
                "You have Successfully submitted the bid.",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
              Spacer(),
              MainButton(
                title: "Continue",
                onPress: () {
                  Get.offAndToNamed(Routes.HOME);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
