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
  String bidStatus;
  String created;
  String lastUpdated;

  Data(
      {this.id,
      this.auctionId,
      this.userId,
      this.bidStatus,
      this.created,
      this.lastUpdated});

  Data.fromJson(Map<String, dynamic> json) {
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
