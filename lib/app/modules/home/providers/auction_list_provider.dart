import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrap_bid/app/data/ModelClasses/auction_list_model.dart';
import 'package:scrap_bid/app/data/constants.dart';

class AuctionListProvider {
  static var client = http.Client();

  static Future<List<AuctionList>> fetchData(String id, {bidStatus}) async {
    var lastUrl;
    if (bidStatus == null) {
      lastUrl = '?user_id=${id}';
    } else {
      lastUrl = '?user_id=${id}&bid_status=${bidStatus}';
    }

    http.Response response = await http.get(
      Uri.parse(
          '${AppConstants.BASE_URL + AppConstants.AUCTION_LIST_URL + lastUrl}'),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var auctionList = ResponseAuctionList.fromJson(jsonDecode(data));
      return auctionList.auctionList;
    }
  }
}
