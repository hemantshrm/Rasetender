class ResponseAuctionList {
  List<AuctionList> auctionList;
  int status;
  String msg;

  ResponseAuctionList({this.auctionList, this.status, this.msg});

  ResponseAuctionList.fromJson(Map<String, dynamic> json) {
    try {
      if (json['auction_list'] != null) {
        auctionList = new List<AuctionList>();
        json['auction_list'].forEach((v) {
          auctionList.add(new AuctionList.fromJson(v));
        });
      }
    } catch (e) {}
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auctionList != null) {
      data['auction_list'] = this.auctionList.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class AuctionList {
  String id;
  String materialCode;
  String plantCode;
  String materialDescription;
  String materialImage;
  String materialType;
  String materialWeight;
  String auctionStartDate;
  String auctionCloseDate;
  String created;
  dynamic image;

  AuctionList(
      {this.id,
      this.materialCode,
      this.plantCode,
      this.materialDescription,
      this.materialImage,
      this.materialType,
      this.materialWeight,
      this.auctionStartDate,
      this.auctionCloseDate,
      this.created,
      this.image});

  AuctionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialCode = json['material_code'];
    plantCode = json['plant_code'];
    materialDescription = json['material_description'];
    materialImage = json['material_image'];
    materialType = json['material_type'];
    materialWeight = json['material_weight'];
    auctionStartDate = json['auction_start_date'];
    auctionCloseDate = json['auction_close_date'];
    created = json['created'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['material_code'] = this.materialCode;
    data['plant_code'] = this.plantCode;
    data['material_description'] = this.materialDescription;
    data['material_image'] = this.materialImage;
    data['material_type'] = this.materialType;
    data['material_weight'] = this.materialWeight;
    data['auction_start_date'] = this.auctionStartDate;
    data['auction_close_date'] = this.auctionCloseDate;
    data['created'] = this.created;
    data['image'] = this.image;
    return data;
  }
}
