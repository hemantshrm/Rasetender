import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/Util/loader.dart';
import 'package:scrap_bid/app/data/ModelClasses/auction_list_model.dart';
import 'package:scrap_bid/app/data/ModelClasses/bid_result_model.dart';
import 'package:scrap_bid/app/data/ModelClasses/login_response_model.dart';
import 'package:scrap_bid/app/data/ModelClasses/result_response_model.dart';
import 'package:scrap_bid/app/modules/detailView/providers/auction_detail_provider.dart';

import 'package:scrap_bid/app/modules/home/providers/auction_list_provider.dart';

import 'package:scrap_bid/app/modules/home/views/resultScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with StateMixin<List<AuctionList>> {
  var isLoading = true.obs;
  var apiData = <AuctionList>[].obs;
  SharedPreferences pref;
  AuctionDetailProvider resultProvider = AuctionDetailProvider();
  var userData = UserData().obs;
  var header = 'Auctions'.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    pref = await SharedPreferences.getInstance();
    Map json = jsonDecode(pref.getString('userData'));
    UserData user = UserData.fromJson(json);

    if (user != null) {
      userData.value = user;
      fetchProducts(userData.value.id);
    }
  }

// AUCTION LIST API CALL
  void fetchProducts(String id, {bidstatus}) async {
    if (bidstatus == 1) {
      header.value = 'Result Awaited';
    } else if (bidstatus == 2) {
      header.value = 'Bids Won';
    } else if (bidstatus == 3) {
      header.value = 'Bids Lost';
    } else {
      header.value = 'Auctions';
    }
    try {
      isLoading(true);
      await AuctionListProvider.fetchData(id, bidStatus: bidstatus).then(
          (resp) {
        change(resp, status: RxStatus.success());

        if (resp != null) {
          apiData.clear();
          apiData.addAll(resp);
        }else{
          apiData.clear();
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

  clearPrefs() async {
    pref.clear();
    await pref.remove('userData');
    print(pref.getString('userData'));
  }

  // RESULT API CALL
  Future<void> getResult(BuildContext context) async {
    onLoading(context);
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
    Get.back();
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
