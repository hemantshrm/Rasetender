class BidSubmitModel {
  String userId;
  String auctionId;
  String bidAmount;

  BidSubmitModel({this.userId, this.auctionId, this.bidAmount});

  BidSubmitModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    auctionId = json['auction_id'];
    bidAmount = json['bid_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['auction_id'] = this.auctionId;
    data['bid_amount'] = this.bidAmount;
    return data;
  }
}
