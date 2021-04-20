import 'dart:convert';

import 'package:get/get.dart';
import 'package:scrap_bid/app/data/constants.dart';
import 'package:http/http.dart' as http;
import 'package:scrap_bid/app/modules/detailView/bid_submit_model.dart';
import 'package:scrap_bid/app/modules/detailView/bid_submit_response.dart';
import '../auction_detail_model.dart';

class AuctionDetailProvider extends GetConnect {
  AuctionDetailModel data = AuctionDetailModel();

  static var client = http.Client();

  static Future<AuctionDetailModel> fetchDetailviewData() async {
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

//=======================================================================================

  Future<BidSubmitResponse> postBidSubmit(BidSubmitModel _model) async {
    var body = json.encode(_model.toJson());

    var response = await http.post(
        Uri.parse('${AppConstants.BASE_URL + AppConstants.BID_SUBMIT_URL}'),
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    BidSubmitResponse _value = BidSubmitResponse.fromJson(
      jsonDecode(response.body),
    );
    print("${response.statusCode}");
    print("${response.body}");

    return _value;
  }
}
