class BidSubmitResponse {
  int status;
  String msg;
  Details details;

  BidSubmitResponse({this.status, this.msg, this.details});

  BidSubmitResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class Details {
  String id;
  String auctionId;
  String userId;
  String bidStatus;
  String created;
  String lastUpdated;

  Details(
      {this.id,
      this.auctionId,
      this.userId,
      this.bidStatus,
      this.created,
      this.lastUpdated});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auctionId = json['auction_id'];
    userId = json['user_id'];
    bidStatus = json['bid_status'];
    created = json['created'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auction_id'] = this.auctionId;
    data['user_id'] = this.userId;
    data['bid_status'] = this.bidStatus;
    data['created'] = this.created;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}
