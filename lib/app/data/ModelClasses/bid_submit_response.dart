class BidSubmitResponse {
  int status;
  String msg;
  Data data;

  BidSubmitResponse({this.status, this.msg, this.data});

  BidSubmitResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String id;
  String auctionId;
  String userId;
  String bidAmount;
  String bidStatus;
  String applied;
  String created;
  String lastUpdated;

  Data(
      {this.id,
      this.auctionId,
      this.userId,
      this.bidAmount,
      this.bidStatus,
      this.applied,
      this.created,
      this.lastUpdated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auctionId = json['auction_id'];
    userId = json['user_id'];
    bidAmount = json['bid_amount'];
    bidStatus = json['bid_status'];
    applied = json['applied'];
    created = json['created'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auction_id'] = this.auctionId;
    data['user_id'] = this.userId;
    data['bid_amount'] = this.bidAmount;
    data['bid_status'] = this.bidStatus;
    data['applied'] = this.applied;
    data['created'] = this.created;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}
