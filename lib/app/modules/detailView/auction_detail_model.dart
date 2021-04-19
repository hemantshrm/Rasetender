class AuctionDetailModel {
  AuctionDetail auctionDetail;
  int status;
  String msg;

  AuctionDetailModel({this.auctionDetail, this.status, this.msg});

  AuctionDetailModel.fromJson(Map<String, dynamic> json) {
    auctionDetail = json['auction_detail'] != null
        ? new AuctionDetail.fromJson(json['auction_detail'])
        : null;
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auctionDetail != null) {
      data['auction_detail'] = this.auctionDetail.toJson();
    }
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class AuctionDetail {
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
  Null image;

  AuctionDetail(
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

  AuctionDetail.fromJson(Map<String, dynamic> json) {
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
