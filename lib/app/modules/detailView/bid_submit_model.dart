class BidSubmitModel {
  String userId;
  String auctionId;

  BidSubmitModel({this.userId, this.auctionId});

  BidSubmitModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    auctionId = json['auction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['auction_id'] = this.auctionId;
    return data;
  }
}
