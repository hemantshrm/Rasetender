import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:scrap_bid/app/modules/detailView/auction_detail_model.dart';
import 'package:scrap_bid/app/modules/detailView/bid_submit_model.dart';
import 'package:scrap_bid/app/modules/detailView/providers/auction_detail_provider.dart';
import 'package:scrap_bid/app/modules/detailView/bid_submit_response.dart';

class DetailViewController extends GetxController {
  var isLoading = true.obs;
  var apiData =
      AuctionDetailModel(auctionDetail: AuctionDetail(materialImage: '')).obs;
  AuctionDetailProvider bidsubmitprovider = AuctionDetailProvider();

  @override
  void onInit() {
    fetchDetailView();
    super.onInit();
  }

  void fetchDetailView() async {
    try {
      isLoading(true);
      await AuctionDetailProvider.fetchDetailviewData().then((resp) {
        if (resp != null) {
          apiData.value = resp;
        }
      }, onError: (err) {});
    } finally {
      isLoading(false);
    }
  }

// TODO : STORE THE AUCTION ID AND USERID
  Future<void> bidSubmit() async {
    try {
      BidSubmitModel _model =
          BidSubmitModel(userId: "", auctionId: Get.arguments);

      BidSubmitResponse response = await bidsubmitprovider
          .postBidSubmit(_model)
          .then((value) => handleApi(value));
      print(response.toString());
    } catch (e) {
      print(e);
    }
  }
}

handleApi(BidSubmitResponse response) {
  if (response.status == 1) {


  } else {
    Get.defaultDialog(
      titleStyle: GoogleFonts.montserrat(color: Colors.green),
      content: Text(
        "${response.msg}",
        textAlign: TextAlign.center,
        textScaleFactor: 1.3,
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


