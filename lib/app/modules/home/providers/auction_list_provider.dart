import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scrap_bid/app/data/constants.dart';
import 'file:///C:/Users/vndsh/scrap_bid/lib/app/data/ModelClasses/auction_list_model.dart';

class AuctionListProvider {
  static var client = http.Client();

  static Future<List<AuctionList>> fetchData() async {
    http.Response response = await http.get(
        Uri.parse('${AppConstants.BASE_URL + AppConstants.AUCTION_LIST_URL}'),
        headers: {
          "Content-Type": "application/json",
        });
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var auctionList = ResponseAuctionList.fromJson(jsonDecode(data));
      return auctionList.auctionList;
    }
  }
}
