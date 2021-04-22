import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/detailView/controllers/detail_view_controller.dart';
import 'package:scrap_bid/app/modules/login/views/login_view.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';

class SubmitBidScreen extends StatefulWidget {
  @override
  _SubmitBidScreenState createState() => _SubmitBidScreenState();
}

class _SubmitBidScreenState extends State<SubmitBidScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation heartBeatAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    heartBeatAnimation =
        Tween<double>(begin: 80, end: 100).animate(_animationController);
    _animationController
        .forward()
        .whenComplete(() => _animationController.reverse());
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
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
                child: CircleAvatar(
                  radius: heartBeatAnimation.value,
                  backgroundColor: AppConstants.APP_THEME_COLOR,
                  child: Icon(
                    Icons.done,
                    size: 90,
                    color: Colors.white,
                  ),
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
