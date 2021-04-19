import 'dart:convert';

import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:http/http.dart' as http;
import '../auction_detail_model.dart';

class AuctionDetailProvider extends GetConnect {
  AuctionDetailModel data = AuctionDetailModel();

  static var client = http.Client();

  static Future<AuctionDetailModel> fetchData() async {
    http.Response response = await http.get(
        Uri.parse('${AppConstants.BASE_URL + AppConstants.AUCTION_DETAIL_URL}'),
        headers: {
          "Content-Type": "application/json",
        });
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return AuctionDetailModel.fromJson(jsonDecode(data));
    }
  }
}
