import 'package:get/get.dart';
import 'package:scrap_bid/app/modules/detailView/auction_detail_model.dart';
import 'package:flutter/services.dart';
import 'package:scrap_bid/app/modules/detailView/providers/auction_detail_provider.dart';

class DetailViewController extends GetxController {
  var isLoading = true.obs;
  var apiData = AuctionDetailModel().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      await AuctionDetailProvider.fetchData().then((resp) {
        if (resp != null) {
          apiData.value = resp;
        }
      }, onError: (err) {});
    } finally {
      isLoading(false);
    }
  }
}
