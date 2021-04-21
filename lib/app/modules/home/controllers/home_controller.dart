import 'dart:convert';

import 'package:get/get.dart';
import 'package:scrap_bid/app/modules/home/auction_list_model.dart';
import 'package:scrap_bid/app/modules/home/providers/auction_list_provider.dart';
import 'package:scrap_bid/app/modules/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with StateMixin<List<AuctionList>> {
  var isLoading = true.obs;
  var apiData = <AuctionList>[].obs;
  SharedPreferences pref;

  var userData = UserData().obs;

  @override
  Future<void> onInit() async {



    fetchProducts();
    super.onInit();
    pref = await SharedPreferences.getInstance();
    Map json = jsonDecode(pref.getString('userData'));
    var user = UserData.fromJson(json);

    if (user != null) {
      userData.value = user;
    }
  }

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
}
