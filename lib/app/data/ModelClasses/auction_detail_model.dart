class AuctionDetailModel {
  int status;
  String msg;
  AuctionDetail auctionDetail;
  int applied;

  AuctionDetailModel({this.status, this.msg, this.auctionDetail, this.applied});

  AuctionDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    auctionDetail = json['auction_detail'] != null
        ? new AuctionDetail.fromJson(json['auction_detail'])
        : null;
    applied = json['applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.auctionDetail != null) {
      data['auction_detail'] = this.auctionDetail.toJson();
    }
    data['applied'] = this.applied;
    return data;
  }
}

class AuctionDetail {
  String id;
  String materialCode;
  String plantCode;
  String materialDescription;
  String baseUrl;
  String materialImage;
  String materialType;
  String materialWeight;
  String auctionStartDate;
  String auctionCloseDate;
  String created;
  String publishStatus;

  AuctionDetail(
      {this.id,
      this.materialCode,
      this.plantCode,
      this.materialDescription,
      this.baseUrl,
      this.materialImage,
      this.materialType,
      this.materialWeight,
      this.auctionStartDate,
      this.auctionCloseDate,
      this.created,
      this.publishStatus});

  AuctionDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialCode = json['material_code'];
    plantCode = json['plant_code'];
    materialDescription = json['material_description'];
    baseUrl = json['base_url'];
    materialImage = json['material_image'];
    materialType = json['material_type'];
    materialWeight = json['material_weight'];
    auctionStartDate = json['auction_start_date'];
    auctionCloseDate = json['auction_close_date'];
    created = json['created'];
    publishStatus = json['publish_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['material_code'] = this.materialCode;
    data['plant_code'] = this.plantCode;
    data['material_description'] = this.materialDescription;
    data['base_url'] = this.baseUrl;
    data['material_image'] = this.materialImage;
    data['material_type'] = this.materialType;
    data['material_weight'] = this.materialWeight;
    data['auction_start_date'] = this.auctionStartDate;
    data['auction_close_date'] = this.auctionCloseDate;
    data['created'] = this.created;
    data['publish_status'] = this.publishStatus;
    return data;
  }
}
