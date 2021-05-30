import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/Util/loader.dart';
import 'package:scrap_bid/app/data/ModelClasses/auction_detail_response.dart';
import 'package:scrap_bid/app/data/ModelClasses/bid_submit_model.dart';

import 'package:scrap_bid/app/data/ModelClasses/auction_detail_model.dart';
import 'package:scrap_bid/app/data/ModelClasses/bid_submit_response.dart';
import 'package:scrap_bid/app/data/ModelClasses/login_response_model.dart';
import 'package:scrap_bid/app/modules/detailView/providers/auction_detail_provider.dart';

import 'package:scrap_bid/app/modules/detailView/views/submit_bid_view.dart';
import 'package:scrap_bid/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailViewController extends GetxController {
  var isLoading = true.obs;
  var apiData = AuctionDetail().obs;
  AuctionDetailProvider bidSubmitProvider = AuctionDetailProvider();
  SharedPreferences _preferences;

  getImagesfromarray() {
    if (apiData.value.materialImage != null) {
      print(apiData.value.materialImage[0].toString());
      return apiData.value.materialImage[0];
    } else {
      return '';
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _preferences = await SharedPreferences.getInstance();
    fetchDetailView();
  }

  handleBtnText(id) {
    if (id == 1) {
      return 'Result Awaited';
    } else if (id == 2) {
      return 'Bid Won';
    } else if (id == 3) {
      return 'Bid Lost';
    } else
      return "I am Interested ";
  }

//===========================================================================================
  void fetchDetailView() async {
    try {
      isLoading(true);
      Map userMap = await jsonDecode(_preferences.getString('userData'));
      UserData user = UserData.fromJson(userMap);

      AuctionDetailBody _model =
          AuctionDetailBody(userId: user.id, auctionId: Get.arguments);
      await AuctionDetailProvider.fetchDetailviewData(_model).then((resp) {
        if (resp.auctionDetail != null) {
          apiData.value = resp.auctionDetail;
        }
      }, onError: (err) {
        print(err);
      });
    } finally {
      isLoading(false);
    }
  }

//=============================================================

  Future<void> bidSubmit(BuildContext context, String id) async {
    onLoading(context);
    Map userMap = await jsonDecode(_preferences.getString('userData'));
    UserData user = UserData.fromJson(userMap);

    try {
      BidSubmitModel _model = BidSubmitModel(userId: user.id, auctionId: id);

      BidSubmitResponse response = await bidSubmitProvider
          .postBidSubmit(_model)
          .then((value) => handleApi(value, context));
      print(response.toString());
    } catch (e) {
      print(e);
    }
  }
}

handleApi(BidSubmitResponse response, context) {
  if (response.status == 1) {
    Get.offAllNamed(Routes.DETAIL_VIEW);
    Get.to(() => SubmitBidScreen());
  }
}
