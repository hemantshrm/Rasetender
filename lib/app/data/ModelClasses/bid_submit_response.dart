class BidSubmitResponse {
  int _status;
  String _msg;
  Details _data;

  BidSubmitResponse({int status, String msg, Details data}) {
    this._status = status;
    this._msg = msg;
    this._data = data;
  }

  int get status => _status;
  set status(int status) => _status = status;
  String get msg => _msg;
  set msg(String msg) => _msg = msg;
  Details get data => _data;
  set data(Details data) => _data = data;

  BidSubmitResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _msg = json['msg'];
    _data = json['data'] != null ? new Details.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['msg'] = this._msg;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Details {
  String _id;
  String _userId;
  String _auctionId;
  String _bidStatus;
  String _applied;
  String _created;
  String _lastUpdated;

  Details(
      {String id,
        String userId,
        String auctionId,
        String bidStatus,
        String applied,
        String created,
        String lastUpdated}) {
    this._id = id;
    this._userId = userId;
    this._auctionId = auctionId;
    this._bidStatus = bidStatus;
    this._applied = applied;
    this._created = created;
    this._lastUpdated = lastUpdated;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get auctionId => _auctionId;
  set auctionId(String auctionId) => _auctionId = auctionId;
  String get bidStatus => _bidStatus;
  set bidStatus(String bidStatus) => _bidStatus = bidStatus;
  String get applied => _applied;
  set applied(String applied) => _applied = applied;
  String get created => _created;
  set created(String created) => _created = created;
  String get lastUpdated => _lastUpdated;
  set lastUpdated(String lastUpdated) => _lastUpdated = lastUpdated;

  Details.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _auctionId = json['auction_id'];
    _bidStatus = json['bid_status'];
    _applied = json['applied'];
    _created = json['created'];
    _lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['auction_id'] = this._auctionId;
    data['bid_status'] = this._bidStatus;
    data['applied'] = this._applied;
    data['created'] = this._created;
    data['last_updated'] = this._lastUpdated;
    return data;
  }
}