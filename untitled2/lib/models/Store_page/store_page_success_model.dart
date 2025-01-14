import 'package:untitled2/models/Store_page/store_page_model.dart';

class StorePageSuccessModel extends StorePageModel {
  int? pageId;
  String? pageName;
  int? storeId;
  String? storeName;
  String? storeImage;
  bool? isAddToFavoraite;
  int? rate;
  List<StorePageTypesDto>? storePageTypesDto;
  List<StorePageProductsDto>? storePageProductsDto;

  StorePageSuccessModel(
      {this.pageId,
      this.pageName,
      this.storeId,
      this.storeName,
      this.storeImage,
      this.isAddToFavoraite,
      this.rate,
      this.storePageTypesDto,
      this.storePageProductsDto});

  StorePageSuccessModel.fromJson(Map<String, dynamic> json) {
    pageId = json['pageId'];
    pageName = json['pageName'];
    storeId = json['storeId'];
    storeName = json['storeName'];
    storeImage = json['storeImage'];
    isAddToFavoraite = json['isAddToFavoraite'];
    rate = json['rate'];
    if (json['storePageTypesDto'] != null) {
      storePageTypesDto = <StorePageTypesDto>[];
      json['storePageTypesDto'].forEach((v) {
        storePageTypesDto!.add(StorePageTypesDto.fromJson(v));
      });
    }
    if (json['storePageProductsDto'] != null) {
      storePageProductsDto = <StorePageProductsDto>[];
      json['storePageProductsDto'].forEach((v) {
        storePageProductsDto!.add(StorePageProductsDto.fromJson(v));
      });
    }
  }
}

class StorePageTypesDto {
  int? storeTypeId;
  String? storeTypeName;
  String? storeTypeImage;

  StorePageTypesDto(
      {this.storeTypeId, this.storeTypeName, this.storeTypeImage});

  StorePageTypesDto.fromJson(Map<String, dynamic> json) {
    storeTypeId = json['storeTypeId'];
    storeTypeName = json['storeTypeName'];
    storeTypeImage = json['storeTypeImage'];
  }
}

class StorePageProductsDto {
  String? productId;
  String? productName;
  int? productPrice;
  String? productImage;
  String? productRate;
  String? productQuantity;
  bool? isAddToFavoraite;
  int? storeTypeId;

  StorePageProductsDto(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productImage,
      this.productRate,
      this.productQuantity,
      this.isAddToFavoraite,
      this.storeTypeId});

  StorePageProductsDto.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productImage = json['productImage'];
    productRate = json['productRate'];
    productQuantity = json['productQuantity'];
    isAddToFavoraite = json['isAddToFavoraite'];
    storeTypeId = json['storeTypeId'];
  }
}
