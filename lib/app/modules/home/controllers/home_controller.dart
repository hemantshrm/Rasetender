import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/ModelClasses/bid_result_model.dart';
import 'package:scrap_bid/app/data/ModelClasses/login_response_model.dart';
import 'package:scrap_bid/app/modules/detailView/providers/auction_detail_provider.dart';
import 'file:///C:/Users/vndsh/scrap_bid/lib/app/data/ModelClasses/auction_list_model.dart';
import 'package:scrap_bid/app/modules/home/providers/auction_list_provider.dart';
import 'file:///C:/Users/vndsh/scrap_bid/lib/app/data/ModelClasses/result_response_model.dart';
import 'package:scrap_bid/app/modules/home/views/resultScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with StateMixin<List<AuctionList>> {
  var isLoading = true.obs;
  var apiData = <AuctionList>[].obs;
  SharedPreferences pref;
  AuctionDetailProvider resultProvider = AuctionDetailProvider();
  var userData = UserData().obs;

  @override
  Future<void> onInit() async {
    fetchProducts();
    super.onInit();
    pref = await SharedPreferences.getInstance();
    Map json = jsonDecode(pref.getString('userData'));
    UserData user = UserData.fromJson(json);

    if (user != null) {
      userData.value = user;
    }
  }

// AUCTION LIST API CALL
  void fetchProducts() async {
    try {
      isLoading(true);
      await AuctionListProvider.fetchData().then((resp) {
        change(resp, status: RxStatus.success());
        if (resp != null) {
          apiData.addAll(resp);
        }
      }, onError: (err) {
        change(
          null,
          status: RxStatus.error(err.toString()),
        );
      });
    } finally {
      isLoading(false);
    }
  }

  // RESULT API CALL
  Future<void> getResult() async {
    try {
      BidResultModel _model =
          BidResultModel(userId: userData.value.id, auctionId: '');

      ResultResponseModel response = await resultProvider
          .postBidResult(_model)
          .then((value) => handleApi(value));
      print(response.toString());
    } catch (e) {
      print(e);
    }
  }
}

handleApi(ResultResponseModel response) {
  if (response.status == 0.toString()) {
    Get.to(ResultScreen(response));
  } else {
    Get.defaultDialog(
      title: "Sorry",
      titleStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
      content: Text(
        "${response.msg}",
        textAlign: TextAlign.center,
        textScaleFactor: 1.1,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Okay"),
        ),
      ],
    );
  }
}
